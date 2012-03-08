Received: from anubis.se.axis.com ([195.60.68.12])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5Vc5-0005Ma-QA
 for linux-mtd@lists.infradead.org; Thu, 08 Mar 2012 05:10:08 +0000
Date: Thu, 8 Mar 2012 06:09:56 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBI/ubifs problem
In-Reply-To: <1331138261.3463.19.camel@sauron.fi.intel.com>
Message-ID: <Pine.LNX.4.64.1203080606110.24516@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1202161543340.13194@lnxricardw.se.axis.com>
 <Pine.LNX.4.64.1202171107440.13194@lnxricardw.se.axis.com>
 <1331131250.32316.8.camel@sauron.fi.intel.com>
 <Pine.LNX.4.64.1203071723410.21132@lnxricardw.se.axis.com>
 <1331138261.3463.19.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 7 Mar 2012, Artem Bityutskiy wrote:

> On Wed, 2012-03-07 at 17:26 +0100, Ricard Wanderlof wrote:
>> Is it possible to get mkfs.ubifs to create an image without specifying t=
he
>> max-leb-count ? I.e. just to create an image that is as big as it has to
>> be.
>
> Has to be? :-) Not sure how to find this out. Basically the idea was
> that you know how big is has to be and translate that to
> --max-leb-count.

I think what I'm thinking about is that in the specialized case of ubifs=20
used for a read-only file system, such as a root file system (without=20
/etc, /var, and so on), it would be possible for mkfs.ubifs to create a=20
file system, and use as many LEBs as it needs for the actual data. On a=20
read-only file system there doesn't even have to be a journal, although I=
=20
don't know if that is possible.

In that case one could simply feed the required directory structure to=20
mkfs.ubifs, and it would create the file system image, and report how many=
=20
LEBs are required in the flash.

> It broke compilation, the working one is attached.

Ok, I'll have a look at the new one instead.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
