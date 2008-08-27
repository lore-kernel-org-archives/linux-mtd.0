Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KYMuf-0007IT-9U
	for linux-mtd@lists.infradead.org; Wed, 27 Aug 2008 15:26:25 +0000
Date: Wed, 27 Aug 2008 17:26:22 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Zhao Shengzhe-a18689 <a18689@motorola.com>
Subject: RE: [PATCH][MTD][NAND]Bad Block Management
In-Reply-To: <93481F4E3CC5F042BBDE9376E50F759A026F6BD3@zmy16exm63.ds.mot.com>
Message-ID: <Pine.LNX.4.64.0808271722410.27676@lnxricardw.se.axis.com>
References: <1219830684.13957.25.camel@il93elnxlog2>
	<Pine.LNX.4.64.0808271240280.21707@lnxricardw.se.axis.com>
	<93481F4E3CC5F042BBDE9376E50F759A026F6BD3@zmy16exm63.ds.mot.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	=?iso-8859-1?Q?Ricard_Wanderl=F6f?= <Ricard.Wanderlof@axis.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 27 Aug 2008, Zhao Shengzhe-a18689 wrote:

> The bad blocks will be detected by low-level hardware driver. The NAN=20
> devices have a Status Register that indicates whether an operation is=20
> successful or not. Additional Bad Blocks are identified when attempts to=
=20
> program or erase give errors in the Status Register. Since our patch is=
=20
> in MTD layer, so you cannot find the codes for detecting bad blocks.

OK.

When I ran some tests on an ST 256 MiB flash a while ago, I got the=20
impression that by the time the status register indicates a problem, the=20
block has been worn out (in the sense that subsequent reads are not=20
reliable) for quite a while. So another approach would be to keep track of=
=20
the amount of read errors encountered, together with the number of times=20
the block has been rewritten due to excessive read errors. I'm not sure if=
=20
UBI does this though if one wants that level of reliability.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
