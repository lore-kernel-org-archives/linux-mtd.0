Received: from zeus.vortex.is ([193.4.145.1])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15D8Fb-0006Xy-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Jun 2001 18:28:15 +0100
Received: from froskur.flaga.is (mail.flaga.is [193.4.144.1])
          by zeus.vortex.is (Post.Office MTA v3.5.3 release 223
          ID# 0-71211U5000L1850S0V35) with ESMTP id is
          for <linux-mtd@lists.infradead.org>;
          Thu, 21 Jun 2001 17:33:47 +0000
Received: from kolkrabbi.flaga.is ([192.168.145.6]) by froskur.flaga.is
          (Post.Office MTA v3.5.3 release 223 ID# 0-0U10L2S100V35)
          with ESMTP id is for <linux-mtd@lists.infradead.org>;
          Thu, 21 Jun 2001 17:33:44 +0000
content-class: urn:content-classes:message
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Subject: RE: jffs2_scan_medium effor
Date: Thu, 21 Jun 2001 17:33:43 -0000
Message-ID: <EADB10BAC266A14A85ECBF8686A73E314591DB@kolkrabbi.flaga.is>
From: =?iso-8859-1?B?S+FyaSBEYXbt8HNzb24=?= <kd@flaga.is>
To: "Frederic Giasson" <fgiasson@mediatrix.com>,
	"Nicolas Pitre" <nico@cam.org>
Cc: "MTD mailing list (E-mail)" <linux-mtd@lists.infradead.org>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Maybe there is a way to mark the sectors were the bootmonitor resides as

"burnt out" or reserved so that the jffs2 does not attempt to use the.

Then in theory you could just make one partition of the whole flash with
few "bad" sectors that are not used by the jffs2....

Just an idea.....

K.D.

> -----Original Message-----
> From: Frederic Giasson [mailto:fgiasson@mediatrix.com]
> Sent: 21. j=FAn=ED 2001 17:03
> To: 'Nicolas Pitre'; Frederic Giasson
> Cc: K=E1ri Dav=ED=F0sson; MTD mailing list (E-mail)
> Subject: RE: jffs2_scan_medium effor
>=20
>=20
> Because my boot monitor is straigth in the middle of my flash=20
> and I can't
> move it for an hardware reason.
>=20
> Fr=E9d=E9ric Giasson
>=20
>=20
>=20
>=20
>=20
> -----Original Message-----
> From: Nicolas Pitre [mailto:nico@cam.org]
> Sent: Thursday, June 21, 2001 1:07 PM
> To: Frederic Giasson
> Cc: 'K=E1ri Dav=ED=F0sson'; MTD mailing list (E-mail)
> Subject: RE: jffs2_scan_medium effor
>=20
>=20
>=20
>=20
> On Thu, 21 Jun 2001, Frederic Giasson wrote:
>=20
> > Thank you Kari for your help.
> >
> > 	I tried partionning as you suggested, but I loose a lot of space
> > because I have two seperate partitions on which I mount=20
> JFFS2.  It takes
> the
> > same space ( roughly 324 KB ) for its own usage per=20
> partition.  Therefore,
> I
> > can't afford the partitioning method to map my flash=20
> because I was already
> > tight on it with 324K taken by JFFS2.
>=20
> Why can't you make only a single JFFS2 partition out of the two you
> currently made?
>=20
>=20
> Nicolas
>=20
