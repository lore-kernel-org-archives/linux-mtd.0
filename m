Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1CooWB-0000SE-Um
	for linux-mtd@lists.infradead.org; Wed, 12 Jan 2005 14:51:01 -0500
Date: Wed, 12 Jan 2005 20:50:45 +0100
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
Message-ID: <20050112195045.GB7038@wohnheim.fh-wedel.de>
References: <Pine.LNX.4.58.0501111221260.19297@phoenix.infradead.org>
	<20050111215102.GA6289@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501120913180.10617@phoenix.infradead.org>
	<20050112181006.GI25638@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501121833250.10617@phoenix.infradead.org>
	<20050112184304.GM25638@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501121844300.12973@phoenix.infradead.org>
	<Pine.LNX.4.58.0501121857150.12973@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Pine.LNX.4.58.0501121857150.12973@phoenix.infradead.org>
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

On Wed, 12 January 2005 18:58:18 +0000, Artem B. Bityuckiy wrote:
> 
> Could we summarize?
> 
> Does Everybody agree that CRC is needed at least to detect problems *on 
> time* and report about them ?

s/CRC/checksum/

Agreed, with that change.

> If all agree, the question about "do we need CRC for purpose other then 
> detect unclean reboots?" may be closed. Is it?
> 
> The open question: do we need trying recover data in case of errors?
> For NOR this question is close - errors are critical there.
> For NAND - is it still open? Does somebody thinks we should recover?
> 
> Saying recover I mean trying to move not corrupted data from the block 
> which have become bad to another, good block.

If it's simple enough, sure.

Imo, it is more important to *report* and *remember* this problem,
though.  If such a problem ever occurs and it's not just a short
write, but real data corruption on the medium, the device is broken.
Trying to recove is fine, but staying silent definitely isn't.

Plus, we should note this information somewhere, preferrably in every
single erase block.  On every new mount, it should be clear to anyone
possibly watching that the medium needs urgent replacement.

Jörn

-- 
It does not matter how slowly you go, so long as you do not stop.
-- Confucius
