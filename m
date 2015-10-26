Received: from mail-pa0-x233.google.com ([2607:f8b0:400e:c03::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zqo1j-0004qV-92
 for linux-mtd@lists.infradead.org; Mon, 26 Oct 2015 20:05:56 +0000
Received: by pasz6 with SMTP id z6so197346374pas.2
 for <linux-mtd@lists.infradead.org>; Mon, 26 Oct 2015 13:05:34 -0700 (PDT)
Date: Mon, 26 Oct 2015 13:05:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Harvey Hunt <harvey.hunt@imgtec.com>
Cc: IMG-MIPSLinuxKerneldevelopers@imgtec.com,
 Alex Smith <alex.smith@imgtec.com>, Alex Smith <alex@alex-smith.me.uk>,
 Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Niklas Cassel <niklas.cassel@axis.com>,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7] mtd: nand: increase ready wait timeout and report
 timeouts
Message-ID: <20151026200531.GE13239@google.com>
References: <1444139527-14087-1-git-send-email-harvey.hunt@imgtec.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1444139527-14087-1-git-send-email-harvey.hunt@imgtec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 06, 2015 at 02:52:07PM +0100, Harvey Hunt wrote:
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
> Signed-off-by: Harvey Hunt <harvey.hunt@imgtec.com>
> Reviewed-by: Niklas Cassel <niklas.cassel@axis.com>
> Cc: Alex Smith <alex@alex-smith.me.uk>
> Cc: Zubair Lutfullah Kakakhel <Zubair.Kakakhel@imgtec.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>
> Cc: Niklas Cassel <niklas.cassel@axis.com>
> Cc: linux-mtd@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
> This patch was originally sent in a JZ4780 patch set, but sending
> it on its own was deemed more appropriate. Alex Smith sent the
> original patch - this is an unmodified version that he has asked me
> to send.

Looks good, thanks. Pushed to l2-mtd.git.
