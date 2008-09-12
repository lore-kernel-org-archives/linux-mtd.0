Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Ke9YR-0000wC-7j
	for linux-mtd@lists.infradead.org; Fri, 12 Sep 2008 14:23:23 +0000
Date: Fri, 12 Sep 2008 16:23:20 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Ensar Gul <ensar.gul@multitekarge.com>
Subject: Re: Maturity of JFFS2 + MTD NAND Flash Support?
In-Reply-To: <48CA0C11.6080402@multitekarge.com>
Message-ID: <Pine.LNX.4.64.0809121621140.14452@lnxricardw.se.axis.com>
References: <mailman.11.1221062402.21406.linux-mtd@lists.infradead.org>
	<48CA0C11.6080402@multitekarge.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Fri, 12 Sep 2008, Ensar Gul wrote:

>> AFAIK, jffs2 doesn't handle correctly bit flip on read : it won't try to
>> copy the data on another block while the data can still be recovered
>> by ecc.
>>
>> I believe it could be a big issue for commercial product where no
>> corruption should happen.
>>
>>
>> Matthieu
>
> Is there a solution to the problem stated above yet?

I belive UBI has some form of block scrubbing to minimize the problem,=20
there should be more info on the mtd homepage.

> By the way, I also used JFFS2 on NAND flash as root filesystem in a=20
> telecom product. but the root filesystem infrequently becomes corrupt=20
> without any apparent reason. I`m considering to redesign the hardware=20
> and use an alternative device instead of NAND flash.

A while ago, there was a bug in the ECC code whereby a single-bit error in=
=20
the actual ECC bytes was not handled (i.e. corrected) correctly and=20
resulted in the corresponding data to be considered faulty (as if a=20
multiple-bit error had occurred). This was several Linux versions ago, I=20
don't remember the exact version.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
