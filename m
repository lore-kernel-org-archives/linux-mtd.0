Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzrDb-0000xY-NU
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 19:19:36 +0000
Received: by wmww144 with SMTP id w144so33497658wmw.0
 for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2015 11:19:14 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CY1PR0301MB0780A9588AA9348DCEA4823F8B290@CY1PR0301MB0780.namprd03.prod.outlook.com>
References: <cover.1439543572.git.hramrach@gmail.com>
 <1592668a061137b33c9a6392dfccc67c69fc1fe6.1439543572.git.hramrach@gmail.com>
 <CAPcvp5HB7m47ZTqQ0fE7EV42kNWO=i1EQaysNtgXw6V+oWoUdA@mail.gmail.com>
 <CAOMqctQOU91hbt+2O0qQe3tjMn=3pSYE8E4xPpeS3iGG2A5h8w@mail.gmail.com>
 <CY1PR0301MB0780A9588AA9348DCEA4823F8B290@CY1PR0301MB0780.namprd03.prod.outlook.com>
From: Michal Suchanek <hramrach@gmail.com>
Date: Fri, 20 Nov 2015 20:18:34 +0100
Message-ID: <CAOMqctRYGjhSeKtDQ3JuRV3Dvom3qW=tLxSOJmPF8r7gF93JiQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] mtd: spi-nor: add read loop
To: Hou Zhiqiang <B48286@freescale.com>
Cc: Andrew Murray <amurray@embedded-bits.co.uk>,
 Huang Shijie <shijie.huang@intel.com>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Xu Han <han.xu@freescale.com>, "Rafa? Mi?ecki" <zajec5@gmail.com>,
 Huang Shijie <b32955@freescale.com>, Ben Hutchings <ben@decadent.org.uk>,
 Marek Vasut <marex@denx.de>, Gabor Juhos <juhosg@openwrt.org>,
 =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMLA==?= <beanhuo@micron.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On 5 November 2015 at 04:39, Hou Zhiqiang <B48286@freescale.com> wrote:
> Hi Michal,
>
> Does this have any updates?

I will try to update this patchset when it's agreed how the limit on
transfer size is handled. Writing less data than was requested is
acceptable for spi-nor but might disrupt other drivers so perhaps some
preemptive mechanism with the SPI master saying how much data it can
transfer and the drivers looking at that value would be preferred.

Thanks

Michal
