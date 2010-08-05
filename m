Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oh519-0004eW-L2
	for linux-mtd@lists.infradead.org; Thu, 05 Aug 2010 18:18:12 +0000
Received: by fxm3 with SMTP id 3so3889666fxm.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 05 Aug 2010 11:18:10 -0700 (PDT)
Subject: Re: NAND ECC Layout, sysfs question
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <4C5AFA88.3040009@broadcom.com>
References: <4C5AFA88.3040009@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 05 Aug 2010 21:18:04 +0300
Message-Id: <1281032284.1175.45.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-08-05 at 10:53 -0700, Brian Norris wrote:
> Hello,
> 
> I'm trying to replace the following structure (in mtd-abi.h) and its 
> corresponding ioctl with a larger, dynamic form exported via sysfs. 
> We're running out of room in the eccpos and oobfree arrays on larger chips:

I personally hate that internal information like eccpos is exposed to
user-space. I think a good an not error-prone SW should be written in a
way the ECC is completely hidden and handled by driver. And it is better
not to use OOB.

But there may be people who want to use OOB. But then ECC and free space
in OOB should be considered as virtual contiguous array, and the driver
places it properly. It is not user-spaces' business to know where ECC
bytes are placed. There was some OOB mode for this, do not remember its
name.

Do you really need to know ECC layout? What for? Would be nice if
everything but the above mode of working with OOB / ECC would be
considered as legacy and died...

> #define MTD_MAX_OOBFREE_ENTRIES 8
> /*
>   * ECC layout control structure. Exported to userspace for
>   * diagnosis and to allow creation of raw images
>   */
> 
> struct nand_ecclayout {
>          __u32 eccbytes;
>          __u32 eccpos[64];
>          __u32 oobavail;
>          struct nand_oobfree oobfree[MTD_MAX_OOBFREE_ENTRIES];
> };
> 
> First, is it a smart idea to use sysfs?
> 
> Second, if we go with sysfs, there seem to be many potential ways to 
> structure the "eccpos" and "oobfree" arrays. Bearing in mind the 
> convention of either one entry per file or a space-separated array of 
> values as well as the file limit of PAGE_SIZE (approx. 4096 bytes?), 
> there are several options with which I'm having difficulty. Formats 
> could be as follows:
> 1) Single file: 0 1 2 3 6 7 10 12
> 2) Single file: 0-3 6-7 10 12
> 3) Multiple files:
>      file 0: 0 3
>      file 1: 6 7
>      file 2: 10 10
>      file 3: 12 12
> It seemed to me like (3) was the cleanest while ensuring we fit under 
> PAGE_SIZE even if the OOB gets to be 1000+ bytes, so no one ever has to 
> come back and redo this :) Unfortunately, directories and a dynamic 
> number of attributes/files aren't really straightforward, hence my next 
> questions...
> 
> Third, if I were to create directories under the "mtdX" sysfs directory, 
> what's the best way to do this? Explicitly creating and filling in a 
> kobject? Or creating a new "device"? Or are there other, better options?
> 
> I've already coded parts of a few of these options, but they all have 
> various difficulties and can easily become ugly pieces of code (at least 
> with my limited skill at sysfs).

If you really have to do this, I think a new ioctl with some extra space
for future extentions is better. sysfs is not good choice, imo.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
