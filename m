From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1148040871.3199.17.camel@sauron.oktetlabs.ru>
References: <1147999465.13399.33.camel@shinybook.infradead.org>
	<1148000482.13399.42.camel@shinybook.infradead.org>
	<1148039632.3875.131.camel@pmac.infradead.org>
	<1148039931.3199.12.camel@sauron.oktetlabs.ru>
	<1148040679.3875.133.camel@pmac.infradead.org>
	<1148040871.3199.17.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Fri, 19 May 2006 13:31:06 +0100
Message-Id: <1148041866.3875.145.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Duplication of dirent names in JFFS2 summary
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2006-05-19 at 16:14 +0400, Artem B. Bityutskiy wrote:
> On Fri, 2006-05-19 at 13:11 +0100, David Woodhouse wrote:
> > If we can halve the amount of space taken on the flash by the summary
> > nodes, I think that's a worthwhile aim.
> > 
> If halve, OK, but why do you think this encoding will halve it? 

I think overall we can about halve the size of the summary nodes. A
variable-length encoding would be part of that.

struct jffs2_sum_inode_flash
{
	jint16_t nodetype;	/* node type */
	jint32_t inode;		/* inode number */
	jint32_t version;	/* inode version */
	jint32_t offset;	/* offset on jeb */
	jint32_t totlen; 	/* record length */
} __attribute__((packed));

The nodetype can be a single byte. 

Inode number is going to start low, and will take only two bytes if it's
less than 16364 -- three bytes up to 2097152. Storing it as an index
into a table of 'inodes affected by this summary' might also be
worthwhile, since we'll often have many nodes which belong to the same
inode.

Version is also going to start low -- and we can also avoid storing it
for the second and subsequent nodes belonging to any given inode. We
_know_ it only counts up by one at a time.

Offset can be entirely redundant if we represent dirty space with a
separate summary entry -- there shouldn't be much dirty space in the
eraseblock when we've only just finished writing it anyway.

Totlen is going to be small. 

So yes, for the 'struct jffs2_sum_inode_flash' I think we can halve it.

Much of the same goes for the 'struct jffs2_sum_dirent_flash', and we
can also drop the name from that too. So yes, I suspect we can get close
to half the size of that too.

-- 
dwmw2
