Received: from mail-qg0-f45.google.com ([209.85.192.45])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YC3QO-0006qA-49
 for linux-mtd@lists.infradead.org; Fri, 16 Jan 2015 09:42:40 +0000
Received: by mail-qg0-f45.google.com with SMTP id z107so15454146qgd.4
 for <linux-mtd@lists.infradead.org>; Fri, 16 Jan 2015 01:42:13 -0800 (PST)
MIME-Version: 1.0
Sender: root@kryo.se
In-Reply-To: <alpine.DEB.2.02.1501161031561.27318@lnxricardw1.se.axis.com>
References: <CAGgu=sBpckw_J1sMcQi+Df8N8=sVjaeLZCLL9bVqEm_uHMB-5Q@mail.gmail.com>
 <CAFLxGvwaqLfshJGHT=tfwh=SFt4nRBTPpMBVyE9DMxkhyWr-Wg@mail.gmail.com>
 <alpine.DEB.2.02.1501142353210.5742@lnxricardw1.se.axis.com>
 <CAGgu=sBM=vaVi52yGP6+QzUAdeG7yhuzry0DHndm6Zgtjhh2nw@mail.gmail.com>
 <CAGgu=sBLzZa=iWjo39fcrx1ph-WjErg6FuxQqBMZaF1=1gcJ0Q@mail.gmail.com>
 <alpine.DEB.2.02.1501161031561.27318@lnxricardw1.se.axis.com>
Date: Fri, 16 Jan 2015 10:42:13 +0100
Message-ID: <CAGgu=sAtqj-Jj3xqsSkuzUXeUwbztKbYLqavhoN1MhzszE=7tA@mail.gmail.com>
Subject: Re: Flash filesystem questions
From: Erik Ekman <erik@kryo.se>
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Content-Type: text/plain; charset=UTF-8
Cc: Richard Weinberger <richard.weinberger@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jan 16, 2015 at 10:33 AM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
>
> On Thu, 15 Jan 2015, Erik Ekman wrote:
>
>> Next problem is bad blocks. I have not found anything in the hardware
>> that keeps track of them. I am thinking about using the first two
>> working blocks as maps, one u8 per erase block. Since I only have 8k,
>> 16k or 32k erase blocks it should not wear them out too much during
>> updates.
>
> Normally flashes never keep track of bad blocks themselves, except that
> bad blocks are usually marked as such during the manufacturing process,
> but it is completely up to software to make use of the that information.
>
>> Is this a valid strategy or is there a common smart solution?
>
> The mtd driver layer has a bad block table mechanism which does all this
> for you. (see nand_bbt.c). It just has to be enabled using a flag in the
> board driver.

I found that, but it requires the driver to be at the nand layer, I am just
implementing the MTD interface. I saw in some other threads in the list
that a generic bbt implementation might be needed (for SPI NAND, my
device, and Dan Ehrenberg).

My flash complains when writing or erasing to bad blocks, but reads
return no error. Is that the normal case? Should I try making a version
of nand_bbt.c for the more generic case?

/Erik
