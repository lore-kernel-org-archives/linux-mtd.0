Subject: Re: [JFFS2] a way to reduce memory usage
From: David Woodhouse <dwmw2@infradead.org>
To: Dmitry Bazhenov <dbazhenov@rambler.ru>
In-Reply-To: <200606151216.23086.dbazhenov@rambler.ru>
References: <200606151216.23086.dbazhenov@rambler.ru>
Content-Type: text/plain
Date: Sun, 18 Jun 2006 00:32:19 +0100
Message-Id: <1150587140.2584.32.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2006-06-15 at 12:16 +0400, Dmitry Bazhenov wrote:
> As I understand, for the moment every reference to raw node is kept in-core,
> even for obsoleted one. I think it is a bit excessive.

If you build without TEST_TOTLEN defined, we've already halved the size
of the struct jffs2_raw_node_ref in the last few weeks. As well as
finally removing the 'totlen' memory, we've also removed the 'next_phys'
pointer and we're using arrays of them instead. That does mean that we
can no longer drop obsolete nodes from the list though. However, we were
only actually doing that on NOR flash anyway, because on NAND we do need
access to obsolete dirent nodes.

-- 
dwmw2
