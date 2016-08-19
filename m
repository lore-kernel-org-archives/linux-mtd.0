Received: from mr213138.mail.yeah.net ([223.252.213.138])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bahCr-00053f-6V
 for linux-mtd@lists.infradead.org; Fri, 19 Aug 2016 10:39:22 +0000
Subject: Re: MTD RAID
To: dedekind1@gmail.com, Richard Weinberger <richard@nod.at>,
 Boris Brezillon <boris.brezillon@free-electrons.com>
References: <CA+qeAOpuZ0CXZP8tCWdhoVvTEKAw26gtz63-UJmQ4XLSXAd=Yg@mail.gmail.com>
 <20160819084908.4955c629@bbrezillon> <57B6B073.9060404@easystack.cn>
 <20160819102016.0640b6d5@bbrezillon> <57B6CC7B.1060208@easystack.cn>
 <a89263d4-9748-9437-e11d-62b5a6a54b7c@nod.at>
 <1471602645.2662.10.camel@gmail.com>
Cc: fabf@skynet.be, jesper.nilsson@axis.com,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, linux-cris-kernel@axis.com,
 shengyong1@huawei.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Dongsheng Yang <dongsheng081251@gmail.com>, dmitry.torokhov@gmail.com,
 dooooongsheng.yang@gmail.com, jschultz@xes-inc.com, starvik@axis.com,
 mtownsend1973@gmail.com, linux-mtd@lists.infradead.org,
 Colin King <colin.king@canonical.com>, asierra@xes-inc.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
From: Dongsheng Yang <dongsheng.yang@easystack.cn>
Message-ID: <57B6E1BD.1060707@easystack.cn>
Date: Fri, 19 Aug 2016 18:38:53 +0800
MIME-Version: 1.0
In-Reply-To: <1471602645.2662.10.camel@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Artem

On 08/19/2016 06:30 PM, Artem Bityutskiy wrote:
> On Fri, 2016-08-19 at 11:47 +0200, Richard Weinberger wrote:
>> So, what you propose as MTD RAID is not really RAID.
>> RAID is about redundant disks. i.e. you can replace them upon
>> failure.

Yes, we can replace it, but we can add/delete devices in btrfs in different
RAID level by :
btrfs device add/delete <device>

That's software raid, similar with Software raid for block device in md.

Yang
>> The problem you address is combining multiple chips.
>> IOW an SSD emulated in software.
> I think this should either be a very close analog of RAID or the word
> "RAID" should not be used at all. Everyone will be confused otherwise.
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
