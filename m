Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WaUsS-0003Ap-7L
 for linux-mtd@lists.infradead.org; Wed, 16 Apr 2014 18:48:10 +0000
Date: Wed, 16 Apr 2014 20:47:42 +0200
From: Gerhard Sittig <gsi@denx.de>
To: David Mosberger <davidm@egauge.net>
Subject: Re: [PATCH v5 0/5] mtd: nand: Add on-die ECC support
Message-ID: <20140416184742.GI3528@book.gsilab.sittig.org>
References: <1397504134-32178-1-git-send-email-davidm@egauge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1397504134-32178-1-git-send-email-davidm@egauge.net>
Cc: computersforpeace@gmail.com, linux-mtd@lists.infradead.org, pekon@ti.com,
 dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-04-14 at 13:35 -0600, David Mosberger wrote:
> 
> This series adds support for Micron on-die ECC.
> The patches are designed to go on top of Gerhard Sittig's patches
> to introduce a READMODE command.
> 
> Changes in v5:
>  - Fixed some formatting issues.
>  - Wherever possible, new functions take only mtd argument (not also chip).
>  - Eliminated bitdiff() function.
>  - Clarified/shortened some comments.

nit: please supply the change log for past revisions as well if
you resubmit, reviewers should not have to do the book keeping or
archeology for you if they want to know whether some aspect has
been addressed that was raised before

some readers prefer or even demand that individual patches have
their change log, because cover letters are optional, and most of
all cover letters won't end up in trackers while patches do


virtually yours
Gerhard Sittig
-- 
DENX Software Engineering GmbH,     MD: Wolfgang Denk & Detlev Zundel
HRB 165235 Munich, Office: Kirchenstr. 5, D-82194 Groebenzell, Germany
Phone: +49-8142-66989-0 Fax: +49-8142-66989-80  Email: office@denx.de
