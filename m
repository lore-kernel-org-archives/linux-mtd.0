Received: from ra.se.axis.com ([195.60.68.13])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYcgY-000411-BY
 for linux-mtd@lists.infradead.org; Tue, 22 Oct 2013 14:11:50 +0000
Date: Tue, 22 Oct 2013 16:10:56 +0200
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: =?ISO-8859-15?Q?Steffen_K=FChn?= <sk@ammonit.com>
Subject: Re: problem with ecc errors and ubifs
In-Reply-To: <5266794F.8020504@ammonit.com>
Message-ID: <alpine.DEB.2.00.1310221610040.28562@lnxricardw.se.axis.com>
References: <52666705.8040000@ammonit.com>
 <alpine.DEB.2.00.1310221356080.28562@lnxricardw.se.axis.com>
 <5266794F.8020504@ammonit.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-15"; format=flowed
Content-Transfer-Encoding: 8BIT
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Tue, 22 Oct 2013, Steffen Kühn wrote:

> thanks for your answer.
>
>> The risk would be that eventually the number of errors would grow past
>> the ECC capability and subsequently lead to unreadable data. If there
>> indeed is a bug in the scrubbing mechanism, I agree it would be better
>> to just correct the bits and hope not too many of them flip. But it
>> would be better to try and fix the problem with scrubbing...
>
> I agree with you that a fix of the scrubbing mechanism would be better.
> Unfortunately, the problem is very hard to reproduce (and debug).

So it happens very seldom then?

> And perhaps it is already solved? My kernel is not the newest. But it is
> not possible to change the version because we have some patches (related
> to other hardware) which only works with kernel 3.2.
>
> Do you know about some important bug fixes which have something to do
> with the "scrubbing" in the last months?

Not offhand, but I don't keep track of all corrected bugs. A quick scan in 
the mailing list archives might be useful.

/Ricard
-- 
Ricard Wolf Wanderlöf                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
