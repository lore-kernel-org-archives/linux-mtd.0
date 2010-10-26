Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
	helo=DB3EHSOBE006.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PAfvy-0003Al-96
	for linux-mtd@lists.infradead.org; Tue, 26 Oct 2010 09:35:11 +0000
Received: from mail57-db3 (localhost.localdomain [127.0.0.1])	by
	mail57-db3-R.bigfish.com (Postfix) with ESMTP id 91CB310202EF	for
	<linux-mtd@lists.infradead.org>; Tue, 26 Oct 2010 09:35:08 +0000 (UTC)
Received: from DB3EHSMHS007.bigfish.com (unknown [10.3.81.240])	by
	mail57-db3.bigfish.com (Postfix) with ESMTP id 52BA95B8052	for
	<linux-mtd@lists.infradead.org>; Tue, 26 Oct 2010 09:35:08 +0000 (UTC)
Received: from de01smr01.freescale.net (de01smr01.freescale.net [10.208.0.31])
	by az33egw01.freescale.net (8.14.3/8.14.3) with ESMTP id
	o9Q9Z0Or017886	for
	<linux-mtd@lists.infradead.org>; Tue, 26 Oct 2010 02:35:01 -0700 (MST)
Received: from az33exm20.fsl.freescale.net (az33exm20.am.freescale.net
	[10.64.32.6])	by de01smr01.freescale.net (8.13.1/8.13.0) with ESMTP id
	o9Q9oZFu012171	for <linux-mtd@lists.infradead.org>;
	Tue, 26 Oct 2010 04:50:35 -0500 (CDT)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
Content-Class: urn:content-classes:message
Subject: RE: [PATCH 1/1] MTD: Fix MTD_MODE_RAW write fail
Date: Tue, 26 Oct 2010 02:35:24 -0700
Message-ID: <09EC74FE2C9E8444BF2FF67BD36E1D69B03B@039-SN1MPN1-002.039d.mgd.msft.net>
In-Reply-To: <70E876B0EA86DD4BAF101844BC814DFE093EEF8EAC@Cloud.RL.local>
References: <1288061660-23363-1-git-send-email-Frank.Li@freescale.com>
	<70E876B0EA86DD4BAF101844BC814DFE093EEF8EAC@Cloud.RL.local>
From: Li Frank-B20596 <B20596@freescale.com>
To: Jon Povey <Jon.Povey@racelogic.co.uk>, <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>=20
> Looks like you have found the same thing:
>=20
>
http://lists.infradead.org/pipermail/linux-mtd/2010-September/032453.htm
l
>
http://lists.infradead.org/pipermail/linux-mtd/2010-October/032538.html
>=20

Yes. That's the same.=20
