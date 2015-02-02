Received: from mail-vc0-x230.google.com ([2607:f8b0:400c:c03::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YIMVo-0006Jb-JL
 for linux-mtd@lists.infradead.org; Mon, 02 Feb 2015 19:18:21 +0000
Received: by mail-vc0-f176.google.com with SMTP id kv7so15334033vcb.7
 for <linux-mtd@lists.infradead.org>; Mon, 02 Feb 2015 11:17:58 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1422894152-29362-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1422894152-29362-1-git-send-email-ricardo.ribalda@gmail.com>
Date: Mon, 2 Feb 2015 20:17:58 +0100
Message-ID: <CAFLxGvzdAFUFU2=ySRMdtAk=7hKvuHixrvPX0X+T533VPu=4dg@mail.gmail.com>
Subject: Re: [PATCH] mtd: Expose partition offset to the drivers
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 2, 2015 at 5:22 PM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Currently, there is no way to find out the offset of an mtd partition by
> a driver. This might be needed by external hardware.
>
> For example, a flash containing the firmware of an external device that
> is also accessible by the main cpu/kernel.
>
> The flash is big enough to have two partitions with 2 versions of the
> firmware, so we can have a safe upgrade.
>
> Once the flash has been updated we need the real offset, so we can write
> it on the external device registers.

Can you please also send a patch which shows the usage of this new function
by a driver?

-- 
Thanks,
//richard
