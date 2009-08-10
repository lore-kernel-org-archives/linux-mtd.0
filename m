Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MaPSU-0001cc-Lx
	for linux-mtd@lists.infradead.org; Mon, 10 Aug 2009 07:38:23 +0000
Subject: Re: patch for mkfs.ubifs devtable.c increment in dev_table is
	wrongly interpreted
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Daniel Neukomm <Neukomm@vtxmail.ch>
In-Reply-To: <4A759CF3.2010908@vtxmail.ch>
References: <4A759CF3.2010908@vtxmail.ch>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 10 Aug 2009 10:36:39 +0300
Message-Id: <1249889799.19638.15.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2009-08-02 at 16:04 +0200, Daniel Neukomm wrote:
> patch for mkfs.ubifs devtable.c increment in dev_table is wrongly 
> interpreted
> 
> with the device table one can add /dev entries to the root file system 
> image.
> The device table file contains among others the fields minor, start, 
> increment and count.
> If there is an entry with minor=0 start=0 increment =32 and count=4 the 
> mkfs.ubifs makes
> 128 device entries, with minor numbers from 0 to 127
> The correct version makes 4 entries with minor number 0,32,64,96.
> 
> /dev/mtd c 640 0 0 90 0 0  2 7
> This gives 14 devices /dev/mtdXX instead of  7 devices.
> Due to this error mtd_debug info /dev/mtd3 delivers the information of 
> /dev/mtd1 instead of. 
> 
> diff --git a/mkfs.ubifs/devtable.c b/mkfs.ubifs/devtable.c
> index 236a6e7..e2d96dc 100644
> --- a/mkfs.ubifs/devtable.c
> +++ b/mkfs.ubifs/devtable.c
> @@ -248,7 +248,7 @@ static int interpret_table_entry(const char *line)
>                         goto out_free;
>                 }
>         } else {
> -               int i, num = start + increment * count, len = 
> strlen(name) + 20;
> +               int i, num = start + count, len = strlen(name) + 20;
>                 char *nm;
> 
>                 for (i = start; i < num; i++) {
> @@ -262,7 +262,7 @@ static int interpret_table_entry(const char *line)
>                         nh_elt->mode = mode;
>                         nh_elt->uid = uid;
>                         nh_elt->gid = gid;
> -                       nh_elt->dev = makedev(major, minor + i - start);
> +                       nh_elt->dev = makedev(major, minor + (i - 
> start)*increment);
> 
>                         nm = malloc(len);
>                         if (!nm) {

Hi,

thanks for the patch. Are you planning to re-send it properly with
no line-wrapping and with signed-off-by?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
