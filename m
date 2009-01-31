Received: from dcn237-231.dcn.davis.ca.us ([168.150.237.231]
	helo=rusty.jkmicro.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LT3PQ-0003kk-Fr
	for linux-mtd@lists.infradead.org; Sat, 31 Jan 2009 00:08:32 +0000
Message-ID: <49839668.20502@jkmicro.com>
Date: Fri, 30 Jan 2009 16:08:08 -0800
From: Adam Yergovich <ayergo@jkmicro.com>
MIME-Version: 1.0
To: Wolfgang Wegner <wolfgang@leila.ping.de>
Subject: Re: Access entire device with mtdblock0
References: <4967F2B2.4060405@jkmicro.com>	<8bd0f97a0901131510k25addc8es917fb4e827bb2cf@mail.gmail.com>	<878wpeclf1.fsf@macbook.be.48ers.dk>	<8bd0f97a0901140258n3cdc2637hdfcd8f162205c654@mail.gmail.com>
	<20090114115056.GD7994@leila.ping.de>
In-Reply-To: <20090114115056.GD7994@leila.ping.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Wolfgang Wegner wrote:
> On Wed, Jan 14, 2009 at 05:58:43AM -0500, Mike Frysinger wrote:
>> On Wed, Jan 14, 2009 at 04:00, Peter Korsgaard wrote:
>>> "Mike" == Mike Frysinger <writes:
>>>>> Any recommendations on a simple way to create a partition using the
>>>>> entirety of flash?
>>>> looks like no one responded.  i'm pretty sure the answer is to use
>>>> add_mtd_device() even in face of add_mtd_partitions().
>>> Why not just add a partition spanning the entire device in addition to
>>> the other partitions?
>> i was not aware partition tables allowed for overlaps.  if that's
>> true, then the answer is obvious and easy to implement in boards ...
> 
> They are allowed, but I have not been able yet to do a correct query
> for erase_size in case of a partition covering a whole device having
> multiple different-sized erase regions.
> 
> Regards,
> Wolfgang

Hello All,

Sorry for the delay in trying this out, I have been exceptionally busy.

The short story is: i got it all to work.

The long story is:

In reviewing the code i found that add_mtd_device was already being 
called after the partitioning.  As it wasn't giving mtdblock0 as the 
entire region it didn't seem to be the solution.

I played around some more, and found disabling the mtd partitioning 
would give me one partition including all of flash.  If you'll note in 
the code (which has been present in physmap.c for some time i believe) 
it was getting to the add_mtd_device and adding it if and only if the 
redboot section was not called.

I moved the add_mtd_device() call to before the redboot partitioning and 
it all worked brilliantly.

I would like to suggest that this is perhaps a better construct overall 
as it adds a nice feature.

Hopefully this is at very least useful to someone who looks at this in 
the future.  I thank you all for your help in this.

-Adam
