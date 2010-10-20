Received: from am1ehsobe003.messaging.microsoft.com ([213.199.154.206]
	helo=AM1EHSOBE003.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1P8QyP-0000Qv-5G
	for linux-mtd@lists.infradead.org; Wed, 20 Oct 2010 05:12:26 +0000
Received: from mail74-am1 (localhost.localdomain [127.0.0.1])	by
	mail74-am1-R.bigfish.com (Postfix) with ESMTP id 2EB2278307	for
	<linux-mtd@lists.infradead.org>; Wed, 20 Oct 2010 05:12:23 +0000 (UTC)
Received: from am1ehsmhs006.bigfish.com (unknown [10.3.201.246])	by
	mail74-am1.bigfish.com (Postfix) with ESMTP id EC9A319B8046	for
	<linux-mtd@lists.infradead.org>; Wed, 20 Oct 2010 05:12:22 +0000 (UTC)
Received: from de01smr02.am.mot.com (de01smr02.freescale.net [10.208.0.151])
	by de01egw01.freescale.net (8.14.3/8.14.3) with ESMTP id
	o9K5CmGO023200	for
	<linux-mtd@lists.infradead.org>; Tue, 19 Oct 2010 22:12:48 -0700 (MST)
Received: from zch01exm23.fsl.freescale.net (zch01exm23.ap.freescale.net
	[10.192.129.207])	by de01smr02.am.mot.com (8.13.1/8.13.0) with ESMTP id
	o9K5SjBo006198	for <linux-mtd@lists.infradead.org>;
	Wed, 20 Oct 2010 00:28:45 -0500 (CDT)
Content-Class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: [PATCH 1/2] P4080/eLBC: Make Freescale elbc interrupt common to
	elbc devices
Date: Wed, 20 Oct 2010 13:12:20 +0800
Message-ID: <3850A844E6A3854C827AC5C0BEC7B60A2B08A5@zch01exm23.fsl.freescale.net>
In-Reply-To: <2D2A6B88-DA17-467D-BB43-919C1CAAB894@kernel.crashing.org>
References: <1287386552-10647-1-git-send-email-tie-fei.zang@freescale.com>
	<2D2A6B88-DA17-467D-BB43-919C1CAAB894@kernel.crashing.org>
From: Zang Roy-R61911 <r61911@freescale.com>
To: Kumar Gala <galak@kernel.crashing.org>
Cc: Wood Scott-B07421 <B07421@freescale.com>, dedekind1@gmail.com,
	Lan Chunhe-B25806 <B25806@freescale.com>,
	linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org, dwmw2@infradead.org,
	Gala Kumar-B11780 <B11780@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



> -----Original Message-----
> From: Kumar Gala [mailto:galak@kernel.crashing.org]
> Sent: Tuesday, October 19, 2010 21:19 PM
> To: Zang Roy-R61911
> Cc: linux-mtd@lists.infradead.org; Wood Scott-B07421;
dedekind1@gmail.com; Lan
> Chunhe-B25806; linuxppc-dev@ozlabs.org; akpm@linux-foundation.org;
> dwmw2@infradead.org; Gala Kumar-B11780
> Subject: Re: [PATCH 1/2] P4080/eLBC: Make Freescale elbc interrupt
common to
> elbc devices
>=20
>=20
> On Oct 18, 2010, at 2:22 AM, Roy Zang wrote:
>=20
> > Move Freescale elbc interrupt from nand dirver to elbc driver.
> > Then all elbc devices can use the interrupt instead of ONLY nand.
> >
> > For former nand driver, it had the two functions:
> >
> > 1. detecting nand flash partitions;
> > 2. registering elbc interrupt.
> >
> > Now, second function is removed to fsl_lbc.c.
> >
> > Signed-off-by: Lan Chunhe-B25806 <b25806@freescale.com>
> > Signed-off-by: Roy Zang <tie-fei.zang@freescale.com>
> > Reviewed-by: Anton Vorontsov <cbouatmailru@gmail.com>
> > Cc: Wood Scott-B07421 <B07421@freescale.com>
> > ---
>=20
> Roy, this is a nit, but are these really p4080 specific?  just
wondering why
> the subject is P4080/eLBC:...
We start these code in P4080 project. Some customer want to track eLBC
error on P4080, but some of the code is limited in nand driver only ...
That is why P4080/eLBC ...
Roy
