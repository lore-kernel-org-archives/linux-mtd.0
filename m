Received: from mail-qt0-f194.google.com ([209.85.216.194])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1ca7Gg-0004eD-1s
 for linux-mtd@lists.infradead.org; Sat, 04 Feb 2017 20:49:11 +0000
Received: by mail-qt0-f194.google.com with SMTP id w20so10140104qtb.1
 for <linux-mtd@lists.infradead.org>; Sat, 04 Feb 2017 12:48:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20170204112555.p77votp5m7klygbe@sirena.org.uk>
References: <1486164676-12912-1-git-send-email-kdasu.kdev@gmail.com>
 <1486164676-12912-4-git-send-email-kdasu.kdev@gmail.com>
 <20170204112555.p77votp5m7klygbe@sirena.org.uk>
From: Kamal Dasu <kdasu.kdev@gmail.com>
Date: Sat, 4 Feb 2017 15:47:48 -0500
Message-ID: <CAC=U0a0o21taio6jYzTCx1ix85aFNtikXHs=O99OW1pChbG4TA@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] spi: Added way to check for pm support for flash
 devices
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi <linux-spi@vger.kernel.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marex@denx.de>, MTD Maling List <linux-mtd@lists.infradead.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "Jayachandran C <jchandra@broadcom.com>,
 bcm-kernel-feedback-list" <bcm-kernel-feedback-list@broadcom.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Feb 4, 2017 at 6:25 AM, Mark Brown <broonie@kernel.org> wrote:
> On Fri, Feb 03, 2017 at 06:31:14PM -0500, Kamal Dasu wrote:
>
>> Device drivers can check if the master controller driver has to support
>> flash pm. The controller driver indicates this using flash_pm_supported()
>> spi master interface.
>
> What is "flash pm" and how would a client use it given that no API for
> actually managing power is being added here?  Someone looking at the API
> needs to be able to figure these things out and right now I can't see
> how they'd do that...o

The flash_pm function just indicates if  m25p80 resume op that does a
spi_nor_pm_rescan() is needed, and by default will do nothing for
other platforms. So the basic idea of the patches was to execute the
only necessary spi_nor_pm_rescan() on resume when flash parts are
reset on suspend. So from controller perspective there is no
additional pm activity to be done. Patches 1/5-2/5 is what is needed
actually. And Patches 3/3 - 5/5 only add a check if m25p80 resume
should call spi_nor_pm_rescan(). And the controller driver shall
implement the flash_pm function and return true if it does need a
rescan to be done on resume.
