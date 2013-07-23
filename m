Received: from mail-vc0-x22a.google.com ([2607:f8b0:400c:c03::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V1h1s-00037a-8p
 for linux-mtd@lists.infradead.org; Tue, 23 Jul 2013 18:09:45 +0000
Received: by mail-vc0-f170.google.com with SMTP id hv10so3317518vcb.29
 for <linux-mtd@lists.infradead.org>; Tue, 23 Jul 2013 11:09:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1374602524-3398-12-git-send-email-wsa@the-dreams.de>
References: <1374602524-3398-1-git-send-email-wsa@the-dreams.de>
 <1374602524-3398-12-git-send-email-wsa@the-dreams.de>
Date: Tue, 23 Jul 2013 15:09:20 -0300
Message-ID: <CAOMZO5DxOOaMudN8UY6gWmMqpHQ78e6++Soqi=VTB45_aNOZ1Q@mail.gmail.com>
Subject: Re: [PATCH 11/27] drivers/mtd/nand: don't check resource with
 devm_ioremap_resource
From: Fabio Estevam <festevam@gmail.com>
To: Wolfram Sang <wsa@the-dreams.de>
Content-Type: text/plain; charset=UTF-8
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 23, 2013 at 3:01 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
> devm_ioremap_resource does sanity checks on the given resource. No need to
> duplicate this in the driver.
>
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

I have already submitted such change:
http://patchwork.ozlabs.org/patch/260537/
