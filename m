Date: Wed, 12 Jan 2005 18:33:33 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20050112181006.GI25638@wohnheim.fh-wedel.de>
Message-ID: <Pine.LNX.4.58.0501121833250.10617@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<20050112181006.GI25638@wohnheim.fh-wedel.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
	MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Joern,

> Your ability to come up with excellent papers is astounding!
Thanks :-)

>   Blocks that fail during use
> Quote: "Therefore, blocks should be marked as bad and no longer
> accessed if there is either a block erase failure or a page program
> failure."
>
> During erase, by definition those blocks don't hold crucial data.  Not
> a problem.  Page program is slightly worse, but it only means that we
> have to program a different block instead.  Make sure you don't use
> the partial programming thing they hinted at and no crucial data is
> lost.  Again, harmless.
>
>
>   Permanent Failure
> Those can be noticed during either erase or program, so the above
> applies.  Harmless.
Hmm. I think about the intermediate stage. I mean that block is good at 
one moment, and it is bad at another moment. But *when* it become bad? Is 
this only during erase? If so, you're probably right. But I'm not sure. Is 
there some stage when block still contain crucial data, but is already 
bad? If it is, CRC will cach this.

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
