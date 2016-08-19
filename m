Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bagPa-0001No-3d
 for linux-mtd@lists.infradead.org; Fri, 19 Aug 2016 09:48:27 +0000
Subject: Re: MTD RAID
To: Dongsheng Yang <dongsheng.yang@easystack.cn>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
References: <CA+qeAOpuZ0CXZP8tCWdhoVvTEKAw26gtz63-UJmQ4XLSXAd=Yg@mail.gmail.com>
 <20160819084908.4955c629@bbrezillon> <57B6B073.9060404@easystack.cn>
 <20160819102016.0640b6d5@bbrezillon> <57B6CC7B.1060208@easystack.cn>
Cc: Dongsheng Yang <dongsheng081251@gmail.com>, fabf@skynet.be,
 jesper.nilsson@axis.com, Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 linux-cris-kernel@axis.com, shengyong1@huawei.com,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, dmitry.torokhov@gmail.com,
 dooooongsheng.yang@gmail.com, jschultz@xes-inc.com, starvik@axis.com,
 mtownsend1973@gmail.com, linux-mtd@lists.infradead.org,
 Colin King <colin.king@canonical.com>, asierra@xes-inc.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <a89263d4-9748-9437-e11d-62b5a6a54b7c@nod.at>
Date: Fri, 19 Aug 2016 11:47:50 +0200
MIME-Version: 1.0
In-Reply-To: <57B6CC7B.1060208@easystack.cn>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Yang,

Sorry when I ask already answered questions, the mail thread
grows faster than I can type. ;)

On 19.08.2016 11:08, Dongsheng Yang wrote:
> But how can we handle the multiple chips problem? Some drivers
> are combining multiple chips to one single mtd device, what the
> mtd_concat is doing.

mtd_concat is a horrid and old hack which was used to combine very
small flashes.

>> One last question? What's the real goal of this MTD-RAID layer? If
>> that's about addressing the MLC/TLC NAND reliability problems, I don't
>> think it's such a good idea.
> 
> Oh, that's not the main problem I want to solve. RAID-1 is just a possible
>  extension base on my RAID framework.
> 
> This work is started for only RAID0, which is used to take the use of lots
> of flash to improve performance. Then I refactored it to a MTD RAID
> framework. Then we can implement other raid level for mtd.
> 
> Example:
>     In our production, there are 40+ chips attached on one pcie card.
> Then we need to simulate all of them into one mtd device. At the same
> time, we need to consider how to manage these chips. Finally we chose
> a RAID0 mode for them. And got a great performance result.
> 
> So, the multiple chips scenario is the original problem I want to solve. And
> then I found I can refactor it for other RAID-levels.

Are your chips NAND flash?
Combining non-NAND is not that hard, mtd_concat does already.
With NAND, as Boris pointed out, it will become complicated.

So, what you propose as MTD RAID is not really RAID.
RAID is about redundant disks. i.e. you can replace them upon failure.
The problem you address is combining multiple chips.
IOW an SSD emulated in software.

I think we don't need replication on MTD. An improved mtd_concat
does not sound bad but a proper implementation has to deal with
all the nastiness of NAND.

Thanks,
//richard
