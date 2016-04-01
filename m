Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by casper.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1am1Wb-00067t-3D
 for linux-mtd@lists.infradead.org; Fri, 01 Apr 2016 16:02:18 +0000
Received: by mail-pa0-x231.google.com with SMTP id fe3so94207404pab.1
 for <linux-mtd@lists.infradead.org>; Fri, 01 Apr 2016 09:01:56 -0700 (PDT)
Date: Fri, 1 Apr 2016 09:01:51 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, Hauke Mehrtens <hauke@hauke-m.de>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Frank Rowand <frowand.list@gmail.com>,
 Grant Likely <grant.likely@linaro.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] of: mtd: add helper reading "nand-ecc-algo" from DT
Message-ID: <20160401160151.GA117117@google.com>
References: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1455300685-27009-1-git-send-email-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Feb 12, 2016 at 07:11:23PM +0100, Rafał Miłecki wrote:
> This allows specifying algorithm used for NAND ECC. There are two
> available values: "bch" and "hamming". It's important as having just
> ECC parameters (step, strength) isn't enough to determine algorithm,
> e.g. you can't distinct BCH-1 and Hamming.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>

Acked-by: Brian Norris <computersforpeace@gmai.com>
