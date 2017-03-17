Received: from mail-lf0-x22b.google.com ([2a00:1450:4010:c07::22b])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1copDd-0008T2-Qw
 for linux-mtd@lists.infradead.org; Fri, 17 Mar 2017 10:34:51 +0000
Received: by mail-lf0-x22b.google.com with SMTP id j90so31358748lfk.2
 for <linux-mtd@lists.infradead.org>; Fri, 17 Mar 2017 03:34:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <da605583-7d98-186a-b42e-1417d8217cd1@gmail.com>
References: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
 <da605583-7d98-186a-b42e-1417d8217cd1@gmail.com>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Fri, 17 Mar 2017 18:34:26 +0800
Message-ID: <CAAyFORJs00VPqLQ5djFgg142Yfy1MrZjDPF0LQx=bnkzDFN7uA@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Introduction to SPI NAND framework
To: Arnaud Mouiche <arnaud.mouiche@gmail.com>
Cc: Peter Pan <peterpandong@micron.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 "linshunquan (A)" <linshunquan1@hisilicon.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Arnaud,

First of all, thanks a lot for your effort to test the patches.

On Fri, Mar 17, 2017 at 6:02 PM, Arnaud Mouiche
<arnaud.mouiche@gmail.com> wrote:
> Hi All,
>
> Do some test on MT29F1G01AAADD.
> Finally, I don't have MT29F1G01AAADD spares
> (Peter, If you have 1 or 2 MT29F1G01AAADD samples to send to me, I would be
> pleased).

Unfortunately, I don't have extra MT29F1G01AAADD on my hand, but I will ask
my college to send you some if sample is available. Could you send me
the ship info
please?

>
> MT29Fn1G01AAADD are little different. They have 64bytes oob and ecc layout
> is different. But all the rest should be the nearly same.

Yes, the only difference is oob size, ecc layout and ecc strength as
far as I can see.

> I did some change to support this device, and I'm now locked in the bad
> block scan, as for some reasons, the scan tries to read all pages from all
> blocks...

Actually I met the same issue when testing v3. And I should fix it once.
Maybe I lost some code when making patches, I didn't use an empty chip
for testing
before sending patches out, so BBT scan could be broken. I'm sorry for
missing this part...
I will check it next Monday.


Thanks,
Peter Pan
