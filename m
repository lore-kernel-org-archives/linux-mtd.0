Received: from pc3-stap1-6-cust96.nott.cable.ntl.com ([81.98.145.96] helo=server)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18YKIP-00009g-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Jan 2003 06:11:33 +0000
Received: from [10.0.0.2] (helo=linux)
	by server with esmtp (Exim 3.35 #1 (Debian))
	id 18YKlf-0003Nv-00
	for <linux-mtd@lists.infradead.org>; Tue, 14 Jan 2003 06:41:47 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Marcus Birkin <marcus.birkin@bigfooot.com>
To: linux-mtd@lists.infradead.org
Subject: Re: Grub on DiskOnChip2000
Date: Tue, 14 Jan 2003 06:42:06 +0000
References: <Pine.LNX.4.44.0301140109500.29365-100000@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.44.0301140109500.29365-100000@localhost.localdomain>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200301140642.06915.marcus.birkin@bigfooot.com>
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

On Tuesday 14 January 2003 6:16 am, Ilguiz Latypov wrote:
> There is the README_DiskOnChip file that appears after applying the pat=
ch
> from the patches/ directory.  It recommends to start these commands bef=
ore
> starting the configure script:
>
>    aclocal && automake && autoconf

I did this the first time to no avil.

> The above commands will re-generate the configure script and Makefile.i=
n
> files.  The patch itself won't modify the configure script and Makefile=
=2Ein
> just because it is possible to re-generate the latter files once their
> templates are patched.
>
> On Tue, 14 Jan 2003, Marcus Birkin wrote:
> > I've got to the stage where i compile grub, it compiles with out erro=
r.
> > But theres no grub_firmware in /stage1.
