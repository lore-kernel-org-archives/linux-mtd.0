Received: from anubis.se.axis.com ([195.60.68.12])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SUY7Z-0002bh-68
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 06:54:05 +0000
Date: Wed, 16 May 2012 08:53:50 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Subodh Nijsure <snijsure@grid-net.com>
Subject: Re: How common is OTP support in NAND flash?
In-Reply-To: <1337077840.2528.151.camel@sauron.fi.intel.com>
Message-ID: <Pine.LNX.4.64.1205160852190.4754@lnxricardw.se.axis.com>
References: <4FAFC468.8080701@grid-net.com>
 <1337077840.2528.151.camel@sauron.fi.intel.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On Sun, 2012-05-13 at 07:25 -0700, Subodh Nijsure wrote:
>> I see that MTD char drivers have support for programming the OTP pages
>> on NAND flash, some questions regarding that.
>>
>> Do most flash chip vendors support on-flash OTP pages or if one develops
>> product that depends on using data from flash OTP, one would be locked
>> into that specific vendors.
>>
>> And does anybody know if these OTP pages are also subjected to
>> bit-flipping or one shouldn't have to worry about that for OTP pages?

I actually can't say I know, but since it is OTP, it's not possible to=20
erase and reprogram the data; and it's intended use for more or less=20
permanent information would strongly suggest that it must be an array of=20
classic EPROM cells with essentially no bit rot or it wouldn't be very=20
useful.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
