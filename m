From: dwmw2@infradead.org (David Woodhouse)
Date: 05 Feb 2003 14:11:33 +0000
Subject: Patch - remove unused CDL
In-Reply-To: <1044453494.20752.3412.camel@hermes.chez-thomas.org>
References: <1044453494.20752.3412.camel@hermes.chez-thomas.org>
Message-ID: <1044454293.2222.28.camel@passion.cambridge.redhat.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

> Jonathan has pointed out at some of the CDL used for JFFS2
> is obsolete (not used by the package).  The attached patch
> will take care of it.

Please apply.

> Two questions:
>  * How do patches get reviewed, applied, etc?
> 

People send patches to the mailing list. If they persist in sending sane
patches, I give them a SSH key and ask them to commit them themselves.
That way, I get to keep track of who committed what and I know who to
blame when stuff goes wrong. If people to whom I've given commit access
commit something silly, I shout at them and make them fix it :)

>  * What about my change to the RedBoot partition scanning?

I don't like the partition code looking at mtd->priv. That's _private_
:)

I suspect we'd do better to add an 'origin' argument to _all_ the
partition parsing routines -- the AFS one could probably do with it too.

-- 
dwmw2
