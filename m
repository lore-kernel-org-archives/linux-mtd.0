Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1balnP-0002jq-L4
 for linux-mtd@lists.infradead.org; Fri, 19 Aug 2016 15:33:24 +0000
Received: by mail-wm0-x243.google.com with SMTP id o80so3882125wme.0
 for <linux-mtd@lists.infradead.org>; Fri, 19 Aug 2016 08:33:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160816183148.GZ9347@sirena.org.uk>
References: <1469830393-13295-1-git-send-email-kdasu.kdev@gmail.com>
 <1469830393-13295-4-git-send-email-kdasu.kdev@gmail.com>
 <20160816183148.GZ9347@sirena.org.uk>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Fri, 19 Aug 2016 11:33:01 -0400
Message-ID: <CAC=U0a0NkjUQ1gAGNCsLycUhU_x0k=munc4bPTZW1YEW6OY1yw@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] spi: bcm-qspi: Add BSPI spi-nor flash controller
 driver
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, MTD Maling List <linux-mtd@lists.infradead.org>,
 vigneshr@ti.com, Florian Fainelli <f.fainelli@gmail.com>,
 "Jayachandran C <jchandra@broadcom.com>,
 bcm-kernel-feedback-list" <bcm-kernel-feedback-list@broadcom.com>,
 Vikram Prakash <vikram.prakash@broadcom.com>,
 Andy Fung <andy.fung@broadcom.com>, Jon Mason <jon.mason@broadcom.com>,
 "Jayachandran C <jchandra@broadcom.com>,
 bcm-kernel-feedback-list" <jchandra@broadcom.com>,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 16, 2016 at 2:31 PM, Mark Brown <broonie@kernel.org> wrote:
> On Fri, Jul 29, 2016 at 06:13:08PM -0400, Kamal Dasu wrote:
>
>> +     bcm_qspi_bspi_lr_start(qspi);
>> +     /* Must flush previous writes before starting BSPI operation */
>> +     mb();
>> +     if (!wait_for_completion_timeout(&qspi->bspi_done, timeo)) {
>
> The comment suggests that the memory barrier is misplaced or that
> there's something missing?
>

Yes it got misplaced during refactoring the code. will move it to the
right place.

>> +             if (retry--)
>> +                     goto retry;
>
> Please write loops using normal C looping constructs rather than goto
> statements, it makes life a lot easier.  I'm not convinced that the loop
> is safe as is with the completion reinitializaiton and so on, we should
> at least be turning off the hardware before we reinitialize the
> completion to avoid races with slow hardware.
>

Actually will get rid of the retry logic.

>> +     io_width = msg->data_nbits ? msg->data_nbits : SPI_NBITS_SINGLE;
>
> Normal if statements please.
>

Ok will fix this.

>> +static irqreturn_t bcm_qspi_bspi_lr_err_l2_isr(int irq, void *dev_id)
>> +{
>> +     struct bcm_qspi_dev_id *qspi_dev_id = dev_id;
>> +     struct bcm_qspi *qspi = qspi_dev_id->dev;
>> +
>> +     dev_dbg(&qspi->pdev->dev, "BSPI INT error status %x\n",
>> +             qspi_dev_id->irqp->mask);
>
> I'd expect this to be dev_err() or something, but then the message
> claims this an error status and it doesn't seem to actually read that
> from the hardware.
>

Agreed will change this.

>> +#ifdef  QSPI_INT_DEBUG
>> +     /* this interrupt is for debug purposes only, dont request irq */
>> +     {
>> +             .irq_name = "spi_lr_overread",
>> +             .irq_handler = bcm_qspi_bspi_lr_err_l2_isr,
>> +             .mask = INTR_BSPI_LR_OVERREAD_MASK,
>> +     },
>> +#endif
>
> Why not?

Is there in the HW block but will never get triggered,  will never get
triggered in the current driver. But kept it for completeness.

Kamal
