From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1106399029.29388.50.camel@sauron.oktetlabs.ru>
References: <JPEALJAFNGDDLOPNDIEEAEDFDAAA.joakim.tjernlund@lumentis.se>
	<Pine.LNX.4.58.0501191305530.8174@phoenix.infradead.org>
	<20050119152427.GB26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191526140.8174@phoenix.infradead.org>
	<20050119153233.GD26711@wohnheim.fh-wedel.de>
	<Pine.LNX.4.58.0501191957090.8174@phoenix.infradead.org>
	<6934efce050121144619d2899d@mail.gmail.com>
	<1106399029.29388.50.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Sat, 22 Jan 2005 22:04:13 +0000
Message-Id: <1106431453.6932.57.camel@localhost.localdomain>
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

On Sat, 2005-01-22 at 16:03 +0300, Artem B. Bityuckiy wrote:
> 2. Worse, compression impacts JFFS2 design globally. You know, that the
> maximum amount of data JFFS2 may store in one inode node is the size of
> RAM page, most often 4K. 
> 
> Q: Why we restrict ourself with this size? 
> A: Because of compression.

It's not just compression that restricts us to 4KiB. Compressing in
larger chunks isn't hard -- zisofs does it, for example. The real
problem is the larger buffers you need for garbage collection. It's not
impossible to fix that though.

We've always intended to have a per-inode attribute for user-specified
compression parameters; the most basic of which would be 'no
compression'. I originally intended to expose those as attributes in the
way that 'chattr' works, with an ioctl on the file -- but I suspect
xattrs would be a better approach nowadays.

Compression has other drawbacks though -- if you throw out compression
you can do fixed-size records, you can have a block-based architecture
and simplify your metadata, ...

-- 
dwmw2
