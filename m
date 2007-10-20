Subject: Re: [PATCH]CFI fix of kernel deadlock caused by get_chip recursion
From: David Woodhouse <dwmw2@infradead.org>
To: Alexey Korolev <akorolev@infradead.org>
In-Reply-To: <Pine.LNX.4.64.0710181501270.32655@pentafluge.infradead.org>
References: <Pine.LNX.4.64.0710181501270.32655@pentafluge.infradead.org>
Content-Type: text/plain
Date: Sat, 20 Oct 2007 14:56:54 +0100
Message-Id: <1192888614.26380.50.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Nico@cam.org, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-10-18 at 15:15 +0100, Alexey Korolev wrote:
> Hi,
> 
> This patch solves kernel deadlock issue seen on JFFF2 simultaneous operations. 
> Detailed investigation of the issue showed that the kernel deadlock is caused bytons of recursive get_chip calls.
> 
> MTD:CFI: This fix removes recursion in get_chip function to avoid possible deadlock situation.
> 
> Signed-off-by: Alexey Korolev <akorolev at infradead.org>

patching file drivers/mtd/chips/cfi_cmdset_0001.c
Hunk #1 FAILED at 85.
Hunk #2 FAILED at 642.
Hunk #3 FAILED at 664.
Hunk #4 FAILED at 743.
4 out of 4 hunks FAILED -- saving rejects to file drivers/mtd/chips/cfi_cmdset_0001.c.rej#

-- 
dwmw2
