Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16bKvY-00044s-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Feb 2002 12:23:52 +0000
Received: from wohnheim.fh-wedel.de (wohnheim.fh-wedel.de [195.37.86.122])
	by mail.fh-wedel.de (8.9.3/8.9.3) with ESMTP id NAA03678
	for <linux-mtd@lists.infradead.org>; Thu, 14 Feb 2002 13:34:37 +0100
Date: Thu, 14 Feb 2002 13:35:07 +0100
From: =?iso-8859-1?Q?J=F6rn_Engel?= <joern@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
Subject: Re: Compiler errors in current CVS
Message-ID: <20020214133507.B26200@wohnheim.fh-wedel.de>
References: <20020213111834.A28187@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20020213111834.A28187@wohnheim.fh-wedel.de>; from joern@wohnheim.fh-wedel.de on Wed, Feb 13, 2002 at 11:18:34AM +0100
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

Hi!

> Trying to get back up to date with mtd, I found some problem in gc.c,
> line 652 (cvs from 0211):
> end = min_t(uint32_t, start + PAGE_CACHE_SIZE, JFFS2_F_I_SIZE(f));
>             ^^^^^^^^
> The compiler gave a parse error and I cannot make any more sense out
> of it.

Bug found and solved. Bug was caused by insufficient sleep, patch
applied last night. Sorry, guys!

Joern
