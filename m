Received: from mail.mediatrix.com ([205.237.248.11])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15D7qw-0006We-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Jun 2001 18:02:46 +0100
Message-ID: <F1BED55F35F4D3118C0F00E0295CFF4D9954D0@mail.mediatrix.com>
From: Frederic Giasson <fgiasson@mediatrix.com>
To: 'Nicolas Pitre' <nico@cam.org>, Frederic Giasson
	 <fgiasson@mediatrix.com>
Cc: =?iso-8859-1?Q?=27K=E1ri_Dav=ED=F0sson=27?= <kd@flaga.is>,
	"MTD mailing list (E-mail)" <linux-mtd@lists.infradead.org>
Subject: RE: jffs2_scan_medium effor
Date: Thu, 21 Jun 2001 13:02:59 -0400
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
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

Because my boot monitor is straigth in the middle of my flash and I =
can't
move it for an hardware reason.

Fr=E9d=E9ric Giasson





-----Original Message-----
From: Nicolas Pitre [mailto:nico@cam.org]
Sent: Thursday, June 21, 2001 1:07 PM
To: Frederic Giasson
Cc: 'K=E1ri Dav=ED=F0sson'; MTD mailing list (E-mail)
Subject: RE: jffs2_scan_medium effor




On Thu, 21 Jun 2001, Frederic Giasson wrote:

> Thank you Kari for your help.
>
> 	I tried partionning as you suggested, but I loose a lot of space
> because I have two seperate partitions on which I mount JFFS2.  It =
takes
the
> same space ( roughly 324 KB ) for its own usage per partition.  =
Therefore,
I
> can't afford the partitioning method to map my flash because I was =
already
> tight on it with 324K taken by JFFS2.

Why can't you make only a single JFFS2 partition out of the two you
currently made?


Nicolas
