Received: from mail-pf0-x236.google.com ([2607:f8b0:400e:c00::236])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1f5y6n-0002Ba-To
 for linux-mtd@lists.infradead.org; Tue, 10 Apr 2018 18:35:39 +0000
Received: by mail-pf0-x236.google.com with SMTP id y66so8983097pfi.7
 for <linux-mtd@lists.infradead.org>; Tue, 10 Apr 2018 11:34:58 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1518092327-3827-1-git-send-email-andy.yan@rock-chips.com>
References: <1518091958-3672-1-git-send-email-andy.yan@rock-chips.com>
 <1518092327-3827-1-git-send-email-andy.yan@rock-chips.com>
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Date: Tue, 10 Apr 2018 15:34:57 -0300
Message-ID: <CAAEAJfCYm4Z20x8PdU3uHh_0BExTCAoOy5Aq=ZXWLJKaB1C9kQ@mail.gmail.com>
Subject: Re: [PATCH v8 2/3] mtd: spi-nor: add rockchip serial flash controller
 driver
To: Andy Yan <andy.yan@rock-chips.com>
Cc: Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mtd@lists.infradead.org,
 shawn.lin@rock-chips.com, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Andy,

Just a very minor nit.

On 8 February 2018 at 09:18, Andy Yan <andy.yan@rock-chips.com> wrote:
[..]
> +
> +static int get_if_type(struct rockchip_sfc *sfc, enum spi_nor_protocol proto)
> +{

I understand that this got copy-pasted from some other driver,
but please change this function name to something like
rockchip_sfc_get_if_type().

Thanks,
Eze
