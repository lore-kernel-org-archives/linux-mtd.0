Received: from mail-pf0-x242.google.com ([2607:f8b0:400e:c00::242])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bVR0L-0002RR-EM
 for linux-mtd@lists.infradead.org; Thu, 04 Aug 2016 22:20:42 +0000
Received: by mail-pf0-x242.google.com with SMTP id g202so19009648pfb.1
 for <linux-mtd@lists.infradead.org>; Thu, 04 Aug 2016 15:20:20 -0700 (PDT)
Subject: Re: [PATCH v5 1/8] Documentation: dt: spi: Add BRCMSTB SoC bindings
To: Mark Brown <broonie@kernel.org>, Kamal Dasu <kdasu.kdev@gmail.com>
References: <1469830393-13295-1-git-send-email-kdasu.kdev@gmail.com>
 <1469830393-13295-2-git-send-email-kdasu.kdev@gmail.com>
 <20160804210634.GM10383@sirena.org.uk>
Cc: linux-spi@vger.kernel.org, linux-mtd@lists.infradead.org,
 vigneshr@ti.com, bcm-kernel-feedback-list@broadcom.com,
 vikram.prakash@broadcom.com, andy.fung@broadcom.com, jon.mason@broadcom.com,
 jchandra@broadcom.com
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <1fddf72d-cbc1-225f-b482-d6ba99dab823@gmail.com>
Date: Thu, 4 Aug 2016 15:20:17 -0700
MIME-Version: 1.0
In-Reply-To: <20160804210634.GM10383@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/04/2016 02:06 PM, Mark Brown wrote:
> On Fri, Jul 29, 2016 at 06:13:06PM -0400, Kamal Dasu wrote:
>> Added device tree bindings documentation for SoCs supported by the
>> new spi-bcm-qspi, spi-brcmstb-qspi driver.
> 
> Please submit patches using subject lines reflecting the style for the
> subsystem.  This makes it easier for people to identify relevant
> patches.  Look at what existing commits in the area you're changing are
> doing and make sure your subject lines visually resemble what they're
> doing.

What's wrong with the subjects being used here? It's not like there is a
consistent subject for DT bindings, is spi/dt what you would expect here?

Can we save Kamal another round of patches and provide feedback on the
patch contents (as well as their form)?
-- 
Florian
