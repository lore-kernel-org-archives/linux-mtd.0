Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jofeo-0005Ep-V7
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 14:09:11 +0000
Subject: Re: [RFC] slight UBI scan time improvement
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080423134254.GA17867@cloud.net.au>
References: <1208882552.11721.13.camel@sauron>
	<20080423073840.GA9472@cloud.net.au> <480EEFAB.7010304@parrot.com>
	<1208938864.11721.44.camel@sauron>
	<20080423124046.GA16201@cloud.net.au>
	<1208955467.11721.69.camel@sauron>
	<20080423134254.GA17867@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Wed, 23 Apr 2008 17:09:19 +0300
Message-Id: <1208959759.11721.76.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-04-23 at 23:42 +1000, Hamish Moffatt wrote:
> On Wed, Apr 23, 2008 at 03:57:47PM +0300, Artem Bityutskiy wrote:
> > On Wed, 2008-04-23 at 22:40 +1000, Hamish Moffatt wrote:
> > > Well I think from past use of "time ubiattach ..." that most of
> > > the missing time is in the attach.=20
> > Sure, UBI takes most of the time. Its just if you want to save 1.2+ sec=
,
> > you may try to play with on-flash BBT.
>=20
> I'm not sure what this means.. ? Instead of having to scan each block
> to check the marker, it has a central table? And that table is created
> once by an initial scan and then added to when UBI declares a block bad?
> How do I access this feature?
Yes.

When your NAND driver is initialized, it scans whole flash and builds
the BBT. Basically, it reads OOB area of each first (and may be second)
page of each eraseblock. The BBT is simply an array with 1 bit per
eraseblock.

You may make it save the BBT on the flash media. So next time you boot,
it reads the BBT from a pre-defined place (e.g., the last eraseblock)
and that's it. It does not scan and does not waste time.

This all is happening in the driver, before UBI starts.

Yes, if UBI marks a block bad, which basically means it calls an MTD
function, the NAND infrastructure changes the on-flash BBT.

But I never used this myself, so my knowledge is theoretical. I just
know others use this and I saw the code in nand_base.c.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
