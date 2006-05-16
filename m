From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1147702746.20604.10.camel@sauron.oktetlabs.ru>
References: <1147178706.16853.6.camel@sauron.oktetlabs.ru>
	<1147249742.16853.16.camel@sauron.oktetlabs.ru>
	<20060510133510.GD31935@wohnheim.fh-wedel.de>
	<1147269251.16853.50.camel@sauron.oktetlabs.ru>
	<20060510135814.GG31935@wohnheim.fh-wedel.de>
	<1147635584.2551.20.camel@shinybook.infradead.org>
	<1147702746.20604.10.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Wed, 17 May 2006 00:30:21 +0100
Message-Id: <1147822221.30771.6.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>,
	linux-mtd@lists.infradead.org
Subject: Re: [PATCH/RFC] reserved pool
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-05-15 at 18:19 +0400, Artem B. Bityutskiy wrote:
> On Sun, 2006-05-14 at 20:39 +0100, David Woodhouse wrote:
> > > Then go and bug dwmw2 about merging it. ;) 
> > 
> > We talked about changing the way the reserved size is actually handled
> > in the allocation routine.... did a new version ever show up?
> > 
> Please,
> 
> look/pull the '[JFFS2] add reserved pool feature' patch from
> http://git.infradead.org/?p=users/dedekind/dedekind-mtd-2.6.git;a=summary

I cleaned it up so it looks like this.... and then decided not to apply
it. I don't like this kind of thing being a mount option. Make a new
node type for 'filesystem options'. Make it an RWCOMPAT_COPY node type.
Store the reserved size in it and do it through an ioctl like chattr
does on ext2 -- and make mkfs.jffs2 write it too. 

We'll want compression types stored in that node type too, I suspect.

-- 
dwmw2
