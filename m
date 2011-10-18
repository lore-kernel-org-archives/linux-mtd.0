Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RG4mF-000493-Pm
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2011 08:12:00 +0000
Date: Tue, 18 Oct 2011 10:11:54 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: UBIFS recovery fails
In-Reply-To: <1318882668.2172.10.camel@koala>
Message-ID: <Pine.LNX.4.64.1110181007100.30940@lnxricardw.se.axis.com>
References: <4E9C2DAC.7090109@swissonline.ch> <1318882668.2172.10.camel@koala>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 17 Oct 2011, Artem Bityutskiy wrote:

> [...] Unfortunately, no one really invested time into making UBIFS=20
> support MLC very well. It needs some more work. It also have some issues=
=20
> related to unstable bits in modern SLC.
>
> In short - if you want to use UBIFS on MLC - you should not have unclean
> reboots. If you want to make UBIFS 100% uclean-reboot save on MLC - you
> need to work on it some more.
>
> We (the original authors) developed and tested it on very robust SLC
> NAND.

Do you have any specifics on what the issues are with MLC ?

Since UBI implements bit scrubbing and eraseblock torture on questionable=
=20
blocks it would seem that a lot of the work has been done in order to=20
handle unstable bits. Is there some issue which is related specifically to=
=20
bit flips happening while the system is powered off?

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
