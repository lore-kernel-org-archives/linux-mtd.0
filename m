Received: from ra.se.axis.com ([195.60.68.13])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pswy0-0003iL-9r
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 12:40:16 +0000
Date: Fri, 25 Feb 2011 13:40:14 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: Mean Time Between Failure - UBI clarifications
In-Reply-To: <1298637391.2798.101.camel@localhost>
Message-ID: <Pine.LNX.4.64.1102251339360.2784@lnxricardw.se.axis.com>
References: <AANLkTimPpD=M2pyfm3iV2Hbr61Jgzk8avMebN9LdYmyK@mail.gmail.com>
	<Pine.LNX.4.64.1102241445050.2784@lnxricardw.se.axis.com>
	<1298637391.2798.101.camel@localhost>
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


On Fri, 25 Feb 2011, Artem Bityutskiy wrote:

> On Thu, 2011-02-24 at 15:04 +0100, Ricard Wanderlof wrote:
>> I don't know about UBI, someone else probably does.
>
> No, UBI does not collect bit-flips statistics. It could be changed
> though, someone could send a patch.

But don't bit flips eventually trigger bit scrubbing in UBI?

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
