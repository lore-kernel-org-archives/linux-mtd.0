Received: from mail-lf0-x233.google.com ([2a00:1450:4010:c07::233])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cppP7-0002Jr-8w
 for linux-mtd@lists.infradead.org; Mon, 20 Mar 2017 04:58:50 +0000
Received: by mail-lf0-x233.google.com with SMTP id a6so50833474lfa.0
 for <linux-mtd@lists.infradead.org>; Sun, 19 Mar 2017 21:58:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170317184852.030709de@bbrezillon>
References: <1489646857-10112-1-git-send-email-peterpandong@micron.com>
 <1489646857-10112-8-git-send-email-peterpandong@micron.com>
 <20170317152048.1eca677e@bbrezillon>
 <3efc4b1f-7391-03f9-497d-8ea5f89f5d59@gmail.com>
 <20170317184852.030709de@bbrezillon>
From: Peter Pan <peterpansjtu@gmail.com>
Date: Mon, 20 Mar 2017 12:58:26 +0800
Message-ID: <CAAyFOR+yCBdigLb_-duQ9fkRsk_rpwbez--C0Cw0MwT_HWsJ+Q@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] nand: spi: Add generic SPI controller support
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: Arnaud Mouiche <arnaud.mouiche@gmail.com>,
 Peter Pan <peterpandong@micron.com>,
 Richard Weinberger <richard@nod.at>, Brian Norris <computersforpeace@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 linux-mtd@lists.infradead.org,
 "linshunquan (A)" <linshunquan1@hisilicon.com>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Boris and Arnaud,

On Sat, Mar 18, 2017 at 1:48 AM, Boris Brezillon
<boris.brezillon@free-electrons.com> wrote:
> On Fri, 17 Mar 2017 18:32:28 +0100
> Arnaud Mouiche <arnaud.mouiche@gmail.com> wrote:
>
>> On 17/03/2017 15:20, Boris Brezillon wrote:
>> > [...]
>> > Should be done before calling spinand_detect(), just in case some DT
>> > props need to be parsed before the detection step.
>> >
>> > This being said, I'm not sure we should let the spinand controller
>> > driver do the registration step. I'm currently trying to rework the
>> > parallel NAND framework to act like all other busses, and I think SPI
>> > NAND controllers should also follow this road:
>> >
>> > 1/ spinand controller driver register a controller to the spinand core
>> >    (spinand_controller_register())
>> > 2/ the core parses the DT (or board info if DT is not available) and
>> >     creates N spinand devices (the N value depends on the number of SPI
>> >     nands connected to the controller)
>> > 3/ for each spinand device the detection/initialization takes place
>> >     directly in the core (the spinand_controller_ops should contain
>> >     anything required to do the detection)
>> > 4/ for each spinand dev the spinand_controller_ops->add() is called, to
>> >     let the controller driver attach private data to the device (if
>> >     required), and/or let it use it's own ECC engine (optional as well).
>> > 5/ underlying MTD device registered by spinand core code and spinand
>> >     dev added to the list of devices controlled by this controller (done
>> >     in the core)
>> >
>> > When removing a device, you just have the reverse steps:
>> >
>> > 1/ remove from list and unregister the MTD dev
>> > 2/ call spinand_controller_ops->remove()
>> > 3/ core/manufacturer cleanup
>> >
>> > Not sure how feasible this is, especially for the generic SPI NAND
>> > controller case where the SPI NAND controller does not have a node in
>> > the DT, but that would avoid all this boiler-plate duplication we have
>> > in the // NAND framework.
>>
>> Since the probe for generic spi devices is generally triggered by the
>> SPI layer, it will not match easily in the way you would like the
>> registration done.
>
> That's true, but I think we can find something to handle this case.
>
>> Can we let this registration question not be a showstopper for Peter's
>> effort ?
>
> Sure, I was just thinking out loud.

Excellent idea, It's a quite big change, Let me try to how far I can go in v4.

Thanks,
Peter Pan
