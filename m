From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Mon, 31 Mar 2003 18:55:04 +0200
Subject: mtd devices inaccessible
In-Reply-To: <3E88683E.65177484@thales-e-transactions.com>
References: <3E885040.41874936@thales-e-transactions.com> <1049124294.15393.190.camel@ralph.plexio.private> <3E88683E.65177484@thales-e-transactions.com>
Message-ID: <20030331165504.GA19168@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Mon, 31 March 2003 18:09:34 +0200, Eric DEJONC wrote:
> 
> Well, good advice, the menu seems to have been updated,
> But mtdlink.o is still required at the end of compilation:
> arm-linux-ld:cannot open drivers/mtd/mtdlink.o
> Is this the mtd driver or can I remove it from the makefile?

This is with 2.5.62, right?
What happens, if you "make drivers/mtd/mtdlink.o"?

J?rn

-- 
Premature optimization is the root of all evil.
-- Donald Knuth
