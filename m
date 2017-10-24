Received: from mail-oi0-x235.google.com ([2607:f8b0:4003:c06::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e6w3V-0005My-3m
 for linux-mtd@lists.infradead.org; Tue, 24 Oct 2017 10:03:30 +0000
Received: by mail-oi0-x235.google.com with SMTP id q4so35784494oic.7
 for <linux-mtd@lists.infradead.org>; Tue, 24 Oct 2017 03:03:08 -0700 (PDT)
MIME-Version: 1.0
Sender: arndbergmann@gmail.com
In-Reply-To: <1508830853-4924-1-git-send-email-bmeng.cn@gmail.com>
References: <1508830853-4924-1-git-send-email-bmeng.cn@gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 24 Oct 2017 12:03:07 +0200
Message-ID: <CAK8P3a2g=efOe+ysEjB1Lrq2FJvUDMymDz7X15WpHmTd2My09Q@mail.gmail.com>
Subject: Re: [PATCH] spi-nor: intel-spi: Remove EXPERT dependency
To: Bin Meng <bmeng.cn@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Stefan Roese <sr@denx.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 24, 2017 at 9:40 AM, Bin Meng <bmeng.cn@gmail.com> wrote:
> The idea to have the intel-spi driver dependent on EXPERT was exactly
> because we did not want ordinary users playing with the device and
> inadvertently overwrite their BIOSes (if it is not protected). This
> seems to be superfluous hence remove it.
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>

Acked-by: Arnd Bergmann <arnd@arndb.de>

Thansk for cleaning this up!
