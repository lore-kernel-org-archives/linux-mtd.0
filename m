Received: from krynn.se.axis.com ([193.13.178.10])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NZKhX-0004vy-6F
	for linux-mtd@lists.infradead.org; Mon, 25 Jan 2010 08:53:43 +0000
Date: Mon, 25 Jan 2010 09:53:29 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: liulunzuo <liulunzuo@gmail.com>
Subject: Re: Dose linux-mtd really support mlc nand flash?
In-Reply-To: <791c381001230151t45f3003dh1cc5b24bf0a1783f@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1001250947000.32263@lnxricardw.se.axis.com>
References: <791c381001230151t45f3003dh1cc5b24bf0a1783f@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Sat, 23 Jan 2010, liulunzuo wrote:

>  Mlc nand flash should be write only once per write operation(NOP=3D1),
>  but i found when i use mtd-utils to write a mtdchar device with oob ,
>  it write a page twice: page and oob zone wrote separately,
>  and mtdchar.c support no way to write a page and oob zone to the mlc
> nand flash at the same time.

As far as I understand, mtd has not been used very much with MLC flash.=20
There are some thoughts about using UBI on MLC=20
(http://www.linux-mtd.infradead.org/faq/ubifs.html#L_why_ubiformat) but it=
=20
seems it hasn't been tested to any extent. At any rate, UBI does not use=20
the spare area in the flash for itself (like jffs2 does with cleanmarkers=
=20
in empty blocks. Don't know how yaffs goes about its stuff).

>  And when a writing or eraseing operation fail, yaffs2 fs will mark
> the block as bad block,
>  but the function "markbad" will only write oob area neither use a
> bad block scan first nor not.

I'm not sure I understand you. markbad marks a block as being bad. It=20
doesn't have to scan it first; it assumes whoever is calling it knows=20
enough to make the proper decision.

yaffs (and yaffs2) are not really on-topic on this list, unless you mean=20
jffs2.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
