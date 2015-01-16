Received: from mail-qc0-f178.google.com ([209.85.216.178])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YC8jG-0003YE-E4
 for linux-mtd@lists.infradead.org; Fri, 16 Jan 2015 15:22:31 +0000
Received: by mail-qc0-f178.google.com with SMTP id p6so17380256qcv.9
 for <linux-mtd@lists.infradead.org>; Fri, 16 Jan 2015 07:22:06 -0800 (PST)
MIME-Version: 1.0
Sender: root@kryo.se
In-Reply-To: <alpine.DEB.2.02.1501161314110.27318@lnxricardw1.se.axis.com>
References: <CAGgu=sBpckw_J1sMcQi+Df8N8=sVjaeLZCLL9bVqEm_uHMB-5Q@mail.gmail.com>
 <CAFLxGvwaqLfshJGHT=tfwh=SFt4nRBTPpMBVyE9DMxkhyWr-Wg@mail.gmail.com>
 <alpine.DEB.2.02.1501142353210.5742@lnxricardw1.se.axis.com>
 <CAGgu=sBM=vaVi52yGP6+QzUAdeG7yhuzry0DHndm6Zgtjhh2nw@mail.gmail.com>
 <CAGgu=sBLzZa=iWjo39fcrx1ph-WjErg6FuxQqBMZaF1=1gcJ0Q@mail.gmail.com>
 <alpine.DEB.2.02.1501161031561.27318@lnxricardw1.se.axis.com>
 <CAGgu=sAtqj-Jj3xqsSkuzUXeUwbztKbYLqavhoN1MhzszE=7tA@mail.gmail.com>
 <alpine.DEB.2.02.1501161050150.27318@lnxricardw1.se.axis.com>
 <CAGgu=sB54RE4SreSuHti+TpAXshqvrU=F=f-DyEnqBQg0oVRZA@mail.gmail.com>
 <alpine.DEB.2.02.1501161314110.27318@lnxricardw1.se.axis.com>
Date: Fri, 16 Jan 2015 16:22:06 +0100
Message-ID: <CAGgu=sB5bFmsw+VEGJGqoZD5s3M1-ccchyy_mgTtrBiDi-+EKQ@mail.gmail.com>
Subject: Re: Flash filesystem questions
From: Erik Ekman <erik@kryo.se>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=UTF-8
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 =?UTF-8?Q?Ricard_Wanderl=C3=B6f?= <ricardw@axis.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 16, 2015 at 1:25 PM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
>
> On Fri, 16 Jan 2015, Erik Ekman wrote:
>
>> It does not use the nand layer at all.
>> ...
>> The device does not give access to the raw nand. The driver creates transfer
>> commands by writing address, number of sectors and a dma bus address
>> of the source/destination data to a buffer. The bus address of that command
>> buffer is then written to a register on the PCI device and an interrupt is
>> received when the transfer is done. Had it not been for the erase command
>> and some restrictions on sector count and alignment would it have been a
>> perfect block device interface.
>>
>> The OOB data/ECC handling is hidden, and the only operations
>> possible are read, write and erase of sectors. This fits well with the
>> MTD interface (struct mtd_info) so I was planning to add my driver to
>> /drivers/mtd/devices instead of under the /drivers/mtd/nand directory more
>> commonly used for nand controllers.
>
> I see.
>
>> I have looked at nand.h and its structs but since I cannot get access to the
>> raw NAND chips I didn't feel those interfaces helped me in any way.
>
> Well, one advantage to using the NAND layer is that you'd get access to
> the NAND BBT management. However, to scan the device it needs to have
> access to the OOB to read the bad block markers. If OOB data is hidden,
> how do you determine if a block is bad? In a previous post you said that
> read returns no error when reading a bad block, but that write and erase
> do. Does that mean that the only way to determine if a block is bad is by
> attempting to write or erase it?
>
> I suppose one way to handle this would be to implement a fake oob read
> function which would always return an all-erased (i.e. good block) state.
> As time goes and writes and erase operations fail, the block can be marked
> bad on the fly, and the information kept in a BBT.

My plan was to check for the BBT in certain blocks, and if not found erase all
sectors. This formatting will discover any bad blocks, and then write a new BBT
after. Normally the BBT would be found and just updated when write/erase fails.
I will play around with this and see how much code it is.

I think it could be done with some init/scan-function, as well as
implementations
for block_isreserved, block_isbad and block_markbad.
>
> Your other suggestion of implementing a general BBT functionality which is
> not NAND-dependent would work too, but it seems like a lot of work to
> acheive what can be done in other ways, especially if no other mtd related
> technology needs a BBT so there would basically only be your use case.
>

If my method above is acceptable to other users as well, making it
generic might be worth the effort. Migrating existing drivers might be
a problem though, since it is hard to provide compatibility for
another BBT already
written to flash.

/Erik
