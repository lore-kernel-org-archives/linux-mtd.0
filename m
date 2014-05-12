Received: from [2a01:4f8:131:30e2::2] (helo=nbd.name)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WjmQl-00023E-AF
 for linux-mtd@lists.infradead.org; Mon, 12 May 2014 09:21:56 +0000
Message-ID: <53709292.6070600@phrozen.org>
Date: Mon, 12 May 2014 11:21:22 +0200
From: John Crispin <john@phrozen.org>
MIME-Version: 1.0
To: Luka Perkov <luka@openwrt.org>
Subject: Re: [PATCH] UBI: add a ubi forced detach ioctl
References: <1399850250-24616-1-git-send-email-luka@openwrt.org>
 <CAFLxGvy+5udxOnRmEeKbHGr=z3a0H+vK07r+PbQdHiUkcJivQA@mail.gmail.com>
In-Reply-To: <CAFLxGvy+5udxOnRmEeKbHGr=z3a0H+vK07r+PbQdHiUkcJivQA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 John Crispin <blogic@openwrt.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Luka,

This is a ugly temporary patch that we carry around in openwrt until we
have a real fix. why are you trying to upstream this ?

Additionally the patch was written by Daniel and not me so the SoB is
wrong.

	John

On 12/05/2014 09:14, Richard Weinberger wrote:
> On Mon, May 12, 2014 at 1:17 AM, Luka Perkov <luka@openwrt.org> 
> wrote:
>> From: John Crispin <blogic@openwrt.org>
>> 
>> Signed-off-by: John Crispin <blogic@openwrt.org> Tested-by: Luka 
>> Perkov <luka@openwrt.org> CC: Artem Bityutskiy 
>> <dedekind1@gmail.com>
> 
> The changelog fails to describe why you need this new ioctl() and 
> what problem this patch is solving.
> 
>> --- drivers/mtd/ubi/cdev.c      | 7 +++++-- 
>> include/uapi/mtd/ubi-user.h | 1 + 2 files changed, 6 
>> insertions(+), 2 deletions(-)
>> 
>> diff --git a/drivers/mtd/ubi/cdev.c b/drivers/mtd/ubi/cdev.c 
>> index f54562a..dce1171 100644 --- a/drivers/mtd/ubi/cdev.c +++ 
>> b/drivers/mtd/ubi/cdev.c @@ -970,7 +970,7 @@ static long 
>> ubi_cdev_ioctl(struct file *file, unsigned int cmd, static long 
>> ctrl_cdev_ioctl(struct file *file, unsigned int cmd, unsigned 
>> long arg) { -       int err = 0; +       int err = 0, force = 0;
>>  void __user *argp = (void __user *)arg;
>> 
>> if (!capable(CAP_SYS_RESOURCE)) @@ -1020,6 +1020,9 @@ static
>> long ctrl_cdev_ioctl(struct file *file, unsigned int cmd, }
>> 
>> /* Detach an MTD device command */ +       case UBI_IOCFDET: + 
>> force = 1; +               /* fallthrough */ case UBI_IOCDET: { 
>> int ubi_num; @@ -1032,7 +1035,7 @@ static long 
>> ctrl_cdev_ioctl(struct file *file, unsigned int cmd, }
>> 
>> mutex_lock(&ubi_devices_mutex); -               err = 
>> ubi_detach_mtd_dev(ubi_num, 0); +               err = 
>> ubi_detach_mtd_dev(ubi_num, force); 
>> mutex_unlock(&ubi_devices_mutex); break; } diff --git 
>> a/include/uapi/mtd/ubi-user.h b/include/uapi/mtd/ubi-user.h
>> index 1927b0d..7600e18 100644 --- a/include/uapi/mtd/ubi-user.h
>> +++ b/include/uapi/mtd/ubi-user.h @@ -178,6 +178,7 @@ #define 
>> UBI_IOCATT _IOW(UBI_CTRL_IOC_MAGIC, 64, struct ubi_attach_req)
>> /* Detach an MTD device */ #define UBI_IOCDET 
>> _IOW(UBI_CTRL_IOC_MAGIC, 65, __s32) +#define UBI_IOCFDET 
>> _IOW(UBI_CTRL_IOC_MAGIC, 66, __s32)
>> 
>> /* ioctl commands of UBI volume character devices */
>> 
>> -- 1.9.2
>> 
>> ______________________________________________________ Linux MTD 
>> discussion mailing list 
>> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
> 
