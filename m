Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1CsgLX-0007wL-Ci
	for linux-mtd@lists.infradead.org; Sun, 23 Jan 2005 06:56:01 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1106478242.6480.7.camel@localhost.localdomain>
References: <JPEALJAFNGDDLOPNDIEEAEDFDAAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0501191305530.8174@phoenix.infradead.org>
	<20050119152427.GB26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191526140.8174@phoenix.infradead.org>
	<20050119153233.GD26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191957090.8174@phoenix.infradead.org>
	<6934efce050121144619d2899d@mail.gmail.com>
	<1106399029.29388.50.camel@sauron.oktetlabs.ru>
	<1106431453.6932.57.camel@localhost.localdomain>
	<1106474584.22008.6.camel@sauron.oktetlabs.ru>
	<1106478242.6480.7.camel@localhost.localdomain>
Content-Type: text/plain
Date: Sun, 23 Jan 2005 14:55:21 +0300
Message-Id: <1106481321.22008.17.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2005-01-23 at 11:04 +0000, David Woodhouse wrote:
> Something like that. If you're going to ditch the compression then you
> might as well try to make some use of the structure. Having real on-
> medium metadata lets you use a lot less RAM than a truly log-structured
> file system.
My opinion is that we do JFFS3 and should keep its "pure" log-structured
nature inact. YAFFS is another and has its advantages and drawbacks.

> I don't think that's necessarily the right approach though -- even with
> the larger NAND sizes, we're short of space and compression is a really
> useful tool for a general-purpose file system. 
I agree. I think, as it was already said by different people and by you,
we should provide the possibility to switch compression on and off for
different files.

And possibly, we may:
1. Provide the possibility to put several independent compressed 4K
chunks to one nodes with compression on.
2. Have the possibility to put more then 4K data to inodes with
compression off.
