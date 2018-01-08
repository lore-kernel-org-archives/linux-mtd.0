Received: from mail-qk0-x22d.google.com ([2607:f8b0:400d:c09::22d])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eYeB9-0001gg-Du
 for linux-mtd@lists.infradead.org; Mon, 08 Jan 2018 20:37:57 +0000
Received: by mail-qk0-x22d.google.com with SMTP id l12so15504808qke.13
 for <linux-mtd@lists.infradead.org>; Mon, 08 Jan 2018 12:37:45 -0800 (PST)
Subject: Re: [PATCH v3] mtd: nand: brcmnand: Disable prefetch by default
To: Kamal Dasu <kdasu.kdev@gmail.com>, boris.brezillon@free-electrons.com,
 linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com
Cc: computersforpeace@gmail.com, richard@nod.at, dwmw2@infradead.org,
 marek.vasut@gmail.com, cyrille.pitchen@wedev4u.fr, stable@vger.kernel.org
References: <1515443808-31105-1-git-send-email-kdasu.kdev@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <c06a78aa-1285-8b93-9440-af9770ffdd91@gmail.com>
Date: Mon, 8 Jan 2018 12:37:38 -0800
MIME-Version: 1.0
In-Reply-To: <1515443808-31105-1-git-send-email-kdasu.kdev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 01/08/2018 12:36 PM, Kamal Dasu wrote:
> Brcm nand controller prefetch feature needs to be disabled
> by default. Enabling affects performance on random reads as
> well as dma reads.
> 
> Signed-off-by: Kamal Dasu <kdasu.kdev@gmail.com>
> Fixes: 27c5b17cd1b1 ("mtd: nand: add NAND driver "library" for Broadcom STB NAND controller")
> Cc: stable@vger.kernel.org

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
