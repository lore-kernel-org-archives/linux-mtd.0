Received: from ash.lnxi.com ([207.88.130.242] helo=DLT.linuxnetworx.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16PBHu-0007uf-00
	for <linux-mtd@lists.infradead.org>; Fri, 11 Jan 2002 23:40:44 +0000
To: "Charles Steinkuehler" <charles@steinkuehler.net>
Cc: <linux-mtd@lists.infradead.org>
Subject: Re: Atmel Flash
References: <E16MWkI-0003Z1-00@pentafluge.infradead.org>
	<20020104085040.A48397@idiom.com>
	<179401c19af8$a0418560$4101220a@csteinathlon>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 11 Jan 2002 16:51:20 -0700
In-Reply-To: <179401c19af8$a0418560$4101220a@csteinathlon>
Message-ID: <m3k7uotpjb.fsf@DLT.linuxnetworx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

"Charles Steinkuehler" <charles@steinkuehler.net> writes:

> Are the small-sector Atmel flash (ie 29C010/29C040) parts supported by MTD?
> 
> These are the parts with 128/256 Byte sector size (ie 1024 128 byte sectors
> in the '010, and 2048 256 byte sectors in the '040), with no explicit erase
> command required before writing new data.

Other atmel parts are.  If they aren't cfi then there is the issue
that they aren't in the table jedec_probe.c.   But it should be trivial
to add them.

Eric
