Received: from ash.lnxi.com ([207.88.130.242])
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 195ZP3-0002cM-9G
	for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2003 23:59:49 +0100
From: Thayne Harbaugh <tharbaugh@lnxi.com>
To: linux-mtd@lists.infradead.org
Message-Id: <1050447582.1171.222.camel@tubarao>
Mime-Version: 1.0
Date: 15 Apr 2003 16:59:42 -0600
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="=-PHKyMkP3vAjLwQUzs5vG"
Subject: WARNING: cfi_cmdset_0002 - consider updating your revision
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-PHKyMkP3vAjLwQUzs5vG
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable

All cfi_cmdset_0002 users please read.

I have just committed revision 1.67 of cfi_cmdset_0002.c.  It now works
well with interleaved chips - thanks to Alexander Wild for helping with
the debugging and testing.  It may change one more time for interleaved
chips to handle a very remote, spurious rejection case (it might return
an error when an operation really succeeded - see the FIXME comment that
was added in do_write_oneword()).

URGENT NOTE:  revision 1.64 of cfi_cmdset_0002.c and likely most prior
revisions allow some UNREPORTED failures (yes, I am yelling).  That
means that erase or write operations could fail and go unreported.=20
Depending on your application this could be serious data loss and I
encourage you to evaluate revision 1.67 to decide if you should upgrade.

The care and feeding of flash devices for erase and write operations
requires understanding of how the devices work and isn't as simple as it
appears - especially coupled with interleaved cases and other varying
uses.  The logic often seems redundant and inefficient.  I am quite
convinced that in the past, as people fixed bugs, different requirements
were understood by different people at different times and bugs would
get pushed back and forth and 'round and 'round and some would just
never get squished - the symptoms would just change.

I feel good that things are finally settling down with cfi_cmdset_002
and that it might just work now.  If the current version doesn't work
for you I need to hear about it soon.

To be completely forthcoming, I need to admit that I still have an
SST49LF040A that doesn't work completely.  I'm still trying to decide if
it's a software problem or a hardware problem.  I have multiple devices
that of this part - one being used for a BIOS chip on an Opteron
motherboard and one as BIOS on a Tyan 2466.  Both have the same problem
that occasionally they ignore an erase or write command - as if the
command was never sent.  This problem happened in cfi_cmdset_0002
revision 1.64 - it was never reported as an error by cfi_cmdset_0002 so
failures would happen at other locations - especially user-space
programs.  Strangely, these failures disappear on retries of the same
operation.

Kernel messages have enough information to get a feel for the operation
that failed and why it was marked as a failure.  If CONFIG_MTD_DEBUG is
turned on and CONFIG_MTD_DEBUG_VERBOSE is set to 3 then significant
command state is reported.  If you have a failure, please set the debug
level to 3 and send me your dmesg output.

Thanks.


--=20
Thayne Harbaugh
Linux Networx

--=-PHKyMkP3vAjLwQUzs5vG
Content-Type: application/pgp-signature; name=signature.asc
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.0.6 (GNU/Linux)
Comment: For info see http://www.gnupg.org

iD8DBQA+nI7efsBPTKE6HMkRAg5UAJ9g58O2KWFJqre9Q+E2lGVBPO+P/QCfZq3l
9FzZhGrqUWanVeS2NDTi/NM=
=mSdW
-----END PGP SIGNATURE-----

--=-PHKyMkP3vAjLwQUzs5vG--
