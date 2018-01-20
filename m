Received: from mail-qt0-x242.google.com ([2607:f8b0:400d:c0d::242])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ed2Kg-0003GO-9I
 for linux-mtd@lists.infradead.org; Sat, 20 Jan 2018 23:13:56 +0000
Received: by mail-qt0-x242.google.com with SMTP id z10so12480387qti.5
 for <linux-mtd@lists.infradead.org>; Sat, 20 Jan 2018 15:13:40 -0800 (PST)
Subject: Re: [PATCH v3] mtd: nand: brcmnand: Disable prefetch by default
To: Kamal Dasu <kdasu.kdev@gmail.com>, boris.brezillon@free-electrons.com,
 linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com
Cc: richard@nod.at, stable@vger.kernel.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, computersforpeace@gmail.com, dwmw2@infradead.org
References: <1515443808-31105-1-git-send-email-kdasu.kdev@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <71de78c5-0081-a663-2383-638832766001@gmail.com>
Date: Sat, 20 Jan 2018 15:13:35 -0800
MIME-Version: 1.0
In-Reply-To: <1515443808-31105-1-git-send-email-kdasu.kdev@gmail.com>
Content-Type: text/plain; charset=windows-1252
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

Boris, is there a reason this is not in your v4.16 pull request? If not,
could you take that fix?

Thank you
-- 
Florian
