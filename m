Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTa8W-0003jB-Sn
 for linux-mtd@lists.infradead.org; Mon, 15 Sep 2014 17:32:28 +0000
Received: by mail-pa0-f46.google.com with SMTP id kq14so6873101pab.5
 for <linux-mtd@lists.infradead.org>; Mon, 15 Sep 2014 10:32:03 -0700 (PDT)
Date: Mon, 15 Sep 2014 10:31:52 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Wei.Yang@windriver.com
Subject: Re: [PATCH v1] mtdinfo: Initialize reginfo variable before invoking
 mtd_regioninfo
Message-ID: <20140915173152.GA14832@ld-irv-0074>
References: <1407294015-27884-1-git-send-email-Wei.Yang@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1407294015-27884-1-git-send-email-Wei.Yang@windriver.com>
Cc: linux-mtd@lists.infradead.org, w90p710@gmail.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Yang,

On Wed, Aug 06, 2014 at 11:00:15AM +0800, Wei.Yang@windriver.com wrote:
> From: Yang Wei <Wei.Yang@windriver.com>
> 
> If not initializing this variable, its value would be random. So
> once the value of the regionindex field of region_info_user structure
> is greater than mtd->numeraseregions. ioctl,which comes with MEMGETREGIONINFO,
> would return -EINVAL
> 
> Signed-off-by: Yang Wei <Wei.Yang@windriver.com>
> ---
>  ubi-utils/mtdinfo.c |    2 ++
>  1 file changed, 2 insertions(+)
> 
> 		Hi Guys,
> 
> 		I got the following errors when running "mtdinfo /dev/mtd0" on Cavium 6100 board,
> 
> 
> 		root@CN61XX:~# mtdinfo /dev/mtd0
> 		mtd0
> 		Name:                           phys_mapped_flash
> 		Type:                           nor
> 		Eraseblock size:                65536 bytes, 64.0 KiB
> 		Amount of eraseblocks:          128 (8388608 bytes, 8.0 MiB)
> 		Minimum input/output unit size: 1 byte
> 		Sub-page size:                  1 byte
> 		Additional erase regions:       0
> 		Character device major/minor:   90:0
> 		Bad blocks are allowed:         false
> 		Device is writable:             true
> 		libmtd: error!: MEMGETREGIONINFO ioctl failed for erase region 0
> 		        error 22 (Invalid argument)
> 		Eraseblock region 0:  info is unavailable
> 		libmtd: error!: MEMGETREGIONINFO ioctl failed for erase region 1
> 		        error 22 (Invalid argument)
> 		Eraseblock region 1:  info is unavailable

These error messages look deceptive. The problem is that while
mtd_regioninfo() takes a region index parameter, it only uses it for
printing the error message; its value is not actually propagated to the
ioctl().

> 
> 		This patch is to fix the above errors. I have already verified it
> 
> 		root@CN61XX:~# ./mtdinfo /dev/mtd0
> 		mtd0
> 		Name:                           phys_mapped_flash
> 		Type:                           nor
> 		Eraseblock size:                65536 bytes, 64.0 KiB
> 		Amount of eraseblocks:          128 (8388608 bytes, 8.0 MiB)
> 		Minimum input/output unit size: 1 byte
> 		Sub-page size:                  1 byte
> 		Additional erase regions:       0
> 		Character device major/minor:   90:0
> 		Bad blocks are allowed:         false
> 		Device is writable:             true
> 		Eraseblock region 0:  offset: 0 size: 0x10000 numblocks: 0x7f
> 		Eraseblock region 1:  offset: 0 size: 0x10000 numblocks: 0x7f

These last two lines look wrong. Why would the device have two identical
erase regions? In fact, it looks like your patch just means that we'll
call ioctl(MEMGETREGIONINFO) repeatedly for region 0, instead of once
for each indexed region.

> 
> 		root@CN61XX:~#
> 
> 
> diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
> index 5ac95aa..a70db00 100644
> --- a/ubi-utils/mtdinfo.c
> +++ b/ubi-utils/mtdinfo.c
> @@ -253,6 +253,8 @@ static void print_region_info(const struct mtd_dev_info *mtd)
>  	if (!args.node || (!args.map && mtd->region_cnt == 0))
>  		return;
>  
> +	memset(&reginfo, 0, sizeof(region_info_t));
> +

This might be good for security (to make sure that we never leak garbage
or use garbage stack data), but it doesn't actually fix anything.


>  	/* First open the device so we can query it */
>  	fd = open(args.node, O_RDONLY | O_CLOEXEC);
>  	if (fd == -1) {

I think you need a patch like this instead (untested):

diff --git a/lib/libmtd.c b/lib/libmtd.c
index aff4c8be01b5..a6665f08018e 100644
--- a/lib/libmtd.c
+++ b/lib/libmtd.c
@@ -901,6 +901,8 @@ int mtd_regioninfo(int fd, int regidx, struct region_info_user *reginfo)
 		return -1;
 	}
 
+	reginfo->regionindex = regidx;
+
 	ret = ioctl(fd, MEMGETREGIONINFO, reginfo);
 	if (ret < 0)
 		return sys_errmsg("%s ioctl failed for erase region %d",
diff --git a/ubi-utils/mtdinfo.c b/ubi-utils/mtdinfo.c
index 5ac95aaabb8a..cd61105c5c01 100644
--- a/ubi-utils/mtdinfo.c
+++ b/ubi-utils/mtdinfo.c
@@ -253,6 +253,9 @@ static void print_region_info(const struct mtd_dev_info *mtd)
 	if (!args.node || (!args.map && mtd->region_cnt == 0))
 		return;
 
+	/* Just in case */
+	memset(&reginfo, 0, sizeof(reginfo));
+
 	/* First open the device so we can query it */
 	fd = open(args.node, O_RDONLY | O_CLOEXEC);
 	if (fd == -1) {

Brian
