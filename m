Received: from mr213138.mail.yeah.net ([223.252.213.138])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bc2dj-0001mM-2j
 for linux-mtd@lists.infradead.org; Tue, 23 Aug 2016 03:44:41 +0000
Subject: Re: MTD RAID
To: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Dongsheng Yang <dongsheng081251@gmail.com>, richard <richard@nod.at>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
References: <CA+qeAOpuZ0CXZP8tCWdhoVvTEKAw26gtz63-UJmQ4XLSXAd=Yg@mail.gmail.com>
 <20160819084908.4955c629@bbrezillon>
Cc: fabf@skynet.be, jesper.nilsson@axis.com,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>, linux-cris-kernel@axis.com,
 shengyong1@huawei.com, Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 dmitry.torokhov@gmail.com, dooooongsheng.yang@gmail.com,
 jschultz@xes-inc.com, starvik@axis.com, mtownsend1973@gmail.com,
 Colin King <colin.king@canonical.com>, asierra@xes-inc.com,
 Brian Norris <computersforpeace@gmail.com>
From: Dongsheng Yang <dongsheng.yang@easystack.cn>
Message-ID: <57BBC687.4060505@easystack.cn>
Date: Tue, 23 Aug 2016 11:44:07 +0800
MIME-Version: 1.0
In-Reply-To: <20160819084908.4955c629@bbrezillon>
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

Hi David, Boris, Richard, Artem,

     Thanx for your suggestions, after a second thinking, I will 
consider to put
the RAID layer top on ubi, that sounds better, although we have some 
specified
problems if we don't build RAID device on MTD layer. I will send another 
email
about this topic later if I have a decision to move RAID layer on ubi or 
not.

Thanx a lot
Yang

On 08/19/2016 02:49 PM, Boris Brezillon wrote:
> Hi Dongsheng,
>
> On Fri, 19 Aug 2016 14:34:54 +0800
> Dongsheng Yang <dongsheng081251@gmail.com> wrote:
>
>> Hi guys,
>>      This is a email about MTD RAID.
>>
>> *Code:*
>>      kernel:
>> https://github.com/yangdongsheng/linux/tree/mtd_raid_v2-for-4.7
> Just had a quick look at the code, and I see at least one major problem
> in your RAID-1 implementation: you're ignoring the fact that NAND blocks
> can be or become bad. What's the plan for that?
>
> Regards,
>
> Boris
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
