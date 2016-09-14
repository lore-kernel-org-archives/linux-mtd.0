Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bkGss-000226-1V
 for linux-mtd@lists.infradead.org; Wed, 14 Sep 2016 20:34:18 +0000
Received: by mail-pf0-x241.google.com with SMTP id 128so1226828pfb.0
 for <linux-mtd@lists.infradead.org>; Wed, 14 Sep 2016 13:33:57 -0700 (PDT)
Subject: Re: [PATCH v6, 6/8] arm: dts: Add bcm-nsp and bcm958625k support
To: Kamal Dasu <kdasu.kdev@gmail.com>, broonie@kernel.org,
 linux-spi@vger.kernel.org, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, vigneshr@ti.com, f.fainelli@gmail.com,
 yendapally.reddy@broadcom.com
References: <1472076269-4731-1-git-send-email-kdasu.kdev@gmail.com>
 <1472076269-4731-7-git-send-email-kdasu.kdev@gmail.com>
Cc: bcm-kernel-feedback-list@broadcom.com, jon.mason@broadcom.com
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <dd338c1b-94e4-abc2-eefd-5855dba5bee4@gmail.com>
Date: Wed, 14 Sep 2016 13:33:54 -0700
MIME-Version: 1.0
In-Reply-To: <1472076269-4731-7-git-send-email-kdasu.kdev@gmail.com>
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
> driver for the broadcom's northstar SoC.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> Signed-off-by: Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>

Applied to devicetree/next with small tweaks to the subject, thanks Kamal!
-- 
Florian
