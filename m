Received: from mail-yi0-f49.google.com ([209.85.218.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1QEQej-0001T8-9s
	for linux-mtd@lists.infradead.org; Mon, 25 Apr 2011 18:37:13 +0000
Received: by yic15 with SMTP id 15so875891yic.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 25 Apr 2011 11:37:07 -0700 (PDT)
MIME-Version: 1.0
Date: Mon, 25 Apr 2011 14:37:06 -0400
Message-ID: <BANLkTi=CNSd8JrWPL-o-WHe-kS-L7pFNqg@mail.gmail.com>
Subject: Programming ubinized images
From: "Matthew L. Creech" <mlcreech@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm curious about the implications of these notes in the UBI documentation:

http://www.linux-mtd.infradead.org/faq/ubi.html#L_ecc_error
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_why_ubiformat
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_mkfubifs
http://www.linux-mtd.infradead.org/doc/ubi.html#L_flasher_algo

which seem to be saying that:

1. A ubinized image can contain empty (all-0xff) pages at the end
2. At run-time, it will assume that these pages are completely erased
(including corresponding OOB areas)
3. Standard NAND flashing utilities will view the 0xff pages as normal
data and program their OOB areas
4. This will cause errors when UBIFS tries to use these areas, because
it double-programs OOB/ECC (presumably resulting in some sort of
ANDing of bits)

Does this mean that an off-the-shelf NAND programmer can't be used to
program UBIFS images onto a flash device?  Or perhaps that I need to
be post-processing the ubinized images to strip out empty pages from
the end of the image before giving it to the production line?

We encountered one case in which we were re-flashing a device for
testing using U-Boot's "nand erase", and got the "ubi_io_read: error
-74" error from the FAQ.  That's no big deal, since we never do this
in the field, and clearly "nand erase" isn't something we'd want to do
even without this problem since it loses erase-counter info.

However, I'm wondering if some of the persistent UBIFS problems we've
been experiencing since last year:

http://lists.infradead.org/pipermail/linux-mtd/2010-July/031069.html

could be occurring simply because we're not stripping empty pages from
the end of the ubinized image before programming.  Does this seem like
a possibility, or do I need to keep looking elsewhere?  Any tips are
appreciated, thanks!

-- 
Matthew L. Creech
