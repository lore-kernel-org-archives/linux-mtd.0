Received: from skyhigh.actrix.co.nz ([203.96.16.175])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1F9Zb3-0006SP-Ik
	for linux-mtd@lists.infradead.org; Wed, 15 Feb 2006 22:14:24 -0500
From: Charles Manning <manningc2@actrix.gen.nz>
To: linux-mtd@lists.infradead.org
Date: Thu, 16 Feb 2006 16:17:04 +1300
References: <200602091126.10462.manningc2@actrix.gen.nz>
	<200602141510.12749.wolfgang.mues@auerswald.de>
In-Reply-To: <200602141510.12749.wolfgang.mues@auerswald.de>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Message-Id: <200602161617.04905.manningc2@actrix.gen.nz>
Cc: Wolfgang =?iso-8859-15?q?M=FCes?= <wolfgang.mues@auerswald.de>
Subject: Re: Questions about NAND (double)bit errors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday 15 February 2006 03:10, Wolfgang M=FCes wrote:
> Hello Charles,
>
> Charles Manning wrote:
> > * YAFFS is very conservative on dealing with ECC failures. YAFFS retires
> > a block if one ECC failure is seen. JFFS2, IIRC allows five of so failu=
re
> > before retiring a block. The Toshiba folk have told me that if a block =
is
> > going bad, it is most likely to start displaying recoverable 1-bit erro=
rs
> > before displaying non-recoverable multi-bit errors. Thus, YAFFS will
> > potentially perform differently in this area.
>
> About bad block detection: what is your oppinion about partitioning the
> flash (the programs in a read-only partition, the data in r/w).

This gets fs specific. With YAFFS (and I assume JFFS2, but consult an exper=
t),=20
grabage collection will force read-only files to get rewritten occasionally=
=2E=20
Thus for ultimate reliability it is probably a GoodIdea to seperate the=20
read-only stuff into a seperate partition. This is also a GoodIdea in that =
a=20
smaller partition mounts faster (true for YAFFS and JFFS2). So if all your=
=20
kernel + mount stuff is seperated from your rw stuff things will probably d=
go=20
better.
>
> How about detection of ECC errors in read only partitions?

ECC should be done on both rw and read-only partitions. Sometimes NAND gets=
=20
read disturbs which would impact on read-only partitions. Also, write=20
disturbs from writes to one partition can still corrupt a read-only partiti=
on=20
on the same chip.

>
> > One important factor, IMHO, is how you handle the write protect pin on
> > the NAND. Some people tie the WP to the power supply failure flag. IMHO
> > this is a bad thing to do since it can cause incomplete writes to happen
> > if the wp is asserted during a write or erase cycle.
>
> I have checked this.
>
> WP is tied to VCC, and VCC is stable at least 500ms after a power fail
> detect.

500ms is long enough to grow a beard.

There's been some interesting discussion over in yaffs-land on this. If you=
=20
don't subscribe to yaffs list then you can catch up on the yaffs archive.

=2D- Charles
