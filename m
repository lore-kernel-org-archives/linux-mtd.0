Received: from mail.broadpark.no ([217.13.4.2])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A5Kgv-0006vG-NU
	for <linux-mtd@lists.infradead.org>; Fri, 03 Oct 2003 08:49:34 +0100
Received: from famine (217-13-20-38.dd.nextgentel.com [217.13.20.38])
	by mail.broadpark.no (Postfix) with ESMTP id 0936A79E8B
	for <linux-mtd@lists.infradead.org>;
	Fri,  3 Oct 2003 09:48:07 +0200 (MEST)
From: =?ISO-8859-1?Q?=D8yvind?= Harboe <oyvind.harboe@zylin.com>
To: linux-mtd@lists.infradead.org
Message-Id: <1065167286.24334.12.camel@famine>
Mime-Version: 1.0
Date: Fri, 03 Oct 2003 09:48:06 +0200
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: Can I set JFFS2_RESERVED_BLOCKS_WRITE=0?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I've got a JFFS2 fs mounted with only a single sector.

In this application, there is a phase where JFFS2 is written to,
and afterwards it is protected in hardware and never changed again.

JFFS2 scores over a ROM fs, because a ROM fs is normally created
on the developer machine during compile time, whereas the JFFS2
fs can be laid out by the application in the field.

To my surprise, JFFS2 will refuse to write more files if there
are less than 5 secotors free.

Having no fear, I set JFFS2_RESERVED_BLOCKS_WRITE = 0.

Apparently this is to avoid "endless gc looping".

http://lists.infradead.org/pipermail/linux-mtd/2003-April/007437.html

If someone could shed some light on this, I would be much obliged.


Øyvind
