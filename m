Received: from mail-bk0-x22c.google.com ([2a00:1450:4008:c01::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VJOiP-0006Pz-Qx
 for linux-mtd@lists.infradead.org; Tue, 10 Sep 2013 14:14:50 +0000
Received: by mail-bk0-f44.google.com with SMTP id mz10so2966323bkb.17
 for <linux-mtd@lists.infradead.org>; Tue, 10 Sep 2013 07:14:27 -0700 (PDT)
Message-ID: <522F2941.4030406@gmail.com>
Date: Tue, 10 Sep 2013 16:14:25 +0200
From: Daniel Mack <zonque@gmail.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [RFC/PATCH v2] mtd: nand: pxa3xx: Remove redundant device probing
References: <1378811821-14766-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1378811821-14766-2-git-send-email-ezequiel.garcia@free-electrons.com>
 <522F22C9.1050305@gmail.com> <20130910135729.GA32715@localhost>
In-Reply-To: <20130910135729.GA32715@localhost>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Lior Amsalem <alior@marvell.com>, Tawfik Bayouk <tawfik@marvell.com>,
 haojian.zhuang@gmail.com, b32955@freescale.com, linux-mtd@lists.infradead.org,
 Gregory Clement <gregory.clement@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>, Willy Tarreau <w@1wt.eu>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10.09.2013 15:57, Ezequiel Garcia wrote:
> On Tue, Sep 10, 2013 at 03:46:49PM +0200, Daniel Mack wrote:

>> Apart from that, this seems to work fine on my board,
> 
> Great! Which board is that?

It's a custom board featuring a PXA303 processor connected to a ST Micro
NAND:

[    2.655607] NAND device: Manufacturer ID: 0x20, Chip ID: 0xa1 (ST
Micro NAND01GR3B2CZA6), 128MiB, page size: 2048, OOB size: 64

>> but I suspect that
>> it would break systems where the NAND controller is not initialized from
>> the bootloader, right?
>>
> 
> Right. However, since we can easily add support to configure every controller
> parameter (right?) this shouldn't be a problem.
> 
> What do you think of this change, Daniel?

I always thought that this detail of the pxa nand driver is ugly :) But
I'd say before it can be merged, you need to provide code to set the
timing from parameters obtained from generic part. Are you working on
this? I'd happily test more patches.

> IMO, the code is ugly, useless and deprecated enough to consider its removal.
> It forces to keep a (duplicated) list of known flash devices and it considers
> only 512 and 2048 page sizes, just to name a few limitations.

Jup, agreed.


Thanks,
Daniel
