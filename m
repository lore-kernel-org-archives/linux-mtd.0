Received: from jeeves.momenco.com
	([64.169.228.99] helo=host099.momenco.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19n75b-00028L-Td
	for <linux-mtd@lists.infradead.org>; Thu, 14 Aug 2003 02:39:44 +0100
Received: from beagle (natbox.momenco.com [64.169.228.98])
	(authenticated)
	by  host099.momenco.com (8.11.6/8.11.6) with ESMTP id h7E1dTX12199
	for <linux-mtd@lists.infradead.org>; Wed, 13 Aug 2003 18:39:29 -0700
From: "Matthew Dharm" <mdharm@momenco.com>
To: "Linux-Mtd@Lists. Infradead. Org" <linux-mtd@lists.infradead.org>
Date: Wed, 13 Aug 2003 18:39:28 -0700
Message-ID: <NEBBLJGMNKKEEMNLHGAIEEDODDAA.mdharm@momenco.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: put_chip error?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'm trying to get the MTD driver working with StrataFlash on an
embedded PPC target.

The driver _mostly_ works, but I keep getting a stream of errors,
which all say:

	put_chip() called with oldstate 1!!

What does that mean?  It's coming from the cfi_cmdset_0001.c file, but
I can't seem to make heads or tails out of it semantically.

Matt

--
Matthew D. Dharm                            Senior Software Designer
Momentum Computer Inc.                      1815 Aston Ave.  Suite 107
(760) 431-8663 X-115                        Carlsbad, CA 92008-7310
Momentum Works For You                      www.momenco.com
