From: Russ.Dill@asu.edu (Russ Dill)
Date: 10 Mar 2003 18:42:10 -0700
Subject: Suggestions for using a DoC with Linux and a 2.4.20 kern
In-Reply-To: <000101c2e76d$55323340$e3c8580c@who5>
References: <000101c2e76d$55323340$e3c8580c@who5>
Message-ID: <1047346930.2207.16.camel@gobbles>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

> Hello again from Gregg C Levine
> Right now I am doing a recompile of my kernel, after patching it,
> using the patches found in that directory of today's snapshot.

you don't neccessarily need todays snapshot, stock kernel is probably
good enough, unless maybe you want to play with things like JFFS2 on
NAND flash.

> So far, I am working my way through. Only the DoC ones were built as
> modules.

then you must load them in the order of doc2000, doc_probe, nftl

> More, as I work my way through. This is a new aspect of working with
> Linux, so I am quite literally groping in the dark here.
> Ladies and Gentlemen: Because I suspect there are others out there,
> who have gone through this, I would greatly appreciate a response from
> everyone else who has had these problems happen to them before.

could you be more specific when you talk about "this" and "these
problems". BTW, if they are common problem you are having, its likely
they are in the mailing list archives.
