From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1106474584.22008.6.camel@sauron.oktetlabs.ru>
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
Content-Type: text/plain
Date: Sun, 23 Jan 2005 11:04:02 +0000
Message-Id: <1106478242.6480.7.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: JFFS3 & performance
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2005-01-23 at 13:03 +0300, Artem B. Bityuckiy wrote:
> Hmm. What do you mean? Do you mean YAFFS-like architecture? Than we
> would better do YAFFS2 then JFFS3 :-))

Something like that. If you're going to ditch the compression then you
might as well try to make some use of the structure. Having real on-
medium metadata lets you use a lot less RAM than a truly log-structured
file system.

I don't think that's necessarily the right approach though -- even with
the larger NAND sizes, we're short of space and compression is a really
useful tool for a general-purpose file system. 

YAFFS2 is already being worked on, for those applications for which is
makes more sense.

-- 
dwmw2
