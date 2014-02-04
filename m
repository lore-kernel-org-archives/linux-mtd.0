Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WAaiP-0006Vh-Bp
 for linux-mtd@lists.infradead.org; Tue, 04 Feb 2014 07:46:42 +0000
Message-ID: <52F09AC9.6090604@nod.at>
Date: Tue, 04 Feb 2014 08:46:17 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: UBI leb_write_unlock NULL pointer Oops (continuation)
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>	
 <CAFLxGvya5WXoKcYmOgeM_SmVVEht1jEzeLG9vHhwFudFU+Ny8A@mail.gmail.com>	
 <D7B1B5F4F3F27A4CB073BF422331203F2A18997F8B@Exchange1.lawo.de>	
 <52EF772D.8080207@nod.at>	
 <D7B1B5F4F3F27A4CB073BF422331203F2A18DD7989@Exchange1.lawo.de>	
 <52EF9FFE.4020405@nod.at> <1391498545.1795.29.camel@sauron.fi.intel.com>
In-Reply-To: <1391498545.1795.29.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "Wiedemer, Thorsten \(Lawo AG\)" <Thorsten.Wiedemer@lawo.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 04.02.2014 08:22, schrieb Artem Bityutskiy:
> On Mon, 2014-02-03 at 14:56 +0100, Richard Weinberger wrote:
>> Am 03.02.2014 13:51, schrieb Wiedemer, Thorsten (Lawo AG):
>>> Hi,
>>>
>>> I can reproduce it fairly regularly, but not really "quickly". At the moment, I can use a setup of about identical 70 devices.
>>> A test over the last weekend resultet In 6 devices showing the bug.
>>> What we have are multiple processes which write in different intervals some data on the device and sync it, because this data should be available after a power cut.
>>> Perhaps I can force the error more often in writing test processes with shorter write/sync intervals.
>>>
>>> If I have further access to the "big" setup for some days, I will try to make a test without preemption.
>>
>> Hmm, ok.
>> Please also apply this patch, just in case...
>>
>> diff --git a/drivers/mtd/ubi/eba.c b/drivers/mtd/ubi/eba.c
>> index 0e11671d..48fd2aa 100644
>> --- a/drivers/mtd/ubi/eba.c
>> +++ b/drivers/mtd/ubi/eba.c
>> @@ -301,6 +301,7 @@ static void leb_write_unlock(struct ubi_device *ubi, int vol_id, int lnum)
>>
>>  	spin_lock(&ubi->ltree_lock);
>>  	le = ltree_lookup(ubi, vol_id, lnum);
>> +	ubi_assert(le);
>>  	le->users -= 1;
>>  	ubi_assert(le->users >= 0);
>>  	up_write(&le->mutex);
> 
> The UBI LEB locking is a bit over-designed, it could be simplified, may
> be this could help looking for the problem.
> 
> The this report does really sound like there is something specific to
> Thorsten's system which corrupts memory.

Thorsten sees:
Dec 25 03:59:22 kernel: Unable to handle kernel NULL pointer dereference at virtual address 0000000c
(leb_write_unlock+0x74/0xf0) from [<c02d0d10>] (ubi_eba_write_leb+0x94/0x820

In July 2013 we got this report from a user:
[  300.554525] Unable to handle kernel NULL pointer dereference at virtual address 0000000c
(leb_write_unlock+0xa0/0xf4) from [<802850e0>] (ubi_eba_write_leb+0x568/0x80c)

In both cases we fault at address 0000000c and leb_write_unlock() was called by ubi_eba_write_leb().

Same user saw the issue also in the read path:

[   38.471134] Unable to handle kernel NULL pointer dereference at
virtual address 00000000
(leb_read_unlock+0xa0/0xf4) from [<80285cdc>] (ubi_eba_read_leb+0x404/0x480)

In that case the fault happened at 00000000 directly.

A bit too deterministic for a memory corruption IMHO.

> And it is difficult to debug this via the mailing list. Thorsten should
> start adding various checks like this and try to come closer to the
> root-cause.

Yeah.
We also need more oopses, maybe we can spot a pattern.

Thanks,
//richard
