Received: from miranda.se.axis.com ([193.13.178.8])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JoGvz-0000oQ-3B
	for linux-mtd@lists.infradead.org; Tue, 22 Apr 2008 11:45:15 +0000
Date: Tue, 22 Apr 2008 13:44:31 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: [U-Boot-Users] ubi and u-boot
In-Reply-To: <1208785853.5965.388.camel@sauron>
Message-ID: <Pine.LNX.4.64.0804221342130.16969@lnxricardw.se.axis.com>
References: <20080420222237.4AE5324657@gemini.denx.de>
	<1208779508.5965.371.camel@sauron>
	<Pine.LNX.4.64.0804211533140.27984@lnxricardw.se.axis.com>
	<1208785463.6654.34.camel@vader.jdub.homelinux.org>
	<1208785853.5965.388.camel@sauron>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "u-boot-users@lists.sourceforge.net" <u-boot-users@lists.sourceforge.net>,
	Josh Boyer <jwboyer@gmail.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 21 Apr 2008, Artem Bityutskiy wrote:

> On Mon, 2008-04-21 at 08:44 -0500, Josh Boyer wrote:
>> I think there was only 1 time the on-flash format changed, and that was
>> before UBI was merged upstream.  New features can be introduced with
>> additional flags, however older versions should be able to ignore those.
>>
>> Artem, is that right?  My memory is fuzzy here.
>
> [...] We never changed the media format since UBI was merged.

Ok, that sounds reassuring. I think I've been confusing UBI with UBIFS in=
=20
this respect.

/Ricard
--
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
