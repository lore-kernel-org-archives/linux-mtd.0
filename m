Received: from mail-oi0-x22b.google.com ([2607:f8b0:4003:c06::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aRL90-00043l-OB
 for linux-mtd@lists.infradead.org; Thu, 04 Feb 2016 14:45:12 +0000
Received: by mail-oi0-x22b.google.com with SMTP id w5so16404463oie.1
 for <linux-mtd@lists.infradead.org>; Thu, 04 Feb 2016 06:44:05 -0800 (PST)
MIME-Version: 1.0
Sender: romain.izard@mobile-devices.fr
In-Reply-To: <20160204143340.1ffa2292@bbrezillon>
References: <1454322360-8666-1-git-send-email-romain.izard.pro@gmail.com>
 <20160204143340.1ffa2292@bbrezillon>
From: Romain Izard <romain.izard.pro@gmail.com>
Date: Thu, 4 Feb 2016 15:43:45 +0100
Message-ID: <CAGkQfmMVeM+xHqP=2izZ5Xufu+8R=Q_BTwUpXnhOz4o6LV4JQw@mail.gmail.com>
Subject: Re: [PATCH v3 0/5] mtd: atmel_nand: Add support for NAND Flash on
 SAMA5D2
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 Josh Wu <rainyfeeling@outlook.com>, Nicolas Ferre <nicolas.ferre@atmel.com>,
 Yang Wenyou <Wenyou.Yang@atmel.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris,

2016-02-04 14:33 GMT+01:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> Hi Romain,
>
> Just a remark that is not directly related to your work: when people
> take the time to review your work, try to keep them in Cc of the
> following versions of your patchset.
>
OK. I'll keep it in mind for my next submission.

> On Mon,  1 Feb 2016 11:25:55 +0100
> Romain Izard <romain.izard.pro@gmail.com> wrote:
>
>> The NAND Flash controller for SAMA5D2 has small differences that make it
>> impossible to use the existing driver for SAMA5D3. This patchset uses the
>> device tree's compatible string to get those differences, and the code is
>> slightly modified to handle them.
>>
>> Base on linux-mtd-next, commit 15c0be7bec002f9a529dd0966d0db96dde176fd0
>>
>> See previous revisions to apply on the Atmel Linux 4.1 branch.
>>
>> Compile tested for sama5_defconfig, and tested on SAMA5D3xek as there is no
>> existing SAMA5D2 board with NAND Flash memory (yet).
>
> Overall, it looks good to me (even if I don't fully agree on how you
> decided to define NFC_SR_RB_EDGEX values :-P, but that's just a
> nitpick).
>
> Reviewed-by: Boris Brezillon <boris.brezillon@free-electrons.com>
>

Thanks for your review.

Best regards,
-- 
Romain Izard
