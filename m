Received: from mail-ee0-x22a.google.com ([2a00:1450:4013:c00::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UlF1E-00017U-M6
 for linux-mtd@lists.infradead.org; Sat, 08 Jun 2013 09:01:06 +0000
Received: by mail-ee0-f42.google.com with SMTP id c4so2022938eek.15
 for <linux-mtd@lists.infradead.org>; Sat, 08 Jun 2013 02:00:41 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN1soZxnG6oVpNT6dJ6WOAuLB5_JxTM6vrx-8j8qm-t1ZK8jFA@mail.gmail.com>
References: <1368530125-12959-1-git-send-email-elezegarcia@gmail.com>
 <20130520123733.GB2904@localhost>
 <CALF0-+W+4NCLimsP1E+aGNLEuE9GtThsm6dNE-iyeju5ixx8Rg@mail.gmail.com>
 <CAN1soZxnG6oVpNT6dJ6WOAuLB5_JxTM6vrx-8j8qm-t1ZK8jFA@mail.gmail.com>
Date: Sat, 8 Jun 2013 17:00:41 +0800
Message-ID: <CAN1soZwRqapXrT6REk_h3gy0Tus9pypUvrDYg=-eyv-FntOZUA@mail.gmail.com>
Subject: Re: [PATCH 0/5] mtd: nand: Fixes and improvements on pxa3xx
From: Haojian Zhuang <haojian.zhuang@gmail.com>
To: Ezequiel Garcia <elezegarcia@gmail.com>, Daniel Mack <zonque@gmail.com>,
 Igor Grinberg <grinberg@compulab.co.il>,
 Vasut Marek <marek.vasut@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Eric Miao <eric.y.miao@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Lei Wen <leiwen@marvell.com>,
 Maen Suleiman <maen@marvell.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Neil Zhang <zhangwm@marvell.com>, Chao Xie <cxie4@marvell.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, Jun 8, 2013 at 3:22 PM, Haojian Zhuang <haojian.zhuang@gmail.com> wrote:
> On Fri, Jun 7, 2013 at 10:22 PM, Ezequiel Garcia <elezegarcia@gmail.com> wrote:
>> On Mon, May 20, 2013 at 9:37 AM, Ezequiel Garcia
>> <ezequiel.garcia@free-electrons.com> wrote:
>>> Hi,
>>>
>>> (adding Eric Miao in Cc)
>>>
>>> On Tue, May 14, 2013 at 08:15:20AM -0300, Ezequiel Garcia wrote:
>>>> The Armada 370 and Armada XP SoC include a NAND controller (NFCv2) that
>>>> is similar to the one in PXA SoC. Therefore, it should be possible to support
>>>> Armada NAND using pxa3xx-nand driver.
>>>>
>>>> While this effort is not ready yet, here is a set of patches that are needed
>>>> for such work.
>>>>
>>>> A small summary of the patches:
>>>>
>>>>   * 1/5 is a fix for a 2-year regression that removed DMA support.
>>>>
>>>>   * 2/5 and 3/5 are needed to build the driver on platforms other PXA.
>>>>
>>>>   * 4/5 and 5/5 add ONFI-compliant device detection and are needed
>>>>     to successfully probe newer flash devices.
>>>>
>>>
>>> Since this patch affects directly the PXA hardware, I'd like to have some
>>> response from PXA maintainers.
>>>
>>> Guys, could you take a look at this?
>>>
>>
>> Ping?
>>
>> --
>>     Ezequiel
>
> Hi Ezequiel,
>
> As I didn't have the test environment, I looped some Marvell guys. But
> they didn't
> have any time on test it.
>
> So let's loop Marek, Daniel & Igor. I hope that we could help us.
>
> By the way, my zylonite pxa310 fails on running uboot. I can't fix it right now.
>
> Regards
> Haojian

I'm OK on these patches.

Reviewed-by: Haojian Zhuang <haojian.zhuang@gmail.com>
