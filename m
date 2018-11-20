Received: from mail.bootlin.com ([62.4.15.54])
 by merlin.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gP0zK-00055f-Kx
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2018 08:02:27 +0000
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: thor.thayer@linux.intel.com, marek.vasut@gmail.com, dwmw2@infradead.org,
 computersforpeace@gmail.com, boris.brezillon@bootlin.com, richard@nod.at
Cc: linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2] mtd: spi-nor: Fix Cadence QSPI page fault kernel panic
Date: Tue, 20 Nov 2018 09:02:03 +0100
Message-Id: <20181120080203.4183-1-boris.brezillon@bootlin.com>
In-Reply-To: <1542378349-29929-1-git-send-email-thor.thayer@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2018-11-16 at 14:25:49 UTC, thor.thayer@linux.intel.com wrote:
> From: Thor Thayer <thor.thayer@linux.intel.com>
> 
> The current Cadence QSPI driver caused a kernel panic sporadically
> when writing to QSPI. The problem was caused by writing more bytes
> than needed because the QSPI operated on 4 bytes at a time.
> <snip>
> [   11.202044] Unable to handle kernel paging request at virtual address bffd3000
> [   11.209254] pgd = e463054d
> [   11.211948] [bffd3000] *pgd=2fffb811, *pte=00000000, *ppte=00000000
> [   11.218202] Internal error: Oops: 7 [#1] SMP ARM
> [   11.222797] Modules linked in:
> [   11.225844] CPU: 1 PID: 1317 Comm: systemd-hwdb Not tainted 4.17.7-d0c45cd44a8f
> [   11.235796] Hardware name: Altera SOCFPGA Arria10
> [   11.240487] PC is at __raw_writesl+0x70/0xd4
> [   11.244741] LR is at cqspi_write+0x1a0/0x2cc
> </snip>
> On a page boundary limit the number of bytes copied from the tx buffer
> to remain within the page.
> 
> This patch uses a temporary buffer to hold the 4 bytes to write and then
> copies only the bytes required from the tx buffer.
> 
> Reported-by: Adrian Amborzewicz <adrian.ambrozewicz@intel.com>
> Signed-off-by: Thor Thayer <thor.thayer@linux.intel.com>

Applied to http://git.infradead.org/linux-mtd.git master, thanks.

Boris
