From: dwmw2@infradead.org (David Woodhouse)
Date: 05 Feb 2003 14:31:44 +0000
Subject: Patch - remove unused CDL
In-Reply-To: <1044455122.20755.3445.camel@hermes.chez-thomas.org>
References: <1044453494.20752.3412.camel@hermes.chez-thomas.org>
 <1044454293.2222.28.camel@passion.cambridge.redhat.com>
 <1044454502.30670.3432.camel@hermes.chez-thomas.org>
 <1044454929.2222.33.camel@passion.cambridge.redhat.com>
 <1044455122.20755.3445.camel@hermes.chez-thomas.org>
Message-ID: <1044455504.2222.37.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

> Fair enough.  One last question: do you think the "origin" will
> be necessary/useful for the "parse_cmdline_partitions()" function?
> I don't see why it ever would (plus that routine already has it's
> own unique signature).

Ug. I hadn't realised we'd already started having different prototypes
for the partition parsing code. If that's the case then there's little
advantage in you updating all the parsers to keep them in sync. 

I'm sorry for mucking you about -- just go ahead and change the RedBoot
one (and its callers) and I'll worry about cleaning it up later.

-- 
dwmw2
