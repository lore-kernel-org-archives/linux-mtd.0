Received: from mail-wm0-x243.google.com ([2a00:1450:400c:c09::243])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1balau-0004bX-DI
 for linux-mtd@lists.infradead.org; Fri, 19 Aug 2016 15:20:29 +0000
Received: by mail-wm0-x243.google.com with SMTP id i5so3825125wmg.2
 for <linux-mtd@lists.infradead.org>; Fri, 19 Aug 2016 08:20:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160816181536.GX9347@sirena.org.uk>
References: <1469830393-13295-1-git-send-email-kdasu.kdev@gmail.com>
 <1469830393-13295-3-git-send-email-kdasu.kdev@gmail.com>
 <20160816181536.GX9347@sirena.org.uk>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Fri, 19 Aug 2016 11:20:05 -0400
Message-ID: <CAC=U0a1uW3pB0MA1Hmw9_pKTrBhnHKmz7gquih2r5zSUO_SAoA@mail.gmail.com>
Subject: Re: [PATCH v5 2/8] spi: bcm-qspi: Add Broadcom MSPI driver
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

On Tue, Aug 16, 2016 at 2:15 PM, Mark Brown <broonie@kernel.org> wrote:
> On Fri, Jul 29, 2016 at 06:13:07PM -0400, Kamal Dasu wrote:
>
>> +static int bcm_qspi_transfer_one(struct spi_master *master,
>
>> +             if (qspi->next_udelay) {
>> +                     udelay(qspi->next_udelay);
>> +                     qspi->next_udelay = 0;
>> +             }
>
> Why is the driver manually implementing delays in a transfer_one()
> function?  The core will add any required delays between transfers, this
> will result in us delaying twice.
>
>> +             read_from_hw(qspi, slots);
>> +             if (qspi->cs_change) {
>> +                     usleep_range(10, 20);
>> +                     qspi->cs_change = 0;
>> +             }
>
> Similarly here, the core will do chip select changes.
>
>> +     if (spi_transfer_is_last(master, trans))
>> +             hw_stop(qspi);
>
> The only thing I can see that looks like it might make a difference here
> is this hw_stop() operation but all that does is update an internal
> state machine so there's no limitation on it needing to be done before
> the above operations that I can see.


I will cleanup  above 3 areas of redundant code.

>> +     ret = clk_prepare_enable(qspi->clk);
>> +     if (ret) {
>> +             dev_err(dev, "failed to prepare clock\n");
>> +             goto err2;
>
> Please use named labels rather than numbered, it makes life a lot easier
> if anything gets changed.
>

Ok will make this change as well

>> +EXPORT_SYMBOL_GPL(bcm_qspi_probe);
>
> This needs some explanation or to be added along with the user.
>

Will add appropriate comments for the user.

>> diff --git a/drivers/spi/spi-brcmstb-qspi.c b/drivers/spi/spi-brcmstb-qspi.c
>> new file mode 100644
>> index 0000000..c7df92e
>> --- /dev/null
>> +++ b/drivers/spi/spi-brcmstb-qspi.c
>
> This should really be a separate patch, it's a separate driver and very
> surprising to find it here.

Its very specific to the spi-block and hence is here, I will separate the patch,

Kamal
