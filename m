Received: from mga02.intel.com ([134.134.136.20])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HD26s-0004yA-NE
	for linux-mtd@lists.infradead.org; Fri, 02 Feb 2007 12:22:05 -0500
Content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Subject: RE: Oops parsing empty RedBoot partition with 2.6.20-rc7
Date: Fri, 2 Feb 2007 10:22:01 -0700
Message-ID: <0C7297FA1D2D244A9C7F6959C0BF1E520148F6A0@azsmsx413.amr.corp.intel.com>
In-Reply-To: <20070202155607.GA31304@deprecation.cyrius.com>
From: "Williams, Dan J" <dan.j.williams@intel.com>
To: "Martin Michlmayr" <tbm@cyrius.com>,
	<linux-mtd@lists.infradead.org>
Cc: buytenh@wantstofly.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> With current git (2.6.20-rc7) I get the following oops when it's
> trying to parse the RedBoot partition.  This is on an IOP13xx based
> board (Intel iq81340mc).  I guess the problm happens because I don't
> have any RedBoot partitions.  Note that 2.6.19 work fine.
>=20
I am seeing this as well.  After a 'fis init' it starts working, but our
customer reference boards normally ship without a partition table.  As
you said this works fine on 2.6.19.  You may be able to do a 'git
bisect' if iop13xx support was added before this regression...

Dan
