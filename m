From: David Woodhouse <dwmw2@infradead.org>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <404C433C.7060604@inf.u-szeged.hu>
References: <404C433C.7060604@inf.u-szeged.hu>
Content-Type: text/plain
Message-Id: <1078744502.13916.75.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Mon, 08 Mar 2004 11:15:03 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: A JFFS2 extension - compression performance improvement
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2004-03-08 at 10:56 +0100, Ferenc Havasi wrote:
> Dear All,
> 
> With some of my colleagues at the University of Szeged (Hungary) we have 
> been working on improving the compression performance of JFFS2 - keeping 
> on mind the compatibility and the flexibility.

This looks very interesting, thanks.

Out of interest, what would be the disadvantages if I were to throw out
the existing compression and merge BBS in its place?

It looks like the format you use for zlib is precisely compatible; we'd
also need an implementation of rtime.

For the benefit of those who want to keep code size down, we might want
to make the model-based compressors a configuration option.

I'm quite dubious about adding to /proc too -- perhaps this could be
made optional too?

I object very strongly to the use of jffs2_bbc_model_set_act_sb(); how
about I just change the interface to jffs2_{de,}compress() to take extra
c and f arguments instead?

Am I right in thinking that you just let JFFS2 store JFFS2_COMPR_ZLIB in
the 'compr' field of each page compressed with BBC? I think we need to
give you official compression numbers to use.

For the model-based compressors, we may need to allocate more than one
number -- you'll need as many numbers as you may have active model files
in a single fs (which shouldn't be more than two or three, I'd assume?)

I'm a little unhappy with looking up model files by filename. I'd be
slightly happier if they were identified by inode number instead, and
hidden from the user so they can't be removed or modified. If we can
only ever add model files in mkfs.jffs2, perhaps we can just use special
inode numbers for them?

-- 
dwmw2
