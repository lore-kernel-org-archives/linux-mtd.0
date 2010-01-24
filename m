Received: from mail-yw0-f177.google.com ([209.85.211.177])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NZ7wc-0000Zi-DI
	for linux-mtd@lists.infradead.org; Sun, 24 Jan 2010 19:16:26 +0000
Received: by ywh7 with SMTP id 7so2406965ywh.24
	for <linux-mtd@lists.infradead.org>;
	Sun, 24 Jan 2010 11:16:20 -0800 (PST)
MIME-Version: 1.0
From: Saurabh Jain <saurabh@thinvent.in>
Date: Mon, 25 Jan 2010 00:46:00 +0530
Message-ID: <c11c61211001241116i50063d7ds6e2fb4edcce0769@mail.gmail.com>
Subject: Squashfs over UBI
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

I've been trying to get squashfs working on a new board with NAND
flash. However, the mtd of the mtdblock I am using contains bad
blocks. When I dd in the squashfs file system, the kernel throws
end_request, nand_erase_nand and mtdblock errors.

I therefore decided to use squashfs over UBI. I saw this discussed in
a couple of places on the web. However, the /dev/ubi0 device created
by ubiattach is a character device. I can't just dd my squashfs into
it. If I create a UBIFS over this /dev/ubi0, and then put my squashfs
into it, that works, but now I've got "double compression", something
I don't want on an embedded system.

Is it possible to get squashfs to use the bad block avoidance features
of UBI, without using UBIFS?

Regards,
Saurabh

http://www.thinvent.in
