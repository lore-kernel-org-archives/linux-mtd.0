Received: from ash.lnxi.com ([207.88.130.242] helo=DLT.linuxnetworx.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16azo6-0002l8-00
	for <linux-mtd@lists.infradead.org>; Wed, 13 Feb 2002 13:50:47 +0000
To: Daniel =?iso-8859-1?q?Engstr=F6m?= <daniel@omicron.se>
Cc: robert@schwebel.de, linux-mtd@lists.infradead.org,
        "Klaus-D . Walter" <k.d.walter@t-online.de>
Subject: Re: MTD concat layer
References: <31104.1013598277@redhat.com>
	<Pine.LNX.4.33.0202131235550.24650-100000@callisto.local>
	<20020213143336.C26867@jupiter.omicron.se>
From: ebiederman@lnxi.com (Eric W. Biederman)
Date: 13 Feb 2002 07:01:35 -0700
In-Reply-To: <20020213143336.C26867@jupiter.omicron.se>
Message-ID: <m3sn85pjk0.fsf@DLT.linuxnetworx.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
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

Daniel Engstr=F6m <daniel@omicron.se> writes:

> On 2002.02.13 12:37 Robert Schwebel wrote:
> > The DNP has only one Intel 28F016F3 flash chip. Does anybody know
> > something about the reason why this strange layout for the BIOS was
> > chosen?
>=20
> The realmode BIOS must reside at 0xf0000-0xfffff in system
> memory. Depending
> on which options the chipset offers to map the flash, the BIOS may have to
> be located in the middle of the flash device.

Hmm.  Except the BIOS starts executing at 0xfffffff0 in system memory,
so ROMS chips usually reside at 0xfff00000 - 0xffffffff.  Usually an
alias exists at 0xf0000-0xfffff is handy but not required.  (I
don't use it when I port LinuxBIOS to a new board).  But usually
0xf0000-0xfffff on x86 is surrounded by RAM so this does not appear to
be the reason.

Eric
