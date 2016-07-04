Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bKBWK-0000kR-BT
 for linux-mtd@lists.infradead.org; Mon, 04 Jul 2016 21:35:13 +0000
Subject: Re: Race-free NAND device removal
To: Boris Brezillon <boris.brezillon@free-electrons.com>
References: <57791562.2020703@nod.at> <20160704111612.43cd6339@bbrezillon>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Brian Norris <computersforpeace@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <577AD677.7080103@nod.at>
Date: Mon, 4 Jul 2016 23:34:47 +0200
MIME-Version: 1.0
In-Reply-To: <20160704111612.43cd6339@bbrezillon>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 04.07.2016 um 11:16 schrieb Boris Brezillon:
> On Sun, 3 Jul 2016 15:38:42 +0200
> Richard Weinberger <richard@nod.at> wrote:
> 
>> Hi!
>>
>> While working on nandsim I realized that nand_release() ignores the return
>> value from mtd_device_unregister().
>>
>> That means NAND devices cannot removed in a race-free manner.
>> Consider a NAND driver that registers ->_get_device() and ->_put_device()
>> callbacks for refcounting. In its removal function it will return -EBUSY
>> whenever the refcount is > 0.
>> But when device is claimed while removing it, it can happen that the refcount
>> increments after the check.
>> MTD can deal with that and mtd_device_unregister() will return EBUSY.
>> But nand_release() won't notice and the NAND driver continues with the tear down
>> process.
> 
> Yes, I already noticed that, and apparently all NAND controller drivers
> seem to assume that nand_release() always succeed. It's definitely a
> bug, since the MTD device will still be exposed, but the underlying
> NAND structure (and the associated data + implementation) will be
> gone :-/.
> 
>>
>> Would be a change like the following one acceptable or is a NAND driver
>> allowed to call mtd_device_unregister() itself?
>> AFAICT the additional call to mtd_device_unregister() in nand_release() would
>> be an nop then.
> 
> This patch looks good, but NAND controller drivers will keep ignoring
> the nand_release() return code and release their own private data, so
> implementations are still buggy ;).
> 
> This whole NAND dev registration/deregistration is unsafe, and I plan
> to rework it when moving to a controller <-> chips infrastructure.
> 
> Are you fixing a real bug or just a potential one? Cause I'm not sure
> doing that is any safer if we don't patch all the NAND controller
> drivers...

Just figured that drivers/mtd/nand/r852.c also registers/removes NAND devices during
runtime.
AFAICT it is broken.

Thanks,
//richard
