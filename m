Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkGtl-0002JC-2m
 for linux-mtd@lists.infradead.org; Wed, 14 Sep 2016 20:35:13 +0000
Received: by mail-pf0-x244.google.com with SMTP id g202so1234625pfb.1
 for <linux-mtd@lists.infradead.org>; Wed, 14 Sep 2016 13:34:52 -0700 (PDT)
Subject: Re: [PATCH v6, 7/8] arm64: dts: Add ns2 SoC support
To: Kamal Dasu <kdasu.kdev@gmail.com>, broonie@kernel.org,
 linux-spi@vger.kernel.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, f.fainelli@gmail.com,
 yendapally.reddy@broadcom.com
References: <1472076269-4731-1-git-send-email-kdasu.kdev@gmail.com>
 <1472076269-4731-8-git-send-email-kdasu.kdev@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com, jon.mason@broadcom.com
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <0efaedcd-5fe5-4a82-521e-066201477e89@gmail.com>
Date: Wed, 14 Sep 2016 13:34:50 -0700
MIME-Version: 1.0
In-Reply-To: <1472076269-4731-8-git-send-email-kdasu.kdev@gmail.com>
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

On 08/24/2016 03:04 PM, Kamal Dasu wrote:
> Adding qspi node compatible with the new spi-bcm-qspi
> driver for the Broadcom's northstar2 SoC.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> Signed-off-by: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>

Applied to devicetree-arm64/next with small tweaks to the subject,
thanks Kamal!
-- 
Florian
