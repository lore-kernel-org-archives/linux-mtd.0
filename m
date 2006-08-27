Received: from wohnheim.fh-wedel.de ([213.39.233.138])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GHOJe-0000sv-OU
	for linux-mtd@lists.infradead.org; Sun, 27 Aug 2006 18:20:59 +0100
Date: Sun, 27 Aug 2006 19:17:28 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Ian Lindsay <iml@formicary.org>
Subject: Re: LogFS
Message-ID: <20060827171728.GB3502@wohnheim.fh-wedel.de>
References: <20060824134430.GB17132@wohnheim.fh-wedel.de>
	<20060827053245.GA15747@gen.formicary.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20060827053245.GA15747@gen.formicary.org>
Cc: fsdevel@wohnheim.fh-wedel.de, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 27 August 2006 01:32:45 -0400, Ian Lindsay wrote:
> 
>  +/* FIXME: This should really be somewhere in the 64bit area. */
>  +#define LOGFS_LINK_MAX (2^30)
> 
> Interesting choice of constant.

Yes.  I didn't spend a long time thinking about whether it should be
2^31 or 2^31-1 or 2^31-2.  It will be a while before it becomes an
issue in real life anyway. :)

Jörn

-- 
It's not whether you win or lose, it's how you place the blame.
-- unknown
