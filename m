Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JHJ8h-0004XT-Jl
	for linux-mtd@lists.infradead.org; Tue, 22 Jan 2008 13:26:14 +0000
Date: Tue, 22 Jan 2008 14:24:56 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
In-Reply-To: <20080122120300.GA18884@lazybastard.org>
Message-ID: <Pine.LNX.4.64.0801221419240.25733@lnxricardw.se.axis.com>
References: <479073D1.5010406@parrot.com>
	<20080118064852.026b0c82@zod.rchland.ibm.com>
	<4790D11E.6060201@parrot.com>
	<20080118115531.2deef9fb@zod.rchland.ibm.com>
	<20080118181744.GA15039@lazybastard.org> <4794C107.7070600@parrot.com>
	<20080121212555.GA14472@lazybastard.org>
	<20080121161612.3ca2f093@zod.rchland.ibm.com>
	<20080121222952.GC14472@lazybastard.org> <4795AFE3.506@parrot.com>
	<20080122120300.GA18884@lazybastard.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: David Woodhouse <dwmw2@infradead.org>, Josh Boyer <jwboyer@gmail.com>,
	linux-mtd@lists.infradead.org, Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On Tue, 22 Jan 2008, J=F6rn Engel wrote:
>=20
> > On Tue, 22 January 2008 09:57:07 +0100, Matthieu CASTET wrote:
> >
> ...=20
> > There no call to mtd->block_markbad or mtd->block_isbad (it is only=20
> > called in mtd_find_sb).
>=20
> Used to be there and was removed.  mtd->erase() does the same as
> mtd->block_isbad().

How do you mean? mtd->erase() will not erase a bad block, that is true.

However, while it seems that mtd->erase() can mark a block bad if it=20
fails, the fact that a block is eraseble without errors does not imply=20
that it is good. I've seen NAND flash blocks which have way passed their=20
specified number of max write/erase cycles still be successfully erased=20
and subsequently written without errors, but the data retention was lousy=
=20
(blocks started to show bit flips after a few thousand reads).

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
