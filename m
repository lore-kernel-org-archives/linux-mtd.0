From: David Woodhouse <dwmw2@infradead.org>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
In-Reply-To: <1147999465.13399.33.camel@shinybook.infradead.org>
References: <1147999465.13399.33.camel@shinybook.infradead.org>
Content-Type: text/plain
Date: Fri, 19 May 2006 02:01:21 +0100
Message-Id: <1148000482.13399.42.camel@shinybook.infradead.org>
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

While I'm looking at how to reduce the size of the summary... would we
also gain by dropping the 'totlen' field and assuming that each node's
length can be found by subtracting its offset from the offset on the
next node on the flash? (Much as I plan to do to reduce memory usage by
shrinking the struct jffs2_raw_node_ref.)

That'd mean we have to have a summary representation of 'dirty' space,
but there should be relatively few of those in the eraseblocks we've
only just finished writing out, so it should be a gain overall.

We don't actually need 'type' in the jffs2_sum_dirent_flash either, do
we? Depending on the number of crc32 collisions we get and how expensive
it is to read the names from the flash, we might not even need the nsize
field.

And would we benefit by using a variable-length encoding of the integers
in the summary entries? We're far from being CPU-bound when we eat
these, surely?

... which in turn means we should keep storing totlen and drop _offset_,
since we can infer one from the other and the length can always be
stored in fewer bits...

-- 
dwmw2
