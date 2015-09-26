Received: from smtp09.smtpout.orange.fr ([80.12.242.131]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zfw1I-0006au-S5
 for linux-mtd@lists.infradead.org; Sat, 26 Sep 2015 20:24:33 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Brian Norris <computersforpeace@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: nand: pxa3xx-nand: prevent DFI bus lockup on
 removal
References: <1440961710-17347-1-git-send-email-robert.jarzmik@free.fr>
Date: Sat, 26 Sep 2015 22:19:07 +0200
In-Reply-To: <1440961710-17347-1-git-send-email-robert.jarzmik@free.fr>
 (Robert Jarzmik's message of "Sun, 30 Aug 2015 21:08:30 +0200")
Message-ID: <87a8s9exxg.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Robert Jarzmik <robert.jarzmik@free.fr> writes:

> After the conversion of pxa architecture to common clock framework, the
> NAND clock can be disabled on driver exit.
>
> In this case, it happens that if the driver used the NAND and set the
> DFI arbitration bit, the next access to a static memory controller area,
> such as an ethernet card, will stall the system bus, and the core will
> be stalled forever.
>
> This is especially true on pxa31x SoCs, where the NDCR was augmented
> with a new bit to prevent this lockups by giving full ownership of the
> DFI arbiter to the SMC, in change SCr#6.
>
> Fix this by clearing the DFI arbritration bit in driver exit. This
> effectively prevents a lockup on zylonite when removing pxa3xx-nand
> module, and using ethernet afterwards.
>
> Signed-off-by: Robert Jarzmik <robert.jarzmik@free.fr>
Hi Brian,

Are you happy with this patch, and if so could you queue it please ?

Cheers.

--
Robert
