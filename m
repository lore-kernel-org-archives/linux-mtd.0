Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xv0No-00034D-6a
 for linux-mtd@lists.infradead.org; Sun, 30 Nov 2014 09:01:32 +0000
Received: by mail-pa0-f42.google.com with SMTP id et14so9192314pad.1
 for <linux-mtd@lists.infradead.org>; Sun, 30 Nov 2014 01:01:10 -0800 (PST)
Date: Sun, 30 Nov 2014 01:01:06 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Zhou Wang <wangzhou.bry@gmail.com>
Subject: Re: [PATCH v4 2/2] mtd: hisilicon: add device tree binding
 documentation
Message-ID: <20141130090106.GF3608@norris-Latitude-E6410>
References: <1415105221-7732-1-git-send-email-wangzhou.bry@gmail.com>
 <1415105221-7732-3-git-send-email-wangzhou.bry@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1415105221-7732-3-git-send-email-wangzhou.bry@gmail.com>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, pawel.moll@arm.com,
 ijc+devicetree@hellion.org.uk, linux-kernel@vger.kernel.org,
 haojian.zhuang@gmail.com, wangzhou1@hisilicon.com, robh+dt@kernel.org,
 linux-mtd@lists.infradead.org, xuwei5@hisilicon.com, galak@codeaurora.org,
 caizhiyong@huawei.com, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

One more thing:

On Tue, Nov 04, 2014 at 08:47:01PM +0800, Zhou Wang wrote:
> diff --git a/Documentation/devicetree/bindings/mtd/hisi504-nand.txt b/Documentation/devicetree/bindings/mtd/hisi504-nand.txt
> new file mode 100644
> index 0000000..c8b3988
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mtd/hisi504-nand.txt
> @@ -0,0 +1,40 @@
> +Hisilicon Hip04 Soc NAND controller DT binding
> +
> +Required properties:
> +- compatible:          Should be "hisilicon,504-nfc".

I notice you use "NFC" naming throughout. I know others have had
complaints about overloading the acronym NFC which sometimes means "Near
Field Communication", instead of the intended "NAND Flash Controller."
Is there any kind of naming convention within Hisilicon documentation
that insists on calling this NFC, or can we avoid that confusing name?

If possible, I'd suggest "hisilicon,504-nand" as an alternative.

Brian
