Received: from [62.154.254.10] (helo=chaingun.noernet.de ident=exim)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15oucW-0004g1-00
	for <linux-mtd@lists.infradead.org>; Wed, 03 Oct 2001 23:36:05 +0100
Date: Thu, 4 Oct 2001 00:44:44 +0200 (CEST)
From: dennis noermann <dennis.noermann@noernet.de>
To: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
cc: <linux-mtd@lists.infradead.org>,
    Larry Doolittle <ldoolitt@recycle.lbl.gov>
Subject: Re: JFFS2_RESERVED_BLOCKS_*
In-Reply-To: <20011003182904.C21578@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.33.0110040038450.11929-100000@chaingun.noernet.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=X-UNKNOWN
Content-Transfer-Encoding: QUOTED-PRINTABLE
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


On Wed, 3 Oct 2001, [iso-8859-1] J=F6rn Engel wrote:

> Hi!
>
>
> Formal proof is a tough one. But the difference between theoretical
> and practical minimum should be a couple of bugs, that might be found
> with a bigger userbase.
> What wheel do I have to turn, to lower the limit myself?
>
> J=F6rn

nodelist.h

#define JFFS2_RESERVED_BLOCKS_BASE 3
#define JFFS2_RESERVED_BLOCKS_WRITE (JFFS2_RESERVED_BLOCKS_BASE + 2)
#define JFFS2_RESERVED_BLOCKS_DELETION (JFFS2_RESERVED_BLOCKS_BASE + 1)
#define JFFS2_RESERVED_BLOCKS_GCTRIGGER (JFFS2_RESERVED_BLOCKS_BASE + 3)
#define JFFS2_RESERVED_BLOCKS_GCBAD (JFFS2_RESERVED_BLOCKS_BASE + 1)
#define JFFS2_RESERVED_BLOCKS_GCMERGE (JFFS2_RESERVED_BLOCKS_BASE)


you see all depends on JFFS2_RESERVED_BLOCKS_BASE
try to  decrease this
i am running it with
JFFS2_RESERVED_BLOCKS_BASE 0
JFFS2_RESERVED_BLOCKS_GCTRIGGER (JFFS2_RESERVED_BLOCKS_BASE + 2)

and it works fine

dennis
