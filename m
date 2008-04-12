Subject: Re: [BUG] JFFS2 usage of write_begin and write_end functions
	causes kernel panic
From: David Woodhouse <dwmw2@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <Pine.LNX.4.64.0804101152270.13226@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0804101152270.13226@pentafluge.infradead.org>
Content-Type: text/plain
Date: Sat, 12 Apr 2008 15:48:39 +0100
Message-Id: <1208011719.2698.19.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: nickpiggin@yahoo.com.au, joern@logfs.org, linux-mtd@lists.infradead.org,
	akpm@linux-foundation.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-04-10 at 17:53 +0100, Alexey Korolev wrote:
> The problem is related to introduction  of write_begin and write_end
> functions instead of original prepare_write & commit_write. The kernel
> panic has disappeared when we rolled back write_begin and write_end
> changes in JFFS2. We tried to fix it - but it seems problem is bit
> tough for us.

Hm, that's very strange. Are you 100% sure it's related to the
write_begin/write_end changes? How long did you run the test for without
a failure, after reverting those changes? And what was the maximum
length of time you could run it without failure beforehand?

Can you show some of the different panic messages you saw? Was there any
kind of pattern to them at all? I suspect memory corruption of some kind
-- can you enable slab debugging?

The output you show includes strings such as 'readlink - no filename'.
Can you explain those? They don't seem to come from your test program.

-- 
dwmw2
