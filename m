Received: from mailout1.samsung.com ([203.254.224.24])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VwQJU-0003aG-L4
 for linux-mtd@lists.infradead.org; Fri, 27 Dec 2013 05:50:27 +0000
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout1.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MYG000W5AV6BZ50@mailout1.samsung.com> for
 linux-mtd@lists.infradead.org; Fri, 27 Dec 2013 14:49:54 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <008201cf01e6$6b894da0$429be8e0$%han@samsung.com>
 <008f01cf01e8$21a7a8b0$64f6fa10$%han@samsung.com>
 <CAOesGMhV5QFfJ4OY3TGfLJ0AwOyqRid2iW9Gh6EhYQ3KL-0mkQ@mail.gmail.com>
In-reply-to: <CAOesGMhV5QFfJ4OY3TGfLJ0AwOyqRid2iW9Gh6EhYQ3KL-0mkQ@mail.gmail.com>
Subject: Re: [PATCH 13/23] mtd: pasemi_nand: Remove unnecessary OOM messages
Date: Fri, 27 Dec 2013 14:49:54 +0900
Message-id: <000201cf02c7$777a87a0$666f96e0$%han@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: 'Olof Johansson' <olof@lixom.net>, linux-mtd@lists.infradead.org,
 'Jingoo Han' <jg1.han@samsung.com>, 'David Woodhouse' <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Friday, December 27, 2013 2:43 PM, Olof Johansson wrote:
> On Wed, Dec 25, 2013 at 7:11 PM, Jingoo Han <jg1.han@samsung.com> wrote:
> > The site-specific OOM messages are unnecessary, because they
> > duplicate the MM subsystem generic OOM message.
> >
> > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> 
> Actually -- the pasemi platform is barely used these days, and the
> users I am aware of do not use the nand driver. I think we'd just fine
> with removing it. I'll submit a patch to do so instead.

Brian Norris,

Please ignore this patch, because the pasemi nand driver will
be removed by Olof Johansson. Thank you.

Best regards,
Jingoo Han
