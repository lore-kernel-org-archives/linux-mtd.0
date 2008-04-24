Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Joupn-0000Gt-Q0
	for linux-mtd@lists.infradead.org; Thu, 24 Apr 2008 06:21:32 +0000
Subject: Re: [RFC] slight UBI scan time improvement
From: Artem Bityutskiy <dedekind@infradead.org>
To: Hamish Moffatt <hamish@cloud.net.au>
In-Reply-To: <20080424015303.GB13358@cloud.net.au>
References: <1208882552.11721.13.camel@sauron>
	<20080423073840.GA9472@cloud.net.au> <480EEFAB.7010304@parrot.com>
	<1208938864.11721.44.camel@sauron>
	<20080423124046.GA16201@cloud.net.au>
	<1208955467.11721.69.camel@sauron>
	<20080423134254.GA17867@cloud.net.au>
	<1208959759.11721.76.camel@sauron>
	<20080424015303.GB13358@cloud.net.au>
Content-Type: text/plain; charset=utf-8
Date: Thu, 24 Apr 2008 09:21:20 +0300
Message-Id: <1209018080.11721.88.camel@sauron>
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

On Thu, 2008-04-24 at 11:53 +1000, Hamish Moffatt wrote:
> Thanks for the info. It looks like this would not save me very much
> time so I don't think I will bother.

Ok.

> I notice in your patch that you read a whole min_io_size block, even
> though you only need the EC and VID headers (total of 128 bytes each, or
> 576 bytes as a single read according to my calculation):

Err, 64 bytes each even.
=20
> Won't reading 2K bytes be slower than 576 in some cases? If you have
> soft ECC then you have to read the whole page anyway, but if you have
> hardware ECC then you have no need to read the whole page into RAM.

Yes, I guess. Current MTD implementation reads whole page in any case,
though.

> Hmm. The software ECC seems to work internally on 256 byte blocks.
> However it appears that nand_base will always read in a whole page (2K
> on my flash). It should be ok to read only a 256-byte block as that's
> all you need for ECC calculation? Not a whole 2K which requires 8 ECC
> calculations.

However, there was a patch from Alexey which may certainly help you. It
was not looked at properly, unfortunately. I'll try to find it in my
mailbox and will send to you.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
