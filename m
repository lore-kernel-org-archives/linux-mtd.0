Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bah4y-0000oX-GS
 for linux-mtd@lists.infradead.org; Fri, 19 Aug 2016 10:31:13 +0000
Message-ID: <1471602645.2662.10.camel@gmail.com>
Subject: Re: MTD RAID
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>, Dongsheng Yang
 <dongsheng.yang@easystack.cn>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
Cc: starvik@axis.com, jesper.nilsson@axis.com, Dongsheng Yang
 <yangds.fnst@cn.fujitsu.com>, linux-cris-kernel@axis.com,
 shengyong1@huawei.com,  Ard Biesheuvel <ard.biesheuvel@linaro.org>, David
 Woodhouse <dwmw2@infradead.org>, dmitry.torokhov@gmail.com,
 dooooongsheng.yang@gmail.com, jschultz@xes-inc.com, fabf@skynet.be,
 mtownsend1973@gmail.com, linux-mtd@lists.infradead.org, Colin King
 <colin.king@canonical.com>, asierra@xes-inc.com, Brian Norris
 <computersforpeace@gmail.com>, Dongsheng Yang <dongsheng081251@gmail.com>
Date: Fri, 19 Aug 2016 13:30:45 +0300
In-Reply-To: <a89263d4-9748-9437-e11d-62b5a6a54b7c@nod.at>
References: <CA+qeAOpuZ0CXZP8tCWdhoVvTEKAw26gtz63-UJmQ4XLSXAd=Yg@mail.gmail.com>
 <20160819084908.4955c629@bbrezillon> <57B6B073.9060404@easystack.cn>
 <20160819102016.0640b6d5@bbrezillon> <57B6CC7B.1060208@easystack.cn>
 <a89263d4-9748-9437-e11d-62b5a6a54b7c@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2016-08-19 at 11:47 +0200, Richard Weinberger wrote:
> So, what you propose as MTD RAID is not really RAID.
> RAID is about redundant disks. i.e. you can replace them upon
> failure.
> The problem you address is combining multiple chips.
> IOW an SSD emulated in software.

I think this should either be a very close analog of RAID or the word
"RAID" should not be used at all. Everyone will be confused otherwise.
