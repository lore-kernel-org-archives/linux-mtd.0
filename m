From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060422171133.GF6629@wohnheim.fh-wedel.de>
References: <20060422165138.GE6629@wohnheim.fh-wedel.de>
	<20060422171133.GF6629@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Date: Sun, 23 Apr 2006 13:20:35 +0100
Message-Id: <1145794835.11909.346.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Josh Boyer <jwboyer@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [HOWTO] Using git for mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2006-04-22 at 19:11 +0200, Jörn Engel wrote:
> Next version with the FIXMEs filled in.  If anyone has comments, spots
> errors, etc., please tell me.

We should also mention merges. If you're putting something into a git
tree for me to pull from, it's best if that pull will _not_ result in a
merge. That means you should base it on the current mtd-2.6 tree, not on
a tree which you've merged with Linus' tree for yourself.

Obviously, if you have a longer-lived git tree with stuff like xattr
support in it, that's expected to have merges -- I mean the above just
for the short-lived stuff.

-- 
dwmw2
