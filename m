Received: from msgbas1tx.cos.agilent.com ([192.25.240.37]
	helo=msgbas2x.cos.agilent.com)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AwRLN-0005hH-Mj
	for linux-mtd@lists.infradead.org; Thu, 26 Feb 2004 19:38:49 +0000
Received: from relcos1.cos.agilent.com (relcos1.cos.agilent.com
	[130.29.152.239])
	by msgbas2x.cos.agilent.com (Postfix) with ESMTP id 4F9206B6B
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Feb 2004 12:38:47 -0700 (MST)
Received: from wcosbh23.cos.agilent.com (wcosbh23.cos.agilent.com
	[130.29.152.145])
	by relcos1.cos.agilent.com (Postfix) with ESMTP id 37D832FE
	for <linux-mtd@lists.infradead.org>;
	Thu, 26 Feb 2004 12:38:47 -0700 (MST)
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Feb 2004 12:38:46 -0700
Message-ID: <3236F92B82933347807DFF6A8BA632802133BA@wcosmb04.cos.agilent.com>
From: <xiaogeng_jin@agilent.com>
To: <linux-mtd@lists.infradead.org>
Subject: Can the current mtd suport two different types of flash on one
	board?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'd like to know if the current mtd is capable of handling different =
types of flash devices on a single board, for example, device with =
different buswidth, device width and interleave?

I'm just browsing the source of cfi_cmdset_0002.c and getting some =
preliminary impression that it cannot support such configuration. Am I =
right?

Thanks,
-Shawn.
