Received: from proxy.force.de ([158.116.254.130])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 189L1j-0002CX-00
	for <linux-mtd@lists.infradead.org>; Wed, 06 Nov 2002 07:55:03 +0000
Received: from ex-deu-munich02.force.de (ex-deu-munich02.force.de [10.254.2.10])
	by proxy.force.de (8.11.4/8.11.4) with ESMTP id gA68PU221417
	for <linux-mtd@lists.infradead.org>; Wed, 6 Nov 2002 09:25:30 +0100 (MET)
Message-ID: <9CFB9DA5261CD611A29B00508B789048380A47@ex-deu-munich02.force.de>
From: "Gettert, Wolfram" <Wolfram.Gettert@fci.com>
To: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: MTD newbie wants programming a 28F800 with a 2.2.18 kernel
Date: Wed, 6 Nov 2002 09:25:25 +0100 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Hallo
I am completely new to MTD. My job is to program a 28F800 boot block =
flash
running a 2.2.18 kernel.
I am using  this patch mtd-patch-2.2.18-20001218-2230GMT. Since there =
is no
support for the 28F800 because it has CUI not CFI  I need to write the
driver for the CUI. I found the lart-driver (lart.c) in the 2.5.x =
sources
which can manage a 28F160 (which is compatible to 28F800).

Do you know of any implementation of the lart-driver on a 2.2.x kernel?
Since the mtd_info structure has changed extensively from the =
2.2.18-patch
to 2.5.x there is a lot of work to-do.

THX

Wolfram
=20

--
Wolfram Gettert
Software Engineer=20
Force Computers GmbH
- A Solectron Company -
Lilienthalstr. 15=20
D-85579 Neubiberg/M=FCnchen
email: Wolfram.Gettert@fci.com
www.forcecomputers.com
