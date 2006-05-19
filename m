From: David Woodhouse <dwmw2@infradead.org>
To: Ferenc Havasi <havasi@inf.u-szeged.hu>
Content-Type: text/plain
Date: Fri, 19 May 2006 01:44:24 +0100
Message-Id: <1147999465.13399.33.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Duplication of dirent names in JFFS2 summary
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

It's a little unfortunate that we have to actually keep a second copy of
the name in the summary. Is there any way we could avoid it?

One possibility might be to refrain from storing the name in the dirent
node itself -- store it _only_ in the summary. This could happen only
during garbage collection -- when we GC a dirent node, we could write it
out _without_ its name. In fact, we could possibly refrain from writing
the GC'd dirent to the log at all -- put it _only_ in the summary.

That does break backwards compatibility though, which isn't ideal.

Another possibility might be to omit the full name from the summary, but
to store only the hash (or name_crc) instead. We hardly ever actually
need the full name -- it's only used if there's a hash collision, in
jffs2_add_fd_to_list().

Further thoughts...? 

Do we have any current data on how much space is taken by summary nodes
on typical file systems, and how much of that is names?

-- 
dwmw2
