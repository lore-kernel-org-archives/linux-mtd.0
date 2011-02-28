Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Pu55k-0003Xv-DJ
	for linux-mtd@lists.infradead.org; Mon, 28 Feb 2011 15:32:57 +0000
Date: Mon, 28 Feb 2011 16:32:53 +0100 (CET)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Navaneethan P <pnavanee@gmail.com>
Subject: Re: Mean Time Between Failure - UBI clarifications
In-Reply-To: <AANLkTi=Vq0NjLO2TqKADzF+pA++UroeKbGPg1Gzqpd+d@mail.gmail.com>
Message-ID: <Pine.LNX.4.64.1102281631010.2784@lnxricardw.se.axis.com>
References: <AANLkTimPpD=M2pyfm3iV2Hbr61Jgzk8avMebN9LdYmyK@mail.gmail.com>
	<Pine.LNX.4.64.1102241445050.2784@lnxricardw.se.axis.com>
	<AANLkTi=Vq0NjLO2TqKADzF+pA++UroeKbGPg1Gzqpd+d@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=iso-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: "Stefan.Bigler@keymile.com" <Stefan.Bigler@keymile.com>,
	"navaneethan.p@aricent.com" <navaneethan.p@aricent.com>,
	=?iso-8859-1?Q?Ricard_Wanderl=F6f?= <ricardw@axis.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Sundararajan.Somasundaram@aricent.com"
	<Sundararajan.Somasundaram@aricent.com>,
	"Shenbaga.Nathan@aricent.com" <Shenbaga.Nathan@aricent.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Mon, 28 Feb 2011, Navaneethan P wrote:

> Thank you for your response.
>
> On Thu, Feb 24, 2011 at 7:34 PM, Ricard Wanderlof
> <ricard.wanderlof@axis.com> wrote:
>> mtd supplies statistics counters that might help. For each mtd partition
>> there is one counter which is increased every time a read operation requ=
ires
>> ECC to correct a bit (i.e. a correctable single bit error), and one coun=
ter
>> for ECC failures (two-bit errors).
>
> I checked the mtd directory of sysfs and also the source code of mtd.
> However I could not find the mtd statistics counter from the available
> source mtd-2.6.28. Could you please guide me as to where the
> statistics counters are implemented inside mtd source.

They're in mtd->ecc_stats . See drivers/mtd/nand/nand_base.c for=20
instance. drivers/mtd/mtdchar.c:mtd_ioctl (case ECCGETSTATS) retrievs the=
=20
statistics to userspace for the ECCGETSTATS ioctl.

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
