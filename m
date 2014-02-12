Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDdtD-0003KQ-Nx
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2014 17:46:28 +0000
Message-ID: <52FBB358.1060103@nod.at>
Date: Wed, 12 Feb 2014 18:46:00 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: "Wiedemer, Thorsten (Lawo AG)" <Thorsten.Wiedemer@lawo.com>,
 Bill Pringlemeir <bpringlemeir@nbsps.com>
Subject: Re: UBI leb_write_unlock NULL pointer Oops (continuation)
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>	<CAFLxGvya5WXoKcYmOgeM_SmVVEht1jEzeLG9vHhwFudFU+Ny8A@mail.gmail.com>	<D7B1B5F4F3F27A4CB073BF422331203F2A18997F8B@Exchange1.lawo.de>	<52EF772D.8080207@nod.at>	<D7B1B5F4F3F27A4CB073BF422331203F2A18DD7989@Exchange1.lawo.de>	<52EF9FFE.4020405@nod.at>	<D7B1B5F4F3F27A4CB073BF422331203F2A18A7474A@Exchange1.lawo.de>	<52F1F658.9080701@nod.at>	<D7B1B5F4F3F27A4CB073BF422331203F2A1ECCF6AE@Exchange1.lawo.de>
 <87zjlxy8lj.fsf@nbsps.com>
 <D7B1B5F4F3F27A4CB073BF422331203F2A1ECCFB51@Exchange1.lawo.de>
In-Reply-To: <D7B1B5F4F3F27A4CB073BF422331203F2A1ECCFB51@Exchange1.lawo.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 12.02.2014 16:18, schrieb Wiedemer, Thorsten (Lawo AG):
>> On 11 Feb 2014, Thorsten.Wiedemer@lawo.com wrote:
>>
>>> short update (I was out of office the rest of last week).  I compiled 
>>>  the kernel with the debug flags for debug list and lock alloc.  The 
>>> kernel compiled with gcc-4.8.2 didn't start (no output on serial 
>>>  console and reboot of the system).  I didn't try (yet) to find out 
>>>  what happens at startup.
>>
>> You don't need to enable the 'lock alloc' debugging; Just the 'debug list' as Richard suggested.  One at a time would work and give clues if you 
>> can reproduce it.
> 
> 
> I tested this, compiled with gcc.4-4-4. I had an error one time, but there was no bug report for list handling, only kernel oops:

Are you able to trigger the bug with function tracing enabled?
If so, please add the ftrace_dump_on_oops kernel parameter. Such that we see what happened before oops.

Thanks,
//richard
