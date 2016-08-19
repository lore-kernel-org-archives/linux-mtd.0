Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1balxU-0006ZF-6K
 for linux-mtd@lists.infradead.org; Fri, 19 Aug 2016 15:43:50 +0000
Received: by mail-wm0-x241.google.com with SMTP id i5so3902037wmg.2
 for <linux-mtd@lists.infradead.org>; Fri, 19 Aug 2016 08:43:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160816184030.GB9347@sirena.org.uk>
References: <1469830393-13295-1-git-send-email-kdasu.kdev@gmail.com>
 <1469830393-13295-9-git-send-email-kdasu.kdev@gmail.com>
 <20160816184030.GB9347@sirena.org.uk>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Fri, 19 Aug 2016 11:43:24 -0400
Message-ID: <CAC=U0a31LOphD=21-tBtiCxN-JqxSArxqhQ4_=fXwH-vEKnbHA@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] spi: nsp-qspi: Add Broadcom NSP, NS2,
 Cygnus SoC support
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, MTD Maling List <linux-mtd@lists.infradead.org>,
 vigneshr@ti.com, Florian Fainelli <f.fainelli@gmail.com>,
 "Jayachandran C <jchandra@broadcom.com>,
 bcm-kernel-feedback-list" <bcm-kernel-feedback-list@broadcom.com>,
 Vikram Prakash <vikram.prakash@broadcom.com>,
 Andy Fung <andy.fung@broadcom.com>, Jon Mason <jon.mason@broadcom.com>,
 "Jayachandran C <jchandra@broadcom.com>,
 bcm-kernel-feedback-list" <jchandra@broadcom.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 16, 2016 at 2:40 PM, Mark Brown <broonie@kernel.org> wrote:
> On Fri, Jul 29, 2016 at 06:13:13PM -0400, Kamal Dasu wrote:
>
>> -             irq = platform_get_irq_byname(pdev, name);
>> +             if (soc && qspi_irq_tab[val].irq_source == MUXED_L1) {
>> +                     /* all mspi, bspi intrs muxed to one L1 intr */
>> +                     irq = platform_get_irq(pdev, 0);
>> +                     of_property_read_string(dev->of_node,
>> +                                             "interrupt-names",
>> +                                             &name);
>> +             }
>
> I am confused why we are parsing the interrupt-names property here?
>

For Muxed L1 single source interrupt, there is only one irq, and  SoCs
could use a different different name wanted to use that name. But I
could force a name as well.

>> +     /*
>> +      * Some SoCs integrate spi controller (e.g., its interrupt bits)
>> +      * in specific ways
>> +      */
>> +     if (soc) {
>> +             qspi->soc = soc;
>> +             soc->bcm_qspi_int_set(soc, MSPI_DONE, true);
>> +     } else {
>> +             qspi->soc = NULL;
>> +     }
>
> The variable name "soc" here doesn't seem hugely descriptive when it's
> just for the interrupt controller.

Named it that way since it could potentially have other SoC specific
settings for spi master bus needed in future.

Kamal
