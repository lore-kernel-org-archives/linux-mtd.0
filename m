Received: from down.free-electrons.com ([37.187.137.238]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1badcc-0008D3-N4
 for linux-mtd@lists.infradead.org; Fri, 19 Aug 2016 06:49:43 +0000
Date: Fri, 19 Aug 2016 08:49:08 +0200
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Dongsheng Yang <dongsheng081251@gmail.com>
Cc: linux-mtd@lists.infradead.org, dmitry.torokhov@gmail.com, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>, shengyong1@huawei.com, starvik@axis.com,
 richard <richard@nod.at>, linux-cris-kernel@axis.com, Colin King
 <colin.king@canonical.com>, jschultz@xes-inc.com, Ard Biesheuvel
 <ard.biesheuvel@linaro.org>, David Woodhouse <dwmw2@infradead.org>,
 asierra@xes-inc.com, jesper.nilsson@axis.com, fabf@skynet.be,
 dooooongsheng.yang@gmail.com, Brian Norris <computersforpeace@gmail.com>,
 mtownsend1973@gmail.com
Subject: Re: MTD RAID
Message-ID: <20160819084908.4955c629@bbrezillon>
In-Reply-To: <CA+qeAOpuZ0CXZP8tCWdhoVvTEKAw26gtz63-UJmQ4XLSXAd=Yg@mail.gmail.com>
References: <CA+qeAOpuZ0CXZP8tCWdhoVvTEKAw26gtz63-UJmQ4XLSXAd=Yg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Dongsheng,

On Fri, 19 Aug 2016 14:34:54 +0800
Dongsheng Yang <dongsheng081251@gmail.com> wrote:

> Hi guys,
>     This is a email about MTD RAID.
> 
> *Code:*
>     kernel:
> https://github.com/yangdongsheng/linux/tree/mtd_raid_v2-for-4.7

Just had a quick look at the code, and I see at least one major problem
in your RAID-1 implementation: you're ignoring the fact that NAND blocks
can be or become bad. What's the plan for that?

Regards,

Boris
