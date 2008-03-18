Received: from ex.2n.cz ([213.29.92.11])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JbeTQ-0004qJ-Pk
	for linux-mtd@lists.infradead.org; Tue, 18 Mar 2008 16:15:37 +0000
Date: Tue, 18 Mar 2008 15:08:55 +0100
To: Leon Woestenberg <leon.woestenberg@gmail.com>
Subject: Re: [RFC] root=/dev/mtdblock@name
Message-ID: <20080318140854.GA17982@michl.2n.cz>
References: <c384c5ea0710190455h195aa8eeub0bc775da3377183@mail.gmail.com>
	<20071019143303.GD26913@lazybastard.org>
	<c384c5ea0710191452x52ffdc74x2ce16d0faf62a11b@mail.gmail.com>
	<c384c5ea0803180646w7334f15ch28d5e09cf0a33e15@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <c384c5ea0803180646w7334f15ch28d5e09cf0a33e15@mail.gmail.com>
From: Ladislav Michl <ladis@linux-mips.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 18, 2008 at 02:46:27PM +0100, Leon Woestenberg wrote:
> On  actual tries with 2.6.24 I have failed to get this to work:
> 
> CONFIG_CMDLINE=" root=/dev/mtd:rootfs rootfstype=jffs2"
> 
> drivers/mtd/mtdsuper.c:get_sb_mtd() suggests this should be possible.

root=mtd:rootfs rootfstype=jffs2
