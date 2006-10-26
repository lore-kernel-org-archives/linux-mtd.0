Received: from nic2.axis.se ([193.13.178.10] helo=krynn.se.axis.com)
	by pentafluge.infradead.org with esmtps (Exim 4.62 #1 (Red Hat Linux))
	id 1Gd1AR-0007mY-3P
	for linux-mtd@lists.infradead.org; Thu, 26 Oct 2006 10:04:51 +0100
Date: Thu, 26 Oct 2006 11:06:21 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Vitaly Wool <vwool@ru.mvista.com>
Subject: Re: [PATCH] [MTD] [NAND]: nand_default_mark_blockbad() doesn't work
	when flash-based bbt not enabled
In-Reply-To: <454077F5.2030905@ru.mvista.com>
Message-ID: <Pine.LNX.4.64.0610261102010.25906@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.0610230928360.25906@lnxricardw.se.axis.com>
	<1161597141.19446.276.camel@pmac.infradead.org>
	<453DDE6C.2070304@ru.mvista.com>
	<Pine.LNX.4.64.0610250851290.25906@lnxricardw.se.axis.com>
	<454077F5.2030905@ru.mvista.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 26 Oct 2006, Vitaly Wool wrote:

> Anyway, here's what I think of that. It looks like the idea was to use=20
> ops.len in order to read more than ooblen bytes, i. e. more than one OOB=
=20
> area basically, and preserve ooblen to signal how many bytes there is in=
=20
> one oob. However, that seems misleading/redundant since you can always=20
> figure out how many bytes there are in oob, so it looks like making that=
=20
> all work w/ ooblen is better.
>
> Does that make sense?

Well, I guess so, at least so far as "there was a good thought behind it=20
all but it didn't really turn out as we'd expected" to my=20
have-just-recently-studied-mtd-ears :-).

> I'm going to work on that as soon as load permits...

Yeah, I think I'd be up over my head in water if I tried to sort this out=
=20
myself ...

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
