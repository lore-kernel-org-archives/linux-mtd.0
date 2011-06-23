Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZfNQ-0002xJ-3A
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 08:35:06 +0000
Received: by pwi3 with SMTP id 3so1265568pwi.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jun 2011 01:35:00 -0700 (PDT)
Subject: Re: NAND BBT corruption on MPC83xx
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Matthew L. Creech" <mlcreech@gmail.com>
Date: Thu, 23 Jun 2011 11:35:46 +0300
In-Reply-To: <BANLkTi=L8CqtTt=+sJ-CHVyXyTsxTR_o8Q@mail.gmail.com>
References: <BANLkTi=L8CqtTt=+sJ-CHVyXyTsxTR_o8Q@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1308818150.18119.102.camel@sauron>
Mime-Version: 1.0
Cc: MTD list <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2011-06-15 at 15:48 -0400, Matthew L. Creech wrote:
> Hi, I'm not sure whether this list or the U-Boot list is more
> appropriate, but figured I'd start here and see if anyone can help.
> 
> We've gotten some devices back from the field which all suffer from
> this same problem on bootup when attaching UBI (these messages are
> from U-Boot):
> 
> 
> ...
> Bad block table found at page 524224, version 0x01
> Bad block table found at page 524160, version 0x01
> nand_bbt: ECC error while reading bad block table
> ...(long stream of bogus bad blocks)...
> UBI: attaching mtd1 to ubi0
> UBI: physical eraseblock size:   131072 bytes (128 KiB)
> UBI: logical eraseblock size:    129024 bytes
> UBI: smallest flash I/O unit:    2048
> UBI: sub-page size:              512
> UBI: VID header offset:          512 (aligned 512)
> UBI: data offset:                2048
> UBI error: vtbl_check: volume table check failed: record 0, error 9
> UBI error: ubi_init: cannot attach mtd1
> UBI error: ubi_init: UBI error: cannot initialize UBI, error -22
> UBI init error -22
> 
> A full console dump is here:
> 
> http://mcreech.com/work/bbt-ecc-error.txt
> 
> Question #1: Is the UBI error here attributable to the blocks which
> are wrongly marked as bad?  I would assume that it's a red herring,
> and I should focus on figuring out how the BBT got corrupted, but
> figured I'd check first.

UBI prints error messages if a block is marked bad, and they should go
to syslog. If you are able to access the syslog - you can see if
anything was marked as bad by UBI. But I really doubt this is UBI to
blame.

This might be BBT stuff - I never used on-flash BBT and when I look at
the code - I do not trust it...

-- 
Best Regards,
Artem Bityutskiy
