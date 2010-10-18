Received: from mail-ew0-f49.google.com ([209.85.215.49])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P7wga-0006sU-Gg
	for linux-mtd@lists.infradead.org; Mon, 18 Oct 2010 20:52:02 +0000
Received: by ewy7 with SMTP id 7so1014788ewy.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Oct 2010 13:51:52 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: dedekind1@gmail.com
Subject: Re: Latest mkfs.jffs2 is broken.
References: <0D753D10438DA54287A00B02708426976450C42B27@AUSP01VMBX24.collaborationhost.net>
	<1287123245.18576.2.camel@localhost>
	<87pqvbetux.fsf@macbook.be.48ers.dk>
	<1287132218.18576.12.camel@localhost>
	<87lj5zet2y.fsf@macbook.be.48ers.dk> <1287244167.1781.2.camel@brekeke>
Date: Mon, 18 Oct 2010 22:51:48 +0200
In-Reply-To: <1287244167.1781.2.camel@brekeke> (Artem Bityutskiy's message of
	"Sat, 16 Oct 2010 18:49:27 +0300")
Message-ID: <871v7n442j.fsf@macbook.be.48ers.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: H Hartley Sweeten <hartleys@visionengravers.com>,
	linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>>>> "Artem" == Artem Bityutskiy <dedekind1@gmail.com> writes:

 Artem> On Fri, 2010-10-15 at 10:52 +0200, Peter Korsgaard wrote:
 >> >>>>> "Artem" == Artem Bityutskiy <dedekind1@gmail.com> writes:
 >> 
 >> >> Artem: Time for a v1.4.1 release?
 >> 
 Artem> Thanks. If it works, I'll back-port Mike's patch to 1.4.0 and tag it as
 Artem> 1.4.1. So 1.4.1 won't include tons of irrelevant commits.
 >> 
 >> Great. An easy way to test:

 Artem> Done. You can find v1.4.1 tag, tarball, and announcement in the "news"
 Artem> section of the web site.

Thanks, but the 1.4.1 tarball is screwed - It contains a bunch of build
files which breaks the build if they aren't removed first.

diff -urpN mtd-utils-1.4.?|diffstat
 compr_zlib.c                       |    2 
 cscope.out                         |314340 +++++++++++++++++++++++++++++++++++++
 jffs2reader.c                      |    1 
 mkfs.jffs2.c                       |   49 
 mkfs.ubifs/compr.c                 |    1 
 tests/fs-tests/lib/tests.o         |binary
 tests/ubi-tests/.common.c.dep      |   38 
 tests/ubi-tests/.integ.c.dep       |   38 
 tests/ubi-tests/.io_basic.c.dep    |   33 
 tests/ubi-tests/.io_paral.c.dep    |   32 
 tests/ubi-tests/.io_read.c.dep     |   33 
 tests/ubi-tests/.io_update.c.dep   |   33 
 tests/ubi-tests/.mkvol_bad.c.dep   |   24 
 tests/ubi-tests/.mkvol_basic.c.dep |   24 
 tests/ubi-tests/.mkvol_paral.c.dep |   27 
 tests/ubi-tests/.rsvol.c.dep       |   33 
 tests/ubi-tests/.volrefcnt.c.dep   |   31 
 tests/ubi-tests/common.o           |binary
 tests/ubi-tests/integ              |binary
 tests/ubi-tests/io_basic           |binary
 tests/ubi-tests/io_paral           |binary
 tests/ubi-tests/io_read            |binary
 tests/ubi-tests/io_update          |binary
 tests/ubi-tests/libubi.a           |binary
 tests/ubi-tests/libubi.o           |binary
 tests/ubi-tests/mkvol_bad          |binary
 tests/ubi-tests/mkvol_basic        |binary
 tests/ubi-tests/mkvol_paral        |binary
 tests/ubi-tests/rsvol              |binary
 tests/ubi-tests/volrefcnt          |binary
 ubi-utils/cscope.out               |164861 +++++++++++++++++++
 ubi-utils/libmtd.a                 |binary
 32 files changed, 479573 insertions(+), 27 deletions(-)

Care to fix that?

-- 
Bye, Peter Korsgaard
