Received: from mga06.intel.com ([134.134.136.31])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bbqcS-0003lA-Tt
 for linux-mtd@lists.infradead.org; Mon, 22 Aug 2016 14:54:34 +0000
Message-ID: <1471877646.15722.61.camel@gmail.com>
Subject: Re: MTD RAID
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Dongsheng Yang <dooooongsheng.yang@gmail.com>
Cc: Dongsheng Yang <dongsheng.yang@easystack.cn>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, starvik@axis.com,
 jesper.nilsson@axis.com,  Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 shengyong1@huawei.com, linux-cris-kernel@axis.com, Brian Norris
 <computersforpeace@gmail.com>, Richard Weinberger <richard@nod.at>, Ard
 Biesheuvel <ard.biesheuvel@linaro.org>, jschultz@xes-inc.com,
 fabf@skynet.be, mtownsend1973@gmail.com,  linux-mtd@lists.infradead.org,
 Colin King <colin.king@canonical.com>,  asierra@xes-inc.com,
 dmitry.torokhov@gmail.com, Dongsheng Yang <dongsheng081251@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
Date: Mon, 22 Aug 2016 17:54:06 +0300
In-Reply-To: <CAAp9bSh-geStbHpA6+vYdLfNLcinWkfVLOGmX4kdRbja+d2MdA@mail.gmail.com>
References: <57B6E1BD.1060707@easystack.cn>
 <AL*AZwAyAecQSM1UjjjNxao0.3.1471605640762.Hmail.dongsheng.yang@easystack.cn>
 <20160819135536.1ed9e374@bbrezillon> <57BA6FFA.6000601@easystack.cn>
 <1471850841.15722.13.camel@gmail.com>
 <CAAp9bSh-geStbHpA6+vYdLfNLcinWkfVLOGmX4kdRbja+d2MdA@mail.gmail.com>
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

On Mon, 2016-08-22 at 18:55 +0800, Dongsheng Yang wrote:
> 
> 
> On Mon, Aug 22, 2016 at 3:27 PM, Artem Bityutskiy <dedekind1@gmail.co
> m> wrote:
> > On Mon, 2016-08-22 at 11:22 +0800, Dongsheng Yang wrote:
> > > As I explained above, MTD RAID is not just a solution for
> > reliability
> > > problem for MLC/TLC. 
> > 
> > Could you please answer these questions.
> > 
> > 1. Does MTD raid work on MLC or is it SLC-only?
> 
> Good question. No, it is based on MTD layer, so it should be fine for
> any MTD devices in theory, although we are using nand flash in our
> production.
> > 
> > 2. If I am building RAID-0, I have 2 flash chips, one has every
> > even
> > block bad, the other has every odd block bad. What happens?
> 
>  All blocks would be marked as bad. Because we are combining the
> striping related blocks as a larger block, so if one of the blocks is
> bad, we will
> mark the virtual large block as bad. Example as RAID0 in my first
> email, I build a RAID0 device by 4 devices with block size of 16K.
> then the block
> size of the new RAID0 device is 64K. I am combining these 4 devices
> and do a striping on the new/larger block, for a better performance. 
> > 
> > 3. Same question, but for RAID-1.
> 
> Same result but with different reason, In RAID1, we don't need to
> enlarge the block size. But we should make the blockes mirrored. If
> block of the
> master or mirror is bad, then the block for the RAID1 device should
> be marked as bad, because we can't promise requested number of copies
> of data in this case. 
> > 
> > 4. Suppose I have RAID-1 like in this picture:
> > 
> > https://en.wikipedia.org/wiki/Standard_RAID_levels#/media/File:RAID
> > _1.svg
> > 
> > Just assume we have flash chips, not disks, and eraseblocks, not
> > sectors.
> > 
> > Suppose eraseblock A1 goes bad. What happens next?
> 
> If A1 in disk0 goes bad, the data will be read out from disk1. But
> there would be a warning about this problem. Then we should noticed
> that our
> data in this section is not safe enough now. Then there are different
> scenario. 

> (1) you are using ubi on this device, I mentioned once last week, we
> can enhance ubi to notice this kind of problem, then do a data
> migration. 

So to make my data become mirrored again, MTD RAID needs help from
upper layers.

In case of RAID, you do not need this kind of help. All you need is
change the disk when it starts getting bad sectors.

I mean, this is a bit like: here is our MTD RAID which is not a RAID
unless it works with special SW like UBI on top of it.

Are you sure you want to call this MTD RAID?

If this was on top of UBI, the RAID would probably be a closer match,
because then you could assume you are on top of a "reliable" media.

Note, I am not insisting, just asking.

> (2) you are using some other application on this device, Then you can
> check the status of this MTD RAID device now by "mtd_raid scan <dev>"
> if this command report there is some blocks are bad, you can do a
> "mtd_raid replace <>" to replace the bad one.

How will the replacement work. What gets replaced - the entire flash
chip? Probably not, because bad blocks are natural for raw NAND. Then
how do you replace the blocks if there is an FS on top?

Artem.
