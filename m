Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YpDhC-0001r3-K4
 for linux-mtd@lists.infradead.org; Mon, 04 May 2015 10:33:55 +0000
Received: by wizk4 with SMTP id k4so116275964wiz.1
 for <linux-mtd@lists.infradead.org>; Mon, 04 May 2015 03:33:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <jwv4mnwfppf.fsf-monnier+gmane.comp.hardware.netbook.arm.sunxi@gnu.org>
References: <cover.1430403750.git.hramrach@gmail.com>
 <jwv4mnwfppf.fsf-monnier+gmane.comp.hardware.netbook.arm.sunxi@gnu.org>
From: Michal Suchanek <hramrach@gmail.com>
Date: Mon, 4 May 2015 12:32:51 +0200
Message-ID: <CAOMqctT42f0RuShMb5BU_4Qun-qouS3HCj7_=8-oEY9h-zVimg@mail.gmail.com>
Subject: Re: [linux-sunxi] Re: [PATCH 0/3] Using SPI NOR flah on sunxi.
To: monnier@iro.umontreal.ca
Content-Type: text/plain; charset=UTF-8
Cc: devicetree <devicetree@vger.kernel.org>,
 linux-sunxi <linux-sunxi@googlegroups.com>, linux-mtd@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On 1 May 2015 at 14:27, Stefan Monnier <monnier@iro.umontreal.ca> wrote:
>> The SPI driver returns an error when more than 64 bytes are
>> transferred at once due to lack of DMA support.
>
> Have you tried the dmaengine patch and make the SPI driver use it?
>

The dmaengine is already merged or queued in sunxi-wip but the SPI
glue fell through the cracks. I found it after digging through the
archives so I will see if it works for me.

Thanks

Michal
