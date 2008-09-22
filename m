Received: from main.gmane.org ([80.91.229.2] helo=ciao.gmane.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KhqsI-0007Sd-Bx
	for linux-mtd@lists.infradead.org; Mon, 22 Sep 2008 19:15:10 +0000
Received: from root by ciao.gmane.org with local (Exim 4.43)
	id 1KhqsB-0001vC-22
	for linux-mtd@lists.infradead.org; Mon, 22 Sep 2008 19:15:03 +0000
Received: from c-24-61-246-146.hsd1.ma.comcast.net ([24.61.246.146])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 22 Sep 2008 19:15:03 +0000
Received: from i.am by c-24-61-246-146.hsd1.ma.comcast.net with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <linux-mtd@lists.infradead.org>; Mon, 22 Sep 2008 19:15:03 +0000
To: linux-mtd@lists.infradead.org
From: Jim Ramsay <i.am@jimramsay.com>
Subject: Should MTD_WRITEABLE be split into MTD_WRITEABLE and MTD_ERASEABLE?
Date: Mon, 22 Sep 2008 15:03:32 -0400
Message-ID: <20080922150332.57fb2252@altair.jimramsay.com>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/JIp9455AcSUbpTKq.2rQfcA";
	protocol="application/pgp-signature"; micalg=PGP-SHA1
Sender: news <news@ger.gmane.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

--Sig_/JIp9455AcSUbpTKq.2rQfcA
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Currently, MTD partitions that do not begin and end exactly on an erase
sector boundary are forced to be read-only (The MTD_WRITEABLE flag is
forcibly removed).  I understand that this is required so that you
don't try to erase that partition and accidentally blow away other
information on other partitions that may also share the erase sector.

However, in the case of embedded systems, it can be very useful to
create a very small MTD partition for a simple write-once facility
(such as for capturing part of a log file or crash dump), and this
check makes such a partition impossible - Even if the code that
actually adds the partition is clever enough to properly erase that
area of flash before adding it.  There is no technical reason of which
I am aware that prevents normal mtd_write code from working on a small
non-erase-aligned partition if it has been previously erased.

So I would suggest that splitting MTD_WRITEABLE into two flags,
MTD_WRITEABLE and MTD_ERASEABLE would be a good idea.  The current
check for erase boundaries would then only remove MTD_ERASEABLE, whereas
MTD_WRITEABLE could still be removed via the mtd_partition.mask_flags
when required.

Would this have more side-effects than I currently understand?  Or would
it be a useful feature that may be considered for inclusion into MTD if
I were to write up a patch?

The other possibility, which is my current workaround, just adds a
special flag (MTD_UNALIGNED) which when found in
mtd_partition.mask_flags, skips the check erase boundary alignment
checks and allows these small partitions to be writeable. However, I'm
not sure what would happen if I tried to erase this small partition, so
I think splitting the WRITEABLE flag is a much more proper solution.

--=20
Jim Ramsay
"Me fail English?  That's unpossible!"

--Sig_/JIp9455AcSUbpTKq.2rQfcA
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.9 (GNU/Linux)

iEYEARECAAYFAkjX7AwACgkQelWXok6VKuib9ACgg0HO9cyFV/mu2l6kYFjlve7r
/wYAn3c7FO6NycpyAE+zuNEtcGmcWt7y
=K0/p
-----END PGP SIGNATURE-----

--Sig_/JIp9455AcSUbpTKq.2rQfcA--
