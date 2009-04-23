Received: from yw-out-1718.google.com ([74.125.46.154])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LwzJI-0005zD-TS
	for linux-mtd@lists.infradead.org; Thu, 23 Apr 2009 13:50:10 +0000
Received: by yw-out-1718.google.com with SMTP id 9so321067ywk.72
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Apr 2009 06:49:48 -0700 (PDT)
MIME-Version: 1.0
Date: Thu, 23 Apr 2009 09:49:48 -0400
Message-ID: <bd519e770904230649k1289a05fxc0624f15a0c34b67@mail.gmail.com>
Subject: sub pagesize write atomicity concern
From: Arthur Kunkle <agkunkle@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

A project I am currently involved with is considering using a JFFS2
partition on top of a
Spansion NOR flash device.  This file system will be used for storing
critical operation
parameters.  The use of the area will be very similar to the tried and true
Unix "passwd" utility example, i.e.

cp paramA paramA.new
<update paramA.new with new data>
mv paramA.new paramA

With this project (as many other embedded ones), the "either all or nothing"
property of the mv operation is key, expecting that a power failure could occur
anywhere within rename().  In studying the JFFS2 implementation as well as
the mailing list archives, it seems that JFFS2 provides this in my
situation because:

1. The update to the dirent node will be less than a page-size
2. JFFS2 does not buffer writes to NOR chips (as it does for NAND, apparently)

However, the following mailing list entry did raise a red flag:


http://mhonarc.axis.se/jffs-dev/msg00762.html

"Upon reading the checkfs source, I think I know what's happening here. I
may have mislead you about write atomicity. We _normally_ write a whole
page at once, so you will find that writes which don't cross page
boundaries are atomic. _BUT_ when we're at the end of an erase block and
there's insufficient free space to write the whole page, we still split the
data up into two nodes - one filling up the erase block to the end, and the
remainder of the data in the first node of a new block."

--dwmw2

This was from June of 2001.  I wanted to see if this same type of limitation
still existed as of 2.6.28+.  If so, what precautions must be taken to ensure
that this erase block boundary issue is not a problem for this *critical* mv's?

Thanks in advance.

--Arthur
