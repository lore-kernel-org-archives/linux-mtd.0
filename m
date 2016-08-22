Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bbjjF-0007J8-Gh
 for linux-mtd@lists.infradead.org; Mon, 22 Aug 2016 07:33:06 +0000
Message-ID: <1471850841.15722.13.camel@gmail.com>
Subject: Re: MTD RAID
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Dongsheng Yang <dongsheng.yang@easystack.cn>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
Cc: starvik@axis.com, jesper.nilsson@axis.com, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>, shengyong1@huawei.com,
 linux-cris-kernel@axis.com,  Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, Ard Biesheuvel
 <ard.biesheuvel@linaro.org>, dooooongsheng.yang@gmail.com,
 jschultz@xes-inc.com,  fabf@skynet.be, mtownsend1973@gmail.com,
 linux-mtd@lists.infradead.org, Colin King <colin.king@canonical.com>,
 asierra@xes-inc.com, dmitry.torokhov@gmail.com,  Dongsheng Yang
 <dongsheng081251@gmail.com>, David Woodhouse <dwmw2@infradead.org>
Date: Mon, 22 Aug 2016 10:27:21 +0300
In-Reply-To: <57BA6FFA.6000601@easystack.cn>
References: <57B6E1BD.1060707@easystack.cn>
 <AL*AZwAyAecQSM1UjjjNxao0.3.1471605640762.Hmail.dongsheng.yang@easystack.cn>
 <20160819135536.1ed9e374@bbrezillon> <57BA6FFA.6000601@easystack.cn>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2016-08-22 at 11:22 +0800, Dongsheng Yang wrote:
> As I explained above, MTD RAID is not just a solution for reliability
> problem for MLC/TLC. 

Could you please answer these questions.

1. Does MTD raid work on MLC or is it SLC-only?

2. If I am building RAID-0, I have 2 flash chips, one has every even
block bad, the other has every odd block bad. What happens?

3. Same question, but for RAID-1.

4. Suppose I have RAID-1 like in this picture:

https://en.wikipedia.org/wiki/Standard_RAID_levels#/media/File:RAID_1.svg

Just assume we have flash chips, not disks, and eraseblocks, not
sectors.

Suppose eraseblock A1 goes bad. What happens next?


5. Suppose I have RAID-0 like here:

https://en.wikipedia.org/wiki/Standard_RAID_levels#/media/File:RAID_0.svg

Again, we are talking about chips and eraseblocks here.

What happens if A1 goes bad.

Thanks!
