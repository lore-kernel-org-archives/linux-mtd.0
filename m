Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178dbL-0005Fx-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 10:00:39 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020517.011732.74751668.takasi-y@ops.dti.ne.jp> 
References: <20020517.011732.74751668.takasi-y@ops.dti.ne.jp> 
To: Takashi YOSHII <takasi-y@ops.dti.ne.jp>
Cc: linux-mtd@lists.infradead.org
Subject: Re: can't erase "sharp". 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 17 May 2002 10:00:30 +0100
Message-ID: <15336.1021626030@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

takasi-y@ops.dti.ne.jp said:
> I'm using drivers/mtd/chip/sharp.c (I know it's "obsolete", though).
> And, found "eraseall" command doesn't work upon it. The operation
> stops at 0%, and the command never exit.

> I added few lines(see the patch below), and it works, perhaps... I'm
> not sure if it is correct (especially when signals received).

> Could someone tell me the right answer, please?

The second part of your patch was the correct one -- setting instr->state 
to MTD_ERASE_DONE on completion. When the erase fails immediately, it's not 
required to set instr->state to MTD_ERASE_FAILED. That's only necessary if 
the chip driver does asynchronous operation, and returns from the erase 
function before the operation has completed.

--
dwmw2
