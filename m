Received: from gorilla.mchh.siemens.de ([194.138.158.18])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16DpQJ-00031I-00
	for <linux-mtd@lists.infradead.org>; Tue, 11 Dec 2001 16:06:27 +0000
Received: from blues.mchh.siemens.de (mail2.mchh.siemens.de [194.138.158.227])
	by gorilla.mchh.siemens.de (8.9.3/8.9.3) with ESMTP id RAA25215
	for <linux-mtd@lists.infradead.org>; Tue, 11 Dec 2001 17:17:08 +0100 (MET)
Received: from mchh274e.demchh201e.icn.siemens.de ([139.21.200.84])
	by blues.mchh.siemens.de (8.9.1/8.9.1) with ESMTP id RAA16339
	for <linux-mtd@lists.infradead.org>; Tue, 11 Dec 2001 17:17:06 +0100 (MET)
Message-ID: <BE684E2C997AD51199530002A56B207906622E@MCHH2A1E>
From: Babic Stefano <Stefano.Babic@icn.siemens.de>
To: linux-mtd@lists.infradead.org
Subject: BUSWIDTH > 4 (64 bit support on PPC)
Date: Tue, 11 Dec 2001 14:35:25 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ISO-8859-1"
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

Hi,

I have on my target (Motorola MPC 755, 64 bit bus width) the necessity =
to use BUSWIDTH =3D 8. I have seen in the mailing list that the same =
case occurred and Jan (Jan Rovins <jrovins@ss7-link.com>) provided some =
patches to=20
support it, mainly for cfi_cmdset_000x.c. I inserted the modifications =
in a newer mtd-snapshot and, following the suggestion by David, my =
system works.
I checked if these changes are applied in latest MTD=B4s versions and I =
have seen they are not. I=B4d like to ask if there are some plans to =
apply these patches. I know, using a 32 bit processor (and 32 bit OS) =
with a 64 bit bus seems quite weird, but it is probably not so unusual =
in embedded systems with PowerPC and 60x bus.

Thanks=20

Stefano
