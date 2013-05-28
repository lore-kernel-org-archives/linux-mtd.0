Received: from mailout2.samsung.com ([203.254.224.25])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Uh8IQ-0001CY-LD
 for linux-mtd@lists.infradead.org; Tue, 28 May 2013 01:01:52 +0000
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout2.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0MNH00JZJHGZV140@mailout2.samsung.com> for
 linux-mtd@lists.infradead.org; Tue, 28 May 2013 10:01:25 +0900 (KST)
From: Jingoo Han <jg1.han@samsung.com>
To: 'Brian Norris' <computersforpeace@gmail.com>
References: <002b01ce57a0$a29c4fe0$e7d4efa0$@samsung.com>
 <CAN8TOE9VhtQZWGHtHp6kMpXE-0qWHLKRmA40y88OKwcWrCxSHw@mail.gmail.com>
In-reply-to: <CAN8TOE9VhtQZWGHtHp6kMpXE-0qWHLKRmA40y88OKwcWrCxSHw@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: use platform_{get,set}_drvdata()
Date: Tue, 28 May 2013 10:01:24 +0900
Message-id: <000101ce5b3e$dff098f0$9fd1cad0$@samsung.com>
MIME-version: 1.0
Content-type: text/plain; charset=us-ascii
Content-transfer-encoding: 7bit
Content-language: ko
Cc: linux-mtd@lists.infradead.org, Jingoo Han <jg1.han@samsung.com>,
 'David Woodhouse' <dwmw2@infradead.org>,
 'Artem Bityutskiy' <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday, May 28, 2013 4:12 AM, Brian Norris wrote:
> 
> On Thu, May 23, 2013 at 3:31 AM, Jingoo Han <jg1.han@samsung.com> wrote:
> > Use the wrapper functions for getting and setting the driver data using
> > platform_device instead of using dev_{get,set}_drvdata() with &pdev->dev,
> > so we can directly pass a struct platform_device.
> 
> This patch also removes a "dev_set_drvdata(dev, NULL)". Is this no
> longer necessary during device removal? Otherwise:

Hi Brian,

The "dev_set_drvdata(dev, NULL)" is unnecessary, because
the driver core clears the driver data to NULL after device_release
or on probe failure.

Best regards,
Jingoo Han

> 
> Acked-by: Brian Norris <computersforpeace@gmail.com>
> 
> > Signed-off-by: Jingoo Han <jg1.han@samsung.com>
> > ---
