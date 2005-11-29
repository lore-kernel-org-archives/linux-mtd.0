Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1Eh6A4-00078I-HF
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 09:08:56 -0500
Date: Tue, 29 Nov 2005 15:08:30 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Wolfgang Denk <wd@denx.de>
Message-ID: <20051129140830.GB31948@wohnheim.fh-wedel.de>
References: <v0mzjofaup.fsf@marajade.sandelman.ca>
	<20051129100937.AF133353F54@atlas.denx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20051129100937.AF133353F54@atlas.denx.de>
Cc: Michael Richardson <mcr@sandelman.ottawa.on.ca>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] --cvs-exclude for mkfs.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 29 November 2005 11:09:37 +0100, Wolfgang Denk wrote:
> In message <v0mzjofaup.fsf@marajade.sandelman.ca> you wrote:
> > 
> > This adds an option to ignore CVS directories.
> 
> This doesn't make sense to me. You can and should use "cvs export" to
> create the directory trees you want to package.
> 
> You use  CVS,  others  use  GIT,  or  Subversion,  or  ClearCase,  or
> Monotone,  or darcs, or ... - it would not be really practical to add
> special rules for everybody's favorite tool.

More importantly.  People may actually want to _keep_ the magical
subdirectories.

Write one tool to do one thing and do it well.  Applies here as well.

Jörn

-- 
I've never met a human being who would want to read 17,000 pages of
documentation, and if there was, I'd kill him to get him out of the
gene pool.
-- Joseph Costello
