Received: from houmail004.halliburton.com ([34.254.16.16]
	helo=HOUMAIL004.corp.halliburton.com)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CyAAi-0005Nr-Ld
	for linux-mtd@lists.infradead.org; Mon, 07 Feb 2005 09:47:29 -0500
Received: from HOUEXGR002.corp.halliburton.com
	(houexgr002.corp.halliburton.com [34.224.35.127])
	by HOUMAIL004.corp.halliburton.com (8.13.1/8.13.1) with ESMTP id
	j17Em4hc025691
	for <linux-mtd@lists.infradead.org>; Mon, 7 Feb 2005 08:48:04 -0600
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Date: Mon, 7 Feb 2005 08:47:24 -0600
Message-ID: <487B538D08487B4D8FEC138A13D4F6AC21D8A5@HOUEXCH077.corp.halliburton.com>
From: "Sergei Sharonov" <Sergei.Sharonov@Halliburton.com>
To: <linux-mtd@lists.infradead.org>
Subject: Low write throughput with arm/jffs2/nand
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

Around Jan 18 nand_wait() function in nand_base.c was changed to=20
use msleep(1) instead of yield(). While it is sort of OK on x86
with its default HZ=3D1000 (linux 2.6) it slows down the throughput
on arm where the default is HZ=3D100. What I believe is happening:
- on the first pass flash is not ready
- msleep(1) is invoked, but it actually sleeps 10 or 20 ms

What will be the right way of fixing that? Replacing msleep(1) with
yield() does it but philosophically is probably not the right thing=20
to do, changing HZ is much worse..

Sergei

P.S. What is the best read/write speed you people are getting with=20
jffs2/nand?
