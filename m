Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1R3305-0006pR-0x
	for linux-mtd@lists.infradead.org; Mon, 12 Sep 2011 09:40:25 +0000
Date: Mon, 12 Sep 2011 11:40:23 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: mtd-utils: ubiformat: writing images on flash with badblocks.
In-Reply-To: <1315819985.18731.72.camel@sauron>
Message-ID: <Pine.LNX.4.64.1109121140050.8150@lnxricardw.se.axis.com>
References: <CAMjE+nUOxOm4bBWKp1xAcVDjP-Pepd_GuJ=DcQ4jUcsohn-K=g@mail.gmail.com>
	<1315738766.18731.9.camel@sauron>
	<Pine.LNX.4.64.1109120840020.8150@lnxricardw.se.axis.com>
	<1315819985.18731.72.camel@sauron>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	=?utf-8?B?UmljYXJkIFdhbmRlcmzDtmY=?= <ricardw@axis.com>,
	Anton Olofsson <anol.martinsson@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 12 Sep 2011, Artem Bityutskiy wrote:

>>> when ubiformat encounters a write error while flashing the UBI image (w=
hich may
>>> come from a file of from stdout), it correctly marks the faulty erasebl=
ock as
>>> bad and skips it. However, it also incorrectly drops the data buffer wh=
ich was
>>> supposed to be written, and reads next block of data.
>>
>> I'm just curious, how come this has gone unnoticed for so long? One woul=
d
>> think that someone would have tried to flash an image to a chip with bad
>> blocks a long time ago?
>
> No, bad blocks are handled fine. This is about the situation when an
> eraseblock is good, then we write to it, and we get an error, then we
> torture it, and the test fails, and we (ubiformat) mark it as bad. This
> is very rare situation indeed.

Agreed. Sorry I missed the complete background.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
