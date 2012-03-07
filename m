Received: from anubis.se.axis.com ([195.60.68.12])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5Jh7-0001vO-JF
 for linux-mtd@lists.infradead.org; Wed, 07 Mar 2012 16:26:30 +0000
Date: Wed, 7 Mar 2012 17:26:17 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBI/ubifs problem
In-Reply-To: <1331131250.32316.8.camel@sauron.fi.intel.com>
Message-ID: <Pine.LNX.4.64.1203071723410.21132@lnxricardw.se.axis.com>
References: <Pine.LNX.4.64.1202161543340.13194@lnxricardw.se.axis.com>
 <Pine.LNX.4.64.1202171107440.13194@lnxricardw.se.axis.com>
 <1331131250.32316.8.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: =?utf-8?B?UmljYXJkIFdhbmRlcmzDtmY=?= <ricardw@axis.com>,
 Linux mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 7 Mar 2012, Artem Bityutskiy wrote:

> When you specify --max-leb-count=3D1000, but not specify the journal size=
,
> mkfs.ubifs defines the journal size to be around 12% of that, but not
> larger than 8MiB. This sets the low UBI volume size boundary.
>
> So basically the error you get means that your UBI volume is too small
> to fit the journal.
>
> To see the journal size of your image use -v mkfs.ubifs option when you
> generate it.
>
> You can define your own journal size using the --jrn-size mkfs.ubifs=20
> option.

Is it possible to get mkfs.ubifs to create an image without specifying the=
=20
max-leb-count ? I.e. just to create an image that is as big as it has to=20
be. Admittedly, one would have to figure out the size of the resulting=20
volume afterwards, to provide an allocation size for ubimkvol or ubinize,=
=20
so perhaps it would help much.

>> That being so, I think the resulting error message is odd, which indicat=
es
>> there is a bug somewhere, probably in mkfs.ubifs ?
>
> I agree that the message is odd. Below is the patch which I'll push to
> linux-ubifs.git as soon as git.infradead.org is available (it is down
> now for the reasons I do not know). I am open to additional or different
> suggestions. Thanks!
>
> P.S. I did not even compile - test the below patch, but will push out a
> tested version.

Thanks for the patch, I'll try to test it.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
