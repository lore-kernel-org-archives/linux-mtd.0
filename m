Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cseaq-0006Sz-Md
	for linux-mtd@lists.infradead.org; Sun, 23 Jan 2005 05:03:42 -0500
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1106431453.6932.57.camel@localhost.localdomain>
References: <JPEALJAFNGDDLOPNDIEEAEDFDAAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0501191305530.8174@phoenix.infradead.org>
	<20050119152427.GB26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191526140.8174@phoenix.infradead.org>
	<20050119153233.GD26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191957090.8174@phoenix.infradead.org>
	<6934efce050121144619d2899d@mail.gmail.com>
	<1106399029.29388.50.camel@sauron.oktetlabs.ru>
	<1106431453.6932.57.camel@localhost.localdomain>
Content-Type: text/plain
Date: Sun, 23 Jan 2005 13:03:04 +0300
Message-Id: <1106474584.22008.6.camel@sauron.oktetlabs.ru>
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

On Sat, 2005-01-22 at 22:04 +0000, David Woodhouse wrote:
> Compression has other drawbacks though -- if you throw out compression
> you can do fixed-size records, you can have a block-based architecture
> and simplify your metadata, ...

Hmm. What do you mean? Do you mean YAFFS-like architecture? Than we
would better do YAFFS2 then JFFS3 :-))

If to be serious, I really can't imagine this. Do you mean, just to fix
the size of inode node data, say, to 512 bytes? What to do with
direntries?

Is it really feasible? Will we still have JFFS3 generation?
