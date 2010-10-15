Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P6flN-0001jb-Nf
	for linux-mtd@lists.infradead.org; Fri, 15 Oct 2010 08:35:43 +0000
Received: by wyi11 with SMTP id 11so503557wyi.36
	for <linux-mtd@lists.infradead.org>;
	Fri, 15 Oct 2010 01:35:39 -0700 (PDT)
Sender: Peter Korsgaard <jacmet@gmail.com>
From: Peter Korsgaard <jacmet@sunsite.dk>
To: dedekind1@gmail.com
Subject: Re: Latest mkfs.jffs2 is broken.
References: <0D753D10438DA54287A00B02708426976450C42B27@AUSP01VMBX24.collaborationhost.net>
	<1287123245.18576.2.camel@localhost>
Date: Fri, 15 Oct 2010 10:35:34 +0200
In-Reply-To: <1287123245.18576.2.camel@localhost> (Artem Bityutskiy's message
	of "Fri, 15 Oct 2010 09:14:05 +0300")
Message-ID: <87pqvbetux.fsf@macbook.be.48ers.dk>
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

Hi,

 Artem> On Thu, 2010-10-14 at 16:54 -0500, H Hartley Sweeten wrote:

 Artem> Could you please bisect the mtd-utils.git tree and find the offending
 Artem> commit.

With big endian atleast, jffs2dump complains about invalid hdr_crc on
1.4.0, but it's working on HEAD. A bisect shows that the commit fixing
it was Mike's:

commit b864c387e8f16273aad1453d6457d847e29c3d25
Author: Mike Frysinger <vapier@gentoo.org>
Date:   Wed Sep 22 22:32:56 2010 -0400

    mtd-utils: clean up zlib.h usage a bit
    
    Hide zlib's crc32 in compr_zlib.c and mkfs.ubifs/compr.c.
    
    jffs2reader.c and mkfs.jffs2.c don't actually use zlib, so punt the
    include from the file.
    
    mkfs.jffs2.c is implicitly using crc32 from zlib.h instead of the
    local mtd_crc32, so fix the local usage.  otherwise we get warnings
    about undefined crc32 because the file was redirecting the prototype.
    
    Signed-off-by: Mike Frysinger <vapier@gentoo.org>
    Signed-off-by: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>

Hartley, that commit applies OK to 1.4.0, could you give it a try?

Artem: Time for a v1.4.1 release?

-- 
Bye, Peter Korsgaard
