Subject: Re: Why the alignemt to 4 bytes is necessary in jffs2_commit_write
	function
From: David Woodhouse <dwmw2@infradead.org>
To: akorolev <alexey.korolev@intel.com>
In-Reply-To: <46950472.7000103@intel.com>
References: <46950472.7000103@intel.com>
Content-Type: text/plain
Date: Wed, 11 Jul 2007 17:35:58 +0100
Message-Id: <1184171758.31598.12.camel@pmac.infradead.org>
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

On Wed, 2007-07-11 at 20:25 +0400, akorolev wrote:
> If I properly understand the aligned_start is not related to offset of
> the fragment it is just offset within the file.  (Frag offset is
> aligned) File offset is not necessary to keep aligned - so why not to
> kick off it. (I tried and didn't find anything wrong in tests).

Consider:
	while (1)
		write(fd, "x", 1);

This is fairly much worst-case behaviour for JFFS2, and you end up with
a _large_ number of data nodes. One thing we've done to improve
behaviour in this situation is rewrite the entire page when we write the
last byte in a page -- but that doesn't fix _all_ cases.

Since data nodes _are_ aligned to 4 bytes, it doesn't hurt us at all to
write a full 4 bytes instead of only 1 byte. So you'll have a maximum of
1024 data nodes for a given 4KiB page even if you don't manage to
trigger the code which rewrites the page.

-- 
dwmw2
