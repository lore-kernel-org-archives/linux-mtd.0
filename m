Received: from mail-out.m-online.net ([212.18.0.9])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cfjL6-0004LZ-E1
 for linux-mtd@lists.infradead.org; Mon, 20 Feb 2017 08:28:59 +0000
Subject: Re: [PATCH v4 1/2] mtd: spi-nor: Added spi-nor init function
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>
References: <1487086368-4118-1-git-send-email-kdasu.kdev@gmail.com>
 <1487086368-4118-2-git-send-email-kdasu.kdev@gmail.com>
 <CACna6rzV3xNSyGGmDvTvbfMVp=iAZdXBQpniKFULKOtBW_6aow@mail.gmail.com>
Cc: linux-spi <linux-spi@vger.kernel.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>, Mark Brown
 <broonie@kernel.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
From: Marek Vasut <marex@denx.de>
Message-ID: <c2212635-69ae-5d47-3356-2ec8e24f5457@denx.de>
Date: Mon, 20 Feb 2017 09:15:34 +0100
MIME-Version: 1.0
In-Reply-To: <CACna6rzV3xNSyGGmDvTvbfMVp=iAZdXBQpniKFULKOtBW_6aow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/20/2017 09:12 AM, Rafał Miłecki wrote:
> On 14 February 2017 at 16:32, Kamal Dasu <kdasu.kdev@gmail.com> wrote:
>> Refactored spi_nor_scan() code to add spi_nor_init() function that
>> programs the spi-nor flash to:
>> 1) remove flash protection if applicable
>> 2) set read mode to quad mode if configured such
>> 3) set the address width based on the flash size and vendor
>>
>> spi_nor_scan() now calls spi_nor_init() to setup nor flash.
>>
>> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> 
> Ideally a short reason info should go there.
> "This allows reusing spi_nor_init during resume"
> or whatever :)
> 
It reinits the SPI NOR (if I understand it correctly). Being able to use
it on some boards after resume is a side-effect, so it should be listed
as such.

-- 
Best regards,
Marek Vasut
