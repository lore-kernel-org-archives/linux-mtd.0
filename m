Date: Wed, 12 Jan 2005 18:58:18 +0000 (GMT)
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <Pine.LNX.4.58.0501121844300.12973@phoenix.infradead.org>
Message-ID: <Pine.LNX.4.58.0501121857150.12973@phoenix.infradead.org>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<20050112181006.GI25638@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501121833250.10617@phoenix.infradead.org>
	<20050112184304.GM25638@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501121844300.12973@phoenix.infradead.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: Artem Bityuckiy <dedekind@infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Anyway, guys, this is *crucial* question. Would be nice to come up with 
consensus :-) I hope we do not discuss for discussion :-) Hope we want to 
come up with the truth :-) ?

Could we summarize?

Does Everybody agree that CRC is needed at least to detect problems *on 
time* and report about them ?

If all agree, the question about "do we need CRC for purpose other then 
detect unclean reboots?" may be closed. Is it?

The open question: do we need trying recover data in case of errors?
For NOR this question is close - errors are critical there.
For NAND - is it still open? Does somebody thinks we should recover?

Saying recover I mean trying to move not corrupted data from the block 
which have become bad to another, good block.

Comment anybody please.
Thanks.

--
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
