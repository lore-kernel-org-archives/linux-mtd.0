Received: from albatross-ext.wise.edt.ericsson.se ([193.180.251.49])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AgSYW-00087W-O2
	for linux-mtd@lists.infradead.org; Tue, 13 Jan 2004 17:42:20 +0000
From: Kenneth Johansson <kenneth.johansson@etx.ericsson.se>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20040113172920.GB25159@wohnheim.fh-wedel.de>
References: <20040113125031.GA5146@angel.research.nokia.com>
	 <1074001140.17620.3.camel@hades.cambridge.redhat.com>
	 <1074007527.9219.11.camel@spawn.uab.ericsson.se>
	 <1074007799.17620.60.camel@hades.cambridge.redhat.com>
	 <1074010874.9216.28.camel@spawn.uab.ericsson.se>
	 <20040113172920.GB25159@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=ISO-8859-1
Message-Id: <1074015609.9220.35.camel@spawn.uab.ericsson.se>
Mime-Version: 1.0
Date: Tue, 13 Jan 2004 18:40:09 +0100
Content-Transfer-Encoding: quoted-printable
cc: "Jarkko Lavinen \(NMP/Helsinki\)" <jarkko.lavinen@nokia.com>
cc: David Woodhouse <dwmw2@infradead.org>
cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 mount time
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-01-13 at 18:29, J=F6rn Engel wrote:
> On Tue, 13 January 2004 17:21:15 +0100, Kenneth Johansson wrote:
> >=20
> > hmm I reread the firt post why is read so slow?? When I thought about
> > using nand I read that reading a byte took something like 50 ns. That i=
s
> > like 20MB per second for an 8 bit device. This is in the region where i=
t
> > did not pay to be smart,the accesses overhead to do read only what's
> > needed is greater than the time wasted reading uneccessary data.=20
>=20
> But on nand it is not only possible, but also likely that flash size
> is greater than ram size.  Does your approach still work then?
>=20
> J=F6rn

Obviously no. But maybe it's still cheaper to do the work in big chunks
I don't know you need to actually do a test to see what happens. It's
not so easy to see in advance what will happen. I thought for sure that
it would be faster to only read what was needed but it was not, at least
not on a 200 MHz ppc if you have an P4 3GHz the picture is quite
different.
