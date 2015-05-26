Received: from mail-ig0-x236.google.com ([2607:f8b0:4001:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxLKv-0001Lg-4x
 for linux-mtd@lists.infradead.org; Tue, 26 May 2015 20:20:29 +0000
Received: by igbyr2 with SMTP id yr2so68278427igb.0
 for <linux-mtd@lists.infradead.org>; Tue, 26 May 2015 13:20:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1432492349-18517-1-git-send-email-hauke@hauke-m.de>
References: <1432492349-18517-1-git-send-email-hauke@hauke-m.de>
Date: Tue, 26 May 2015 22:20:06 +0200
Message-ID: <CACna6rxOBnxeNFP3ogxVyB+F_BeMN9mGq6vM+zUQeRqsz1cJuQ@mail.gmail.com>
Subject: Re: [RFC] ARM: BCM5301X: add NAND flash chip description
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Content-Type: text/plain; charset=UTF-8
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Ray Jui <rjui@broadcom.com>,
 Jonas Gorski <jogo@openwrt.org>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 24 May 2015 at 20:32, Hauke Mehrtens <hauke@hauke-m.de> wrote:
> This adds the NAND flash chip description for a standard chip found
> connected to this SoC. This makes use of generic Broadcom NAND driver
> with the iProc interface.

I still wait/hope for Brian's reply in
[PATCH 5/7] mtd: brcmnand: add bcma driver
