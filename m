Received: from dcn237-231.dcn.davis.ca.us ([168.150.237.231]
	helo=rusty.jkmicro.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LN9CE-0008Qx-JY
	for linux-mtd@lists.infradead.org; Wed, 14 Jan 2009 17:06:29 +0000
Received: from [10.10.1.107] (dcn237-230.dcn.davis.ca.us [168.150.237.230])
	by rusty.jkmicro.com (8.12.8/8.12.8) with ESMTP id n0EDTRU0009345
	for <linux-mtd@lists.infradead.org>; Wed, 14 Jan 2009 05:29:27 -0800
Message-ID: <496E1B8D.5010206@jkmicro.com>
Date: Wed, 14 Jan 2009 09:06:21 -0800
From: Adam Yergovich <ayergo@jkmicro.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Access entire device with mtdblock0
References: <4967F2B2.4060405@jkmicro.com>	<8bd0f97a0901131510k25addc8es917fb4e827bb2cf@mail.gmail.com>	<878wpeclf1.fsf@macbook.be.48ers.dk>	<8bd0f97a0901140258n3cdc2637hdfcd8f162205c654@mail.gmail.com>
	<20090114115056.GD7994@leila.ping.de>
In-Reply-To: <20090114115056.GD7994@leila.ping.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
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

Thanks for the advice all.  I will give these a go in the next day or two.

-Adam
