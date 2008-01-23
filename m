Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JHgYI-0003tQ-ED
	for linux-mtd@lists.infradead.org; Wed, 23 Jan 2008 14:26:12 +0000
Date: Wed, 23 Jan 2008 15:25:03 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
In-Reply-To: <20080123140639.GE24953@lazybastard.org>
Message-ID: <Pine.LNX.4.64.0801231517520.15553@lnxricardw.se.axis.com>
References: <20080122120300.GA18884@lazybastard.org>
	<Pine.LNX.4.64.0801221419240.25733@lnxricardw.se.axis.com>
	<20080122150514.GD18884@lazybastard.org>
	<Pine.LNX.4.64.0801231014540.25733@lnxricardw.se.axis.com>
	<20080123101915.GA24953@lazybastard.org>
	<Pine.LNX.4.64.0801231132210.25733@lnxricardw.se.axis.com>
	<20080123105713.GC24953@lazybastard.org>
	<Pine.LNX.4.64.0801231248400.25733@lnxricardw.se.axis.com>
	<20080123130144.GD24953@lazybastard.org>
	<Pine.LNX.4.64.0801231410410.25733@lnxricardw.se.axis.com>
	<20080123140639.GE24953@lazybastard.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: linux-mtd@lists.infradead.org, Josh Boyer <jwboyer@gmail.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Matthieu CASTET <matthieu.castet@parrot.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 23 Jan 2008, J=F6rn Engel wrote:

>> The only input I have got from chip manufacturers regarding this issue i=
s
>> that with inreasing bit densities and decreasing bit cell sizes in the
>> future, things like the probability of random bit flips are likely to
>> increase. (Somewhere there is a limit when the amount of error correctio=
n
>> needed to handle this things grows too large to make the chip practicall=
y
>> useful; say 10 error correction bits per stored bit or whatever).
>
> If error rates increase, device drivers have to do stronger error
> correction.  Quality after error correction has been done should stay
> roughly the same.

Yes, true, the first step is to increase the error correction capabilites,=
=20
but there comes a point when there are so many error correction bits=20
required per data bit that there is no point of increasing the memory=20
size.

Today we have 3 ECC bytes per 256 data bytes in an ordinary nand flash. If=
=20
geometries decrease we might at some point need, say 128 ECC bytes, and=20
further down the line perhaps even more ECC bytes than data bytes. It then=
=20
eventually comes to a point of diminishing returns; if the geometries are=
=20
decreased and error rates go up, the increase in number ECC bits might be=
=20
more than the gain in number of data bits. This is far down the line, and=
=20
partly speculative I agree.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
