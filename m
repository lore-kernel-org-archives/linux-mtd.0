From: joern@wohnheim.fh-wedel.de (=?iso-8859-1?Q?J=F6rn?= Engel)
Date: Sun, 2 Mar 2003 11:57:30 +0100
Subject: [PATCH] makefile bug and some cleanup
In-Reply-To: <20030302092359.GN15015@pengutronix.de>
References: <20030302092359.GN15015@pengutronix.de>
Message-ID: <20030302105730.GA18324@wohnheim.fh-wedel.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Sun, 2 March 2003 10:23:59 +0100, Robert Schwebel wrote:
> 
> Here are two patches against current CVS; the first one fixes the
> utils/Makefile, the second one removes some warnings for erase.c. 

First looks trivial. The second feels wrong.

> -				erase.length, erase.start);
> +				(unsigned long)erase.length, (unsigned long)erase.start);

People (including me) are easily lured into fixing the warnings, which
are only symptoms, instead of the real causes. And this looks exactly
like a symptom fix.

Could be right, though, I didn't dig into the code yet. Maybe tonight.

J?rn

-- 
Geld macht nicht gl?cklich.
Gl?ck macht nicht satt.
