Received: from mail-ot0-x236.google.com ([2607:f8b0:4003:c0f::236])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cfj5B-0005vt-Fo
 for linux-mtd@lists.infradead.org; Mon, 20 Feb 2017 08:12:32 +0000
Received: by mail-ot0-x236.google.com with SMTP id k4so43744512otc.0
 for <linux-mtd@lists.infradead.org>; Mon, 20 Feb 2017 00:12:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1487086368-4118-2-git-send-email-kdasu.kdev@gmail.com>
References: <1487086368-4118-1-git-send-email-kdasu.kdev@gmail.com>
 <1487086368-4118-2-git-send-email-kdasu.kdev@gmail.com>
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Date: Mon, 20 Feb 2017 09:12:08 +0100
Message-ID: <CACna6rzV3xNSyGGmDvTvbfMVp=iAZdXBQpniKFULKOtBW_6aow@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] mtd: spi-nor: Added spi-nor init function
To: Kamal Dasu <kdasu.kdev@gmail.com>
Cc: linux-spi <linux-spi@vger.kernel.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marex@denx.de>, Mark Brown <broonie@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 14 February 2017 at 16:32, Kamal Dasu <kdasu.kdev@gmail.com> wrote:
> Refactored spi_nor_scan() code to add spi_nor_init() function that
> programs the spi-nor flash to:
> 1) remove flash protection if applicable
> 2) set read mode to quad mode if configured such
> 3) set the address width based on the flash size and vendor
>
> spi_nor_scan() now calls spi_nor_init() to setup nor flash.
>
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>

Ideally a short reason info should go there.
"This allows reusing spi_nor_init during resume"
or whatever :)
