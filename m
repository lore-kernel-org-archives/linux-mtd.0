Received: from anubis.se.axis.com ([195.60.68.12])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RIEW8-0007ud-L8
	for linux-mtd@lists.infradead.org; Mon, 24 Oct 2011 07:00:17 +0000
Date: Mon, 24 Oct 2011 09:00:10 +0200 (CEST)
From: Ricard Wanderlof <ricard.wanderlof@axis.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: RE: UBIFS recovery fails
In-Reply-To: <1319129028.20953.26.camel@sauron>
Message-ID: <Pine.LNX.4.64.1110240857490.30940@lnxricardw.se.axis.com>
References: <4E9C2DAC.7090109@swissonline.ch> <1318882668.2172.10.camel@koala>
	<225442585F89274EA3A62F88671ECBAC0D33C8E2@prod-svr-1.intranet.str.ca>
	<20111018145413.GA8576@parrot.com>
	<225442585F89274EA3A62F88671ECBAC0D33C8EB@prod-svr-1.intranet.str.ca>
	<1319129028.20953.26.camel@sauron>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Cc: Ivan Djelic <ivan.djelic@parrot.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	=?utf-8?B?SmVhbi1Tw6liYXN0aWVuIEdhZ25vbg==?= <jsgagnon@vizimax.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 20 Oct 2011, Artem Bityutskiy wrote:

>> The real problem appears when those faulty bits are unstable: during=20
>> the first few read attempts, the page may be successfully read=20
>> (possibly with ecc corrections); and then, a bit later, the page=20
>> becomes unreadable because of too many faulty bits.
>
> Right. If you first get a correctable bit-flip, UBI will schedule this
> PEB for scrubbing. When the background thread starts scrubbing, it will
> read the PEB _again_, and this time it can end up with an uncorrectable
> ECC error.
>
> This is probably also a good point: when UBIFS recovers, it should
> probably somehow ask UBI to _not_ do scrubbing, to avoid failures at UBI
> level if UBI decides to scrub a PEB before UBIFS erase-cycles it.
>
> IOW, the whole stack (not only UBIFS) should make sure the PEBs with
> unstable bits are read only once.

How would UBI+ubifs compare to jffs2 in this respect? I would na=EFvely=20
assume that since jffs2 doesn't do any scrubbing, it would just return ok=
=20
if the data happened to be read correctly that time, and something like an=
=20
I/O error if the data was faulty, but without taking any special action in=
=20
that case?

/Ricard
--=20
Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
Axis Communications AB, Lund, Sweden            www.axis.com
Phone +46 46 272 2016                           Fax +46 46 13 61 30
