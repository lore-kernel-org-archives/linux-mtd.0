Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ad34P-00046K-TU
 for linux-mtd@lists.infradead.org; Mon, 07 Mar 2016 21:52:06 +0000
Received: by mail-pa0-x244.google.com with SMTP id fl4so8402471pad.2
 for <linux-mtd@lists.infradead.org>; Mon, 07 Mar 2016 13:51:43 -0800 (PST)
Date: Mon, 7 Mar 2016 13:51:40 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Harvey Hunt <harvey.hunt@imgtec.com>,
 Alex Smith <alex.smith@imgtec.com>, Niklas Cassel <niklas.cassel@axis.com>,
 Alex Smith <alex@alex-smith.me.uk>
Subject: Re: [PATCH] mtd: nand: check status before reporting timeout
Message-ID: <20160307215140.GB55664@google.com>
References: <1457140763-67571-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1457140763-67571-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 04, 2016 at 05:19:23PM -0800, Brian Norris wrote:
> In commit b70af9bef49b ("mtd: nand: increase ready wait timeout and
> report timeouts"), we increased the likelihood of scheduling during
> nand_wait(). This makes us more likely to hit the time_before(...)
> condition, since a lot of time may pass before we get scheduled again.
> 
> Now, the loop was already buggy, since we don't check if the NAND is
> ready after exiting the loop; we simply print out a timeout warning. Fix
> this by doing a final status check before printing a timeout message.
> 
> This isn't actually a critical bug, since the only effect is a false
> warning print. But too many prints never hurt anyone, did they? :)
> 
> Side note: perhaps I'm not smart enough, but I'm not sure what the best
> policy is for this kind of loop; do we busy loop (i.e., no
> cond_resched()) to keep the lowest I/O latency (it's not great if the
> resched is delaying Richard's system ~400ms)? Or do we allow
> rescheduling, to play nice with the rest of the system (since some
> operations can take quite a while)?
> 
> Reported-by: Richard Weinberger <richard@nod.at>
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Reviewed-by: Richard Weinberger <richard@nod.at>
> Reviewed-by: Harvey Hunt <harvey.hunt@imgtec.com>

Applied
