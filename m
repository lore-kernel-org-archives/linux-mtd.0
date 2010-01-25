Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1NZLga-0004AD-Jo
	for linux-mtd@lists.infradead.org; Mon, 25 Jan 2010 09:56:48 +0000
Subject: Re: Dose linux-mtd really support mlc nand flash?
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
In-Reply-To: <Pine.LNX.4.64.1001250947000.32263@lnxricardw.se.axis.com>
References: <791c381001230151t45f3003dh1cc5b24bf0a1783f@mail.gmail.com>
	<Pine.LNX.4.64.1001250947000.32263@lnxricardw.se.axis.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 25 Jan 2010 11:56:13 +0200
Message-ID: <1264413373.2549.28.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: liulunzuo <liulunzuo@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-01-25 at 09:53 +0100, Ricard Wanderlof wrote:
> On Sat, 23 Jan 2010, liulunzuo wrote:
> 
> >  Mlc nand flash should be write only once per write operation(NOP=1),
> >  but i found when i use mtd-utils to write a mtdchar device with oob ,
> >  it write a page twice: page and oob zone wrote separately,
> >  and mtdchar.c support no way to write a page and oob zone to the mlc
> > nand flash at the same time.
> 
> As far as I understand, mtd has not been used very much with MLC flash. 
> There are some thoughts about using UBI on MLC 
> (http://www.linux-mtd.infradead.org/faq/ubifs.html#L_why_ubiformat) but it 
> seems it hasn't been tested to any extent. At any rate, UBI does not use 
> the spare area in the flash for itself (like jffs2 does with cleanmarkers 
> in empty blocks. Don't know how yaffs goes about its stuff).

Yeah, a little better links for the MLC thoughts, though:

http://www.linux-mtd.infradead.org/faq/ubi.html#L_mlc
http://www.linux-mtd.infradead.org/faq/ubifs.html#L_ubifs_mlc

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
