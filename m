Received: from bes.se.axis.com ([195.60.68.10])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZcBOt-0003ch-Am
 for linux-mtd@lists.infradead.org; Wed, 16 Sep 2015 12:01:24 +0000
Message-ID: <55F959F9.7040102@axis.com>
Date: Wed, 16 Sep 2015 14:00:57 +0200
From: Niklas Cassel <niklas.cassel@axis.com>
MIME-Version: 1.0
To: Alex Smith <alex@alex-smith.me.uk>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
CC: Alex Smith <alex.smith@imgtec.com>, Zubair Lutfullah Kakakhel
 <Zubair.Kakakhel@imgtec.com>, David Woodhouse <dwmw2@infradead.org>, Brian
 Norris <computersforpeace@gmail.com>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 1/4] mtd: nand: increase ready wait timeout and report
 timeouts
References: <1442403417-5288-1-git-send-email-alex@alex-smith.me.uk>
 <1442403417-5288-2-git-send-email-alex@alex-smith.me.uk>
In-Reply-To: <1442403417-5288-2-git-send-email-alex@alex-smith.me.uk>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 09/16/2015 01:36 PM, Alex Smith wrote:
> From: Alex Smith <alex.smith@imgtec.com>
> 
> If nand_wait_ready() times out, this is silently ignored, and its
> caller will then proceed to read from/write to the chip before it is
> ready. This can potentially result in corruption with no indication as
> to why.
> 
> While a 20ms timeout seems like it should be plenty enough, certain
> behaviour can cause it to timeout much earlier than expected. The
> situation which prompted this change was that CPU 0, which is
> responsible for updating jiffies, was holding interrupts disabled
> for a fairly long time while writing to the console during a printk,
> causing several jiffies updates to be delayed. If CPU 1 happens to
> enter the timeout loop in nand_wait_ready() just before CPU 0 re-
> enables interrupts and updates jiffies, CPU 1 will immediately time
> out when the delayed jiffies updates are made. The result of this is
> that nand_wait_ready() actually waits less time than the NAND chip
> would normally take to be ready, and then read_page() proceeds to
> read out bad data from the chip.
> 
> The situation described above may seem unlikely, but in fact it can be
> reproduced almost every boot on the MIPS Creator Ci20.
> 
> Therefore, this patch increases the timeout to 400ms. This should be
> enough to cover cases where jiffies updates get delayed. In nand_wait()
> the timeout was previously chosen based on whether erasing or
> programming. This is changed to be 400ms unconditionally as well to
> avoid similar problems there. nand_wait() is also slightly refactored
> to be consistent with nand_wait{,_status}_ready(). These changes should
> have no effect during normal operation.
> 
> Debugging this was made more difficult by the misleading comment above
> nand_wait_ready() stating "The timeout is caught later" - no timeout was
> ever reported, leading me away from the real source of the problem.
> Therefore, a pr_warn() is added when a timeout does occur so that it is
> easier to pinpoint similar problems in future.
> 
> Signed-off-by: Alex Smith <alex.smith@imgtec.com>
> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Niklas Cassel <niklas.cassel@axis.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org

Reviewed-by: Niklas Cassel <niklas.cassel@axis.com>
