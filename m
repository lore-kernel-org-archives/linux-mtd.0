Received: from mailserv.intranet.gr ([146.124.14.106])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19Q1DJ-000249-Ap
	for <linux-mtd@lists.infradead.org>; Wed, 11 Jun 2003 09:44:14 +0100
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
	by mailserv.intranet.gr (8.11.7/8.11.3) with ESMTP id h5B8l0D29132
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jun 2003 11:47:00 +0300 (EEST)
Received: from ifaistos.intranet.gr (ifaistos.intranet.GR [146.124.20.203])
	by mailserv.intranet.gr (8.11.7/8.11.3) with ESMTP id h5B8kxY29117
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jun 2003 11:46:59 +0300 (EEST)
Received: from intracom.gr (pcrnd46 [146.124.20.92])
	by ifaistos.intranet.gr (8.9.1b+Sun/8.9.1) with ESMTP id LAA29907
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jun 2003 11:40:41 +0300 (EET DST)
Message-ID: <3EE6EBA0.3080508@intracom.gr>
Date: Wed, 11 Jun 2003 11:43:12 +0300
From: Pantelis Antoniou <panto@intracom.gr>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Cram FS on NAND - How to do this?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

As it currently stands the only filesystems supporting
raw NAND flash are:

JFFS2: Read/write, compressed, best support, slow startup.
YAFFS: Read/write, not compressed, newcomer, fast startup.

I have a requirement to have a compressed read only
root filesystem in my board and I've come to the
conclussion that the best fit would be CRAMFS if only
had any concept of bad blocks.

Looking at the code for CRAMFS I see that it would not
be very difficult to hack it to detect the bad blocks
and skip over them on startup. We could rely on
the same OOB info that JFFS2 has, and just
make a mapping list as follows:

NAND block  bad?  fs block
----------  ----  --------
    0         n      0
    1         n      1
    2         y     skip
    3         n      2

... etc

The first complication is that CRAMFS works with
PAGE_SIZE blocks only, and that should be taken
into account.

The second is that this is the first time I hack filesystem
code and I would like to ask the list if you see any difficulties
ahead.

What are your thoughts in this?

Regards

Pantelis
