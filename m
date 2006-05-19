From: David Woodhouse <dwmw2@infradead.org>
To: dedekind@infradead.org
In-Reply-To: <1148040313.3199.15.camel@sauron.oktetlabs.ru>
References: <1147999465.13399.33.camel@shinybook.infradead.org>
	<1148039861.3199.10.camel@sauron.oktetlabs.ru>
	<1148040313.3199.15.camel@sauron.oktetlabs.ru>
Content-Type: text/plain
Date: Fri, 19 May 2006 13:23:54 +0100
Message-Id: <1148041434.3875.137.camel@pmac.infradead.org>
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

On Fri, 2006-05-19 at 16:05 +0400, Artem B. Bityutskiy wrote:
> I mean, we don't have to know the right inode refcount values at the
> scanning time, may we calculate it at the readinode() time?

Stop. Look at where we use the _name_. Hint: It's only in
jffs2_add_fd_to_list(). Observe that we almost never need it, and we can
actually fetch it from the flash only when we have to.

Ponder whether that's going to be an improvement overall. It means the
summary shrinks, so takes less space and is faster to read because it
doesn't contain any names. The down side is that _sometimes_ when
there's a crc32 collision, you have to actually read the name for some
nodes from the flash after reading the summary.
 
-- 
dwmw2
