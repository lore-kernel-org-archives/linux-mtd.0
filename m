Received: from mail-wm0-x22d.google.com ([2a00:1450:400c:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aO3IC-0002oh-Kf
 for linux-mtd@lists.infradead.org; Tue, 26 Jan 2016 13:04:22 +0000
Received: by mail-wm0-x22d.google.com with SMTP id n5so129104304wmn.0
 for <linux-mtd@lists.infradead.org>; Tue, 26 Jan 2016 05:03:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87fuxl9yil.fsf@belgarion.home>
References: <5695CEF0.1080100@alliedtelesis.co.nz>
 <87a8o9ex9r.fsf@belgarion.home>
 <569827BC.10601@alliedtelesis.co.nz>
 <874meddqu5.fsf@belgarion.home> <20160125183022.GA41251@google.com>
 <87fuxl9yil.fsf@belgarion.home>
Date: Tue, 26 Jan 2016 10:03:57 -0300
Message-ID: <CAAEAJfCNzh9+zRq_Yb=hFyLfP8RFoX+LUsDL4dVwUenVc_gVOA@mail.gmail.com>
Subject: Re: mtd: pxa3xx_nand: issue with command time out
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Michael Wang <Michael.Wang@alliedtelesis.co.nz>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 25 January 2016 at 17:48, Robert Jarzmik <robert.jarzmik@free.fr> wrote:
> Brian Norris <computersforpeace@gmail.com> writes:
>
>> Hi Robert,
>>
>> On Sun, Jan 17, 2016 at 12:53:06AM +0100, Robert Jarzmik wrote:
>> commit 24542257a3b987025d4b998ec2d15e556c98ad3f
>> Author: Robert Jarzmik <robert.jarzmik@free.fr>
>> Date:   Fri Feb 20 19:36:43 2015 +0100
>>
>>     mtd: pxa3xx-nand: handle PIO in threaded interrupt
>>
>>
>> And now I'm wondering: when does the completion get triggered? i.e.:
>>
>>       complete(&info->cmd_complete);
>
>> It seems to me like you've short-circuited some of the IRQ handling
>> code, so that the threaded handler is buggy. AIUI, if the completion
>> event ever happens, it's actually happening *before* the full (threaded)
>> handler is actually finished, since it occurs in pxa3xx_nand_irq(),
>> before pxa3xx_nand_irq_thread() ever runs. Now, I'm not sure if that
>> causes a real problem in practice, since you used IRQF_ONESHOT, but I
>> would think that's also suspect.
>
> I think you're very right, this "goto NORMAL_IRQ_EXIT" creates a
> short-cirtcuit. That makes me think that I should :
>  - add
> static void pxa3xx_nand_data_finished(struct pxa3xx_nand_info *info)
> {
>         unsigned int done;
>
>         cmd_done =3D info->cs ? NDSR_CS1_CMDD : NDSR_CS0_CMDD;
>         nand_writel(info, NDSR, cmd_done);
>         complete(&inf0->cmd_complete);
> }
>
>  - in pxa3xx_nand_irq_thread(), I should add at the end:
>         pxa3xx_nand_data_finished(info);
>
>  - in pxa3xx_nand_data_dma_irq(), I should add at the end:
>         pxa3xx_nand_data_finished(info);
>
> Ezequiel, would you have a look at that code snippet and tell me if I'm m=
issing
> something in the driver's structure ?
>

Although it seems Brian is right, I'm not so sure about it. As far as
I can recall, the IRQ sequence is (please correct me if I'm wrong!):

1. Write command request (WRCMDREQ), the IRQ handler writes the command.
2. Read/write data request (RDDREQ | WRDREQ). The IRQ handler fires
the threaded handler, which does data transfer.
3. Command done IRQ (CMDD), the IRQ handler completes the completion.

I don't think data request and command done can be found
simultaneously, so I don't think this is a real issue. Ideas?

Regarding the fixed proposed up there, it seems wrong: the completion
should be completed only after a command done IRQ is found, and not as
the result of data transfer being finished.
--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
