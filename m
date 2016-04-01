Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1am1X0-0000Hd-E9
 for linux-mtd@lists.infradead.org; Fri, 01 Apr 2016 16:02:43 +0000
Received: by mail-pa0-x22e.google.com with SMTP id td3so93798917pab.2
 for <linux-mtd@lists.infradead.org>; Fri, 01 Apr 2016 09:02:21 -0700 (PDT)
Date: Fri, 1 Apr 2016 09:02:18 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] mtd: nand: read (from DT) and store ECC algorithm
Message-ID: <20160401160218.GB117117@google.com>
References: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
 <1455300685-27009-2-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1455300685-27009-2-git-send-email-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 12, 2016 at 07:11:24PM +0100, Rafał Miłecki wrote:
> This will allow drivers handle ECC properly.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>

Acked-by: Brian Norris <computersforpeace@gmai.com>
