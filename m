Received: from wohnheim.fh-wedel.de ([195.37.86.122])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 192cgI-00076L-DU
	for <linux-mtd@lists.infradead.org>; Mon, 07 Apr 2003 20:53:26 +0100
Date: Mon, 7 Apr 2003 21:53:08 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: John Burch <jburch@vincisystems.com>
Message-ID: <20030407195308.GA28178@wohnheim.fh-wedel.de>
References: <001f01c2fd36$9c006c90$1200a8c0@JOHNB>
Mime-Version: 1.0
Content-Disposition: inline
In-Reply-To: <001f01c2fd36$9c006c90$1200a8c0@JOHNB>
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
cc: 'Mtd' <linux-mtd@lists.infradead.org>
Subject: Re: Problems making jffs2 utils
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 7 April 2003 14:50:49 -0400, John Burch wrote:
> 
> I'm running into compiler errors when trying to build the jffs2
> utilities for a 2.4.17/mips target.  I've checked out the latest mtd
> code according to www.linux-mtd.infradead.org, then have followed the
> instructions in the mtd/util/README file (copied mtd/util contents to
> directory under linux root and changed $CROSS as necessary since I'm
> cross-compiling to mips).  I cd to <mips-kernel-path>/linux/utils and do
> a make, but get errors immediately, which typically include the
> following (depending on which util I'm trying to make)...
> 
> .../libc.so.6: undefined reference to 'no symbol'
> .../mips-linux-ld: cannot find -lz

You need the common zlib patch, it should be on www.kernel.org
somewhere under people/dwmw2.

Jörn

-- 
Data expands to fill the space available for storage.
-- Parkinson's Law
