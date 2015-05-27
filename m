Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxjKf-0004yj-9t
 for linux-mtd@lists.infradead.org; Wed, 27 May 2015 21:57:49 +0000
Received: by pdbki1 with SMTP id ki1so26390246pdb.1
 for <linux-mtd@lists.infradead.org>; Wed, 27 May 2015 14:57:28 -0700 (PDT)
Date: Wed, 27 May 2015 14:57:24 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Hauke Mehrtens <hauke@hauke-m.de>
Subject: Re: [RFC] ARM: BCM5301X: add NAND flash chip description
Message-ID: <20150527215600.GL27753@ld-irv-0074>
References: <1432492349-18517-1-git-send-email-hauke@hauke-m.de>
 <5386954.hrl5VLbdYc@wuerfel> <55663B48.5060306@hauke-m.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <55663B48.5060306@hauke-m.de>
Cc: devicetree@vger.kernel.org, f.fainelli@gmail.com,
 Arnd Bergmann <arnd@arndb.de>, rjui@broadcom.com, zajec5@gmail.com,
 jogo@openwrt.org, linux-mtd@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 27, 2015 at 11:46:48PM +0200, Hauke Mehrtens wrote:
> This deice tree attribute is already supported
> by one driver I moved the code to make it available for all drivers.

To be clear here, though, the original binding was barely reviewed, let
alone documented. So I'd consider a redefinition is perfectly acceptable
if we plan to make wider use of it.

Brian
