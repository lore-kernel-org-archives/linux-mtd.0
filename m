Received: from mail-ie0-x236.google.com ([2607:f8b0:4001:c03::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UkxZO-00067t-EJ
 for linux-mtd@lists.infradead.org; Fri, 07 Jun 2013 14:23:11 +0000
Received: by mail-ie0-f182.google.com with SMTP id 9so10663553iec.41
 for <linux-mtd@lists.infradead.org>; Fri, 07 Jun 2013 07:22:48 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20130520123733.GB2904@localhost>
References: <1368530125-12959-1-git-send-email-elezegarcia@gmail.com>
 <20130520123733.GB2904@localhost>
Date: Fri, 7 Jun 2013 11:22:48 -0300
Message-ID: <CALF0-+W+4NCLimsP1E+aGNLEuE9GtThsm6dNE-iyeju5ixx8Rg@mail.gmail.com>
Subject: Re: [PATCH 0/5] mtd: nand: Fixes and improvements on pxa3xx
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Eric Miao <eric.y.miao@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>, Lei Wen <leiwen@marvell.com>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Maen Suleiman <maen@marvell.com>,
 linux-mtd@lists.infradead.org,
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

On Mon, May 20, 2013 at 9:37 AM, Ezequiel Garcia
<ezequiel.garcia@free-electrons.com> wrote:
> Hi,
>
> (adding Eric Miao in Cc)
>
> On Tue, May 14, 2013 at 08:15:20AM -0300, Ezequiel Garcia wrote:
>> The Armada 370 and Armada XP SoC include a NAND controller (NFCv2) that
>> is similar to the one in PXA SoC. Therefore, it should be possible to support
>> Armada NAND using pxa3xx-nand driver.
>>
>> While this effort is not ready yet, here is a set of patches that are needed
>> for such work.
>>
>> A small summary of the patches:
>>
>>   * 1/5 is a fix for a 2-year regression that removed DMA support.
>>
>>   * 2/5 and 3/5 are needed to build the driver on platforms other PXA.
>>
>>   * 4/5 and 5/5 add ONFI-compliant device detection and are needed
>>     to successfully probe newer flash devices.
>>
>
> Since this patch affects directly the PXA hardware, I'd like to have some
> response from PXA maintainers.
>
> Guys, could you take a look at this?
>

Ping?

-- 
    Ezequiel
