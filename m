Received: from mail-pd0-x22c.google.com ([2607:f8b0:400e:c02::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XUVAM-00064k-Id
 for linux-mtd@lists.infradead.org; Thu, 18 Sep 2014 06:26:06 +0000
Received: by mail-pd0-f172.google.com with SMTP id v10so750324pde.3
 for <linux-mtd@lists.infradead.org>; Wed, 17 Sep 2014 23:25:45 -0700 (PDT)
Date: Wed, 17 Sep 2014 23:25:41 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH 1/4] mtd: bcm47xxnflash: fix typo in freq calculation
Message-ID: <20140918062541.GH7362@norris-Latitude-E6410>
References: <1408432456-27280-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1408432456-27280-1-git-send-email-zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Aug 19, 2014 at 09:14:13AM +0200, Rafał Miłecki wrote:
> We are supposed to mask value, not multiply it. Add some comments btw.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>

Pushed all 4 to l2-mtd.git. Thanks!

Brian
