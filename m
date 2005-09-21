Received: from desire.actrix.co.nz ([203.96.16.164])
	by canuck.infradead.org with esmtp (Exim 4.52 #1 (Red Hat Linux))
	id 1EHvTA-00044C-UP
	for linux-mtd@lists.infradead.org; Tue, 20 Sep 2005 23:40:39 -0400
From: Charles Manning <manningc2@actrix.gen.nz>
To: David Woodhouse <dwmw2@infradead.org>
Date: Wed, 21 Sep 2005 15:45:32 +1200
References: <Pine.LNX.4.44.0509191525180.1130-100000@hkn.eecs.berkeley.edu>
	<200509201332.31431.manningc2@actrix.gen.nz>
	<1127209144.9750.47.camel@baythorne.infradead.org>
In-Reply-To: <1127209144.9750.47.camel@baythorne.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200509211545.32443.manningc2@actrix.gen.nz>
Cc: linux-mtd@lists.infradead.org
Subject: Re: FAT on raw Nand -->PTP
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 20 September 2005 21:39, David Woodhouse wrote:
> On Tue, 2005-09-20 at 13:32 +1200, Charles Manning wrote:
> > Unfortunately there is no USB-NFS. There is only a USB mass storage
> > device which can be used with most block file systems (typically FAT).
> > USB-NFS would have been a good idea because it would allow devices to u=
se
> > their own FS internally.
>
> The 'USB-NFS' of which you speak is called 'PTP', and it's used by many
> cameras.

=46rom a quick read of the USB PTP spec, it would seem that PTP is rather=20
picture centric. Is that the case or can PTP also be used for more general=
=20
data?
