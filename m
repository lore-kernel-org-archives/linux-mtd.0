Received: from mail-wr0-x22a.google.com ([2a00:1450:400c:c0c::22a])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1drEkS-0001po-V1
 for linux-mtd@lists.infradead.org; Mon, 11 Sep 2017 02:46:59 +0000
Received: by mail-wr0-x22a.google.com with SMTP id v109so11823104wrc.1
 for <linux-mtd@lists.infradead.org>; Sun, 10 Sep 2017 19:46:35 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <31598b63-7080-5bae-5556-bee89169a7c8@gmail.com>
References: <1504252841-2445-1-git-send-email-bmeng.cn@gmail.com>
 <1504252841-2445-2-git-send-email-bmeng.cn@gmail.com>
 <31598b63-7080-5bae-5556-bee89169a7c8@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Mon, 11 Sep 2017 10:46:33 +0800
Message-ID: <CAEUhbmVKZwNFgBo4KewoutKkD+XZ4MySX0mNDdV6J5v+M3njOw@mail.gmail.com>
Subject: Re: [PATCH 01/10] spi-nor: intel-spi: Fix number of protected range
 registers for BYT/LPT
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>,
 David Woodhouse <dwmw2@infradead.org>,
 linux-mtd <linux-mtd@lists.infradead.org>,
 linux-kernel <linux-kernel@vger.kernel.org>, Stefan Roese <sr@denx.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Marek,

On Fri, Sep 1, 2017 at 5:52 PM, Marek Vasut <marek.vasut@gmail.com> wrote:
> On 09/01/2017 10:00 AM, Bin Meng wrote:
>> The number of protected range registers is not the same on BYT/LPT/
>> BXT. GPR0 only exists on Apollo Lake and its offset is reserved on
>> other platforms.
>>
>> Signed-off-by: Bin Meng <bmeng.cn@gmail.com>
>
> Can this use regmap ? What you're implementing here seems like regmap to me.

No. regmap does not apply here.

Regards,
Bin
