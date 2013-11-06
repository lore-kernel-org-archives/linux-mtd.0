Received: from mail-vc0-x22f.google.com ([2607:f8b0:400c:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ve8T4-0000yc-O5
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2013 19:08:43 +0000
Received: by mail-vc0-f175.google.com with SMTP id ht10so6892129vcb.20
 for <linux-mtd@lists.infradead.org>; Wed, 06 Nov 2013 11:08:19 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE-qtxmBjrS2aGUzSirOJE7S4uHzqjXcKL+NhthPRM-2Wg@mail.gmail.com>
References: <1383758172-29798-1-git-send-email-festevam@gmail.com>
 <1383758172-29798-2-git-send-email-festevam@gmail.com>
 <CAN8TOE8GZyL6T7XdFyPrNozT2hAXawUqmVFRBX=xgYyHu4fS-Q@mail.gmail.com>
 <CAOMZO5AsQELFqmRO95GACR90XurovYW8LHUtKfHaiqEhxWnSSw@mail.gmail.com>
 <CAN8TOE-qtxmBjrS2aGUzSirOJE7S4uHzqjXcKL+NhthPRM-2Wg@mail.gmail.com>
Date: Wed, 6 Nov 2013 17:08:16 -0200
Message-ID: <CAOMZO5C8YLFjzc-wbdTZ4OJ-Sdiyu+hpH8qcAHjT+TEuKyoAXw@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: gpmi: Revert "mtd: gpmi: remove the nand_scan()"
From: Fabio Estevam <festevam@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>,
 Fabio Estevam <fabio.estevam@freescale.com>, stable@vger.kernel.org,
 Huang Shijie <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Brian,

On Wed, Nov 6, 2013 at 4:58 PM, Brian Norris
<computersforpeace@gmail.com> wrote:

>> No private communication. I reported this issue in the mailing list:
>> http://lists.infradead.org/pipermail/linux-mtd/2013-November/049641.html
>
> Right. But this ended with you pointing Huang to the right U-boot
> setup, then everything went silent. And today, I get a blunt revert
> request from you as well as an independent DMA fix from Huang. Since
> you guys are both from Freescale, I wasn't sure if there was any
> coordination/correlation, or if this is really as uncoordinated as it
> looks.

Sorry for the confusion.

The DMA fix Huang sent today is unrelated to this mx23 kernel crash on boot.

Regards,

Fabio Estevam
