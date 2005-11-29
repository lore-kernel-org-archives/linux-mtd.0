Received: from ns.firmix.at ([62.141.48.66])
	by pentafluge.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1Eh31T-0002y9-P9
	for linux-mtd@lists.infradead.org; Tue, 29 Nov 2005 10:47:45 +0000
From: Bernd Petrovitsch <bernd@firmix.at>
To: Michael Richardson <mcr@sandelman.ottawa.on.ca>
In-Reply-To: <20051129100937.AF133353F54@atlas.denx.de>
References: <20051129100937.AF133353F54@atlas.denx.de>
Content-Type: text/plain
Date: Tue, 29 Nov 2005 11:41:00 +0100
Message-Id: <1133260860.32224.23.camel@tara.firmix.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/2] --cvs-exclude for mkfs.jffs2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-11-29 at 11:09 +0100, Wolfgang Denk wrote:
> In message <v0mzjofaup.fsf@marajade.sandelman.ca> you wrote:
[...]
> > This adds an option to ignore CVS directories.
> 
> This doesn't make sense to me. You can and should use "cvs export" to
> create the directory trees you want to package.

Or do a `find \( -name CVS -o -name .svn \) -print0 | xargs -0r rm -rf`
before.
Especially the name `.KEEP_ME` is not even standardized (more .keep
IIRC) - not even in the CVS world AFAIK.

> You use  CVS,  others  use  GIT,  or  Subversion,  or  ClearCase,  or
> Monotone,  or darcs, or ... - it would not be really practical to add
> special rules for everybody's favorite tool.

Ar at least name and implement the option as '--exclude' similar to
`tar` and `diff`.

	Bernd
-- 
Firmix Software GmbH                   http://www.firmix.at/
mobil: +43 664 4416156                 fax: +43 1 7890849-55
          Embedded Linux Development and Services
