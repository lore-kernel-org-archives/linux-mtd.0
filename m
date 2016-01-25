Received: from smtp09.smtpout.orange.fr ([80.12.242.131]
 helo=smtp.smtpout.orange.fr)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aNo3n-0005B9-OB
 for linux-mtd@lists.infradead.org; Mon, 25 Jan 2016 20:48:29 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Brian Norris <computersforpeace@gmail.com>,
 "ezequiel\@vanguardiasur.com.ar" <ezequiel@vanguardiasur.com.ar>
Cc: "linux-mtd\@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Michael Wang <Michael.Wang@alliedtelesis.co.nz>,
 "linux-arm-kernel\@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: mtd: pxa3xx_nand: issue with command time out
References: <5695CEF0.1080100@alliedtelesis.co.nz>
 <87a8o9ex9r.fsf@belgarion.home> <569827BC.10601@alliedtelesis.co.nz>
 <874meddqu5.fsf@belgarion.home> <20160125183022.GA41251@google.com>
Date: Mon, 25 Jan 2016 21:48:02 +0100
In-Reply-To: <20160125183022.GA41251@google.com> (Brian Norris's message of
 "Mon, 25 Jan 2016 10:30:22 -0800")
Message-ID: <87fuxl9yil.fsf@belgarion.home>
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

Brian Norris <computersforpeace@gmail.com> writes:

> Hi Robert,
>
> On Sun, Jan 17, 2016 at 12:53:06AM +0100, Robert Jarzmik wrote:
> commit 24542257a3b987025d4b998ec2d15e556c98ad3f
> Author: Robert Jarzmik <robert.jarzmik@free.fr>
> Date:   Fri Feb 20 19:36:43 2015 +0100
>
>     mtd: pxa3xx-nand: handle PIO in threaded interrupt
>
>
> And now I'm wondering: when does the completion get triggered? i.e.:
>
> 	complete(&info->cmd_complete);

> It seems to me like you've short-circuited some of the IRQ handling
> code, so that the threaded handler is buggy. AIUI, if the completion
> event ever happens, it's actually happening *before* the full (threaded)
> handler is actually finished, since it occurs in pxa3xx_nand_irq(),
> before pxa3xx_nand_irq_thread() ever runs. Now, I'm not sure if that
> causes a real problem in practice, since you used IRQF_ONESHOT, but I
> would think that's also suspect.

I think you're very right, this "goto NORMAL_IRQ_EXIT" creates a
short-cirtcuit. That makes me think that I should :
 - add
static void pxa3xx_nand_data_finished(struct pxa3xx_nand_info *info)
{
	unsigned int done;

 	cmd_done = info->cs ? NDSR_CS1_CMDD : NDSR_CS0_CMDD;
	nand_writel(info, NDSR, cmd_done);
        complete(&inf0->cmd_complete);
}

 - in pxa3xx_nand_irq_thread(), I should add at the end:
	pxa3xx_nand_data_finished(info);

 - in pxa3xx_nand_data_dma_irq(), I should add at the end:
	pxa3xx_nand_data_finished(info);

Ezequiel, would you have a look at that code snippet and tell me if I'm missing
something in the driver's structure ?

Cheers.

--
Robert
