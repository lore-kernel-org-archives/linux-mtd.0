Received: from s131.mittwaldmedien.de ([62.216.178.31])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1Ee80g-00078r-6C
	for linux-mtd@lists.infradead.org; Mon, 21 Nov 2005 04:30:57 -0500
Received: from localhost (localhost [127.0.0.1])
	by s131.mittwaldmedien.de (Postfix) with ESMTP id B69D25E4125
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Nov 2005 10:30:45 +0100 (CET)
Received: from lin01.mn-solutions.de (p54B29097.dip0.t-ipconnect.de
	[84.178.144.151])
	by s131.mittwaldmedien.de (Postfix) with ESMTP id C87355E411E
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Nov 2005 10:30:44 +0100 (CET)
Received: from mnz66.mn-solutions.de (mnz66.mn-logistik.de [192.168.233.66])
	by lin01.mn-solutions.de (Postfix) with ESMTP id 5EB421E014A
	for <linux-mtd@lists.infradead.org>;
	Mon, 21 Nov 2005 10:29:55 +0100 (CET)
From: Holger Schurig <hs4233@mail.mn-solutions.de>
To: linux-mtd@lists.infradead.org
Date: Mon, 21 Nov 2005 10:30:41 +0100
References: <20051118014055.GK11494@stusta.de>
	<20051118031751.GA2773@redhat.com>
	<20051118033702.GY11494@stusta.de>
In-Reply-To: <20051118033702.GY11494@stusta.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200511211030.41684.hs4233@mail.mn-solutions.de>
Subject: Re: [2.6 patch] build kernel/intermodule.c only when required
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Adrian !

> =A0config MTD_GEN_PROBE
> =A0=A0=A0=A0=A0=A0=A0=A0tristate
> +=A0=A0=A0=A0=A0=A0=A0select OBSOLETE_INTERMODULE

MTD_GEN_PROBE get's selected by MTD_CFI. If I know my flash chips and don't=
=20
need any CFI detected, can I (easily) put the info into some platform data=
=20
and omit the compilation/exection of cfi_probe.c ?
