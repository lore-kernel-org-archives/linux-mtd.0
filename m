From: David Woodhouse <dwmw2@infradead.org>
To: "Koenders, Eric - NL" <Eric.Koenders@peekglobal.com>
In-Reply-To: <ECE7E5A7BCD66544A8F2B98EA0A8EFB313E239@nlsv0101.nl.peeknet.prv>
References: <ECE7E5A7BCD66544A8F2B98EA0A8EFB313E239@nlsv0101.nl.peeknet.prv>
Content-Type: text/plain
Date: Tue, 21 Dec 2004 11:37:37 +0000
Message-Id: <1103629058.6111.53.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: System blocked for a while by heavily fragmented file on a
	jffs2 partition
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2004-12-09 at 17:17 +0100, Koenders, Eric - NL wrote:
> Does anyone have an idea how to solve this problem? Maybe more agressive
> defragmentation behaviour of the GC? Or an fsck like tool to defragment a
> file system?

It would help to concentrate harder on garbage-collecting the files with
tiny nodes. Currently we do keep track of whether a node is an optimal
representation ('REF_PRISTINE') or not, but we only use that when we're
_actually_ garbage collecting; we don't use it to decide which blocks to
GC. 

Also, the oft-suggested optimisation of writing new nodes out to a
_separate_ block from GC-rewritten nodes would probably help to improve
the GC performance here.

-- 
dwmw2
