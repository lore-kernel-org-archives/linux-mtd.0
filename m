Received: from mail-ie0-x229.google.com ([2607:f8b0:4001:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9Gfu-000262-SB
 for linux-mtd@lists.infradead.org; Thu, 08 Jan 2015 17:15:11 +0000
Received: by mail-ie0-f169.google.com with SMTP id y20so10594840ier.0
 for <linux-mtd@lists.infradead.org>; Thu, 08 Jan 2015 09:14:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.02.1501080927090.27318@lnxricardw1.se.axis.com>
References: <CALupW3DF2BmHBjm11yiBMLFSwX-yNFeW3q_EDyEWsBQrFPU-xw@mail.gmail.com>
 <alpine.DEB.2.02.1501080927090.27318@lnxricardw1.se.axis.com>
Date: Thu, 8 Jan 2015 09:14:48 -0800
Message-ID: <CALupW3CLU67LZiKMO3wixgWMV6bigv20YxF7-YeJHW-ZRLqgZg@mail.gmail.com>
Subject: Re: NAND ECC capabilities
From: Steve deRosier <derosier@gmail.com>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ricard,



On Thu, Jan 8, 2015 at 12:32 AM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
>
> I'd say yes, but the ECC threshold should be per 512 byte ECC block (which
> seems to be the correct term rather than 'sector'), rather than per page.
> Are you sure that the threshold is set to 4 (see
> /sys/devices/virtual/mtd/mtd<n>/bitflip_threshold )?
>

Yep, bitflip_threashold is set to 4.  I'm thinking of changing it to 3
anyway as you suggested.

Actually I'm beginning of thinking about changing it to 1024 size
sectors, with 12-bit /sector correction and setting the threshold at
10.  The problem there is upgrading devices already out in the wild,
that doesn't sound like an easy process in our particular case. Maybe
later when I have my head wrapped around the problem a bit I'll ask a
question on that.

Thanks,
- Steve


PS sorry about the typo of your name in my response to Jeff.  My
fingers flew over the "h" automatically and I hit send before I
noticed.
