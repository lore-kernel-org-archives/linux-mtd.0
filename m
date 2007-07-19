Received: from mail.gnss.com ([209.47.22.10] helo=tormf01.gmi.domain)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IBOj5-0006W4-5R
	for linux-mtd@lists.infradead.org; Thu, 19 Jul 2007 01:39:00 -0400
Received: from tormf01.gmi.domain (127.0.0.1) by tormf01.gmi.domain (MlfMTA
	v3.2r9) id hjrsf60171sn for <linux-mtd@lists.infradead.org>;
	Thu, 19 Jul 2007 01:38:57 -0400 (envelope-from <Meeta.Mishra@gnss.com>)
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: Query regarding JFFS2 init
Date: Thu, 19 Jul 2007 11:08:54 +0530
Message-ID: <9D98C51005D80D43A19A3DF329A61D6901A91C05@INDEXCH2003.gmi.domain>
From: "Meeta Mishra" <Meeta.Mishra@gnss.com>
To: <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi,

I want to know what actually happens when sbin/init is invoked in JFFS2.


I'm using small page Nand device with a 12MB JFFS2 partition (which has
5.6 MB JFFS2 image). Kernel boots up from Nand flash and comes to
sbin/init; the total execution of sbin/init is taking 13 sec (which
seems huge to me).=20

I traced the read calls during sbin/init execution and found that approx
13 MB of data is being read which is taking approx 7.8 sec (out of 13
sec).  Does anyone has any idea about the 13 MB data that's being read?

Regards,
Meeta
