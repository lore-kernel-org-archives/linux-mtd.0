Received: from mail-vk0-x22d.google.com ([2607:f8b0:400c:c05::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b9sIe-0007n4-IB
 for linux-mtd@lists.infradead.org; Mon, 06 Jun 2016 11:02:29 +0000
Received: by mail-vk0-x22d.google.com with SMTP id e4so57592749vkb.1
 for <linux-mtd@lists.infradead.org>; Mon, 06 Jun 2016 04:02:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1606060742210.23377@lnxricardw1.se.axis.com>
References: <alpine.DEB.2.02.1606020944180.19416@lnxricardw1.se.axis.com>
 <20160602180059.11928d40@bbrezillon>
 <alpine.DEB.2.02.1606060742210.23377@lnxricardw1.se.axis.com>
Date: Mon, 6 Jun 2016 16:32:06 +0530
Message-ID: <CAB=aS0OZ493Smov2E41G1iChi9gEOV5j0Gf8=SS_CbhXZjmw5g@mail.gmail.com>
Subject: Re: [PATCH 0/4] mtd: nand: Add support for Evatronix NANDFLASH-CTRL
From: Kamlakant Patel <kamlakant.patel@broadcom.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 devicetree@vger.kernel.org,
 Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
 Linux mtd <linux-mtd@lists.infradead.org>,
 Benoit Cousson <bcousson@baylibre.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 6, 2016 at 11:17 AM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
>
> On Thu, 2 Jun 2016, Boris Brezillon wrote:
>
>> Hi Ricard,
>>
>> I was not in Cc of this series, so you're either developing an old
>> kernel version, or you didn't check the MAINTAINERS file (or didn't run
>> get_maintainer.pl on your series).
>
> The patch is intended to apply to the mtd l2 tree, and I did check
> MAINTAINERS, however, for whatever reason I failed to notice that the NAND
> flash subsystem has its own entry (going for the general MTD entry), so
> both you and Richard got left off the CC list. Sorry about that. I'll
> rectify it on subsequent patch submissions.
>
>> And please, next time make sure patches 1 to X are sent in replies to
>> your cover letter.
>
> Ok. Will do.
>
>> I'll to review the driver soon.
>
> Much appreciated.

Hi Ricard,

I am using the previous version of your patch on Netlogic XLP MIPS64
platform with some cleanups, some of them are mentioned by Borris.
I can send you the patch if you would like to integrate it.

Thanks,
 Kamlakant Patel
