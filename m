Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1ConSS-0006iP-FZ
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 13:43:12 -0500
Date: Wed, 12 Jan 2005 19:43:04 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050112184304.GM25638@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<20050112181006.GI25638@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501121833250.10617@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0501121833250.10617@phoenix.infradead.org>
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

On Wed, 12 January 2005 18:33:33 +0000, Artem B. Bityuckiy wrote:
>
> Hmm. I think about the intermediate stage. I mean that block is good at 
> one moment, and it is bad at another moment. But *when* it become bad? Is 
> this only during erase? If so, you're probably right. But I'm not sure. Is 
> there some stage when block still contain crucial data, but is already 
> bad? If it is, CRC will cach this.

According to the paper, all but soft errors only occur during erase
and write.  So we're safe ...

... or Toshiba lied to us.

Jörn

-- 
The only real mistake is the one from which we learn nothing.
-- John Powell
