Received: from proxy.force.de ([158.116.254.130])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18CKev-0007Wr-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Nov 2002 14:07:53 +0000
Received: from ex-deu-munich02.force.de (ex-deu-munich02.force.de [10.254.2.10])
	by proxy.force.de (8.11.4/8.11.4) with ESMTP id gAEEcQ224354
	for <linux-mtd@lists.infradead.org>; Thu, 14 Nov 2002 15:38:27 +0100 (MET)
Message-ID: <9CFB9DA5261CD611A29B00508B789048380A55@ex-deu-munich02.force.de>
From: "Gettert, Wolfram" <Wolfram.Gettert@fci.com>
To: linux-mtd@lists.infradead.org
Subject: Support for command set 0003 not present
Date: Thu, 14 Nov 2002 15:38:22 +0100
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

Hallo,
I have added the device data for a new device in jedec_probe.c and get =
this
message:

Support for command set 0003 not present
gen_probe: No supported vendor command set found

The macro P_ID_INTEL_STD is defined. Do I have overseen to load a =
module or
is this=20
command set not yet implemented. Is somebody working on this or do I =
have to
it on my own?=20

I will do it if it's necessary.


Wolfram

--
Wolfram Gettert
Software Engineer=20
Force Computers GmbH
- A Solectron Company -
Lilienthalstr. 15=20
D-85579 Neubiberg/M=FCnchen
Wolfram.Gettert_at_fci.com
www.forcecomputers.com
