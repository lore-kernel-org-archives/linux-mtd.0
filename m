Received: from mail-wm0-x241.google.com ([2a00:1450:400c:c09::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1balOX-0007y5-Gy
 for linux-mtd@lists.infradead.org; Fri, 19 Aug 2016 15:07:42 +0000
Received: by mail-wm0-x241.google.com with SMTP id o80so3795549wme.0
 for <linux-mtd@lists.infradead.org>; Fri, 19 Aug 2016 08:07:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160816181944.GY9347@sirena.org.uk>
References: <1469830393-13295-1-git-send-email-kdasu.kdev@gmail.com>
 <1469830393-13295-2-git-send-email-kdasu.kdev@gmail.com>
 <20160816181944.GY9347@sirena.org.uk>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Fri, 19 Aug 2016 11:07:19 -0400
Message-ID: <CAC=U0a2ONY_YQyOe+v1TJGmsUNcq_r0AN4B3-62ugojpmYT3cw@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] Documentation: dt: spi: Add BRCMSTB SoC bindings
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

On Tue, Aug 16, 2016 at 2:19 PM, Mark Brown <broonie@kernel.org> wrote:
> On Fri, Jul 29, 2016 at 06:13:06PM -0400, Kamal Dasu wrote:
>> Added device tree bindings documentation for SoCs supported by the
>> new spi-bcm-qspi, spi-brcmstb-qspi driver.
>
> This doesn't document the clock-frequency property the driver
> implements.  However I'd recommend just dropping that since it appears
> to duplicate the existing facilities for setting the bus speed per slave
> device.

Will fix this and the subject for the patch.

Kamal
