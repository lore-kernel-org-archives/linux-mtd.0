Received: from mail-in-02.arcor-online.net ([151.189.21.42])
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1Hz7OF-0004kp-8i
	for linux-mtd@lists.infradead.org; Fri, 15 Jun 2007 04:42:44 -0400
In-Reply-To: <20070615041423.GB30104@localhost.localdomain>
References: <bd6ef296692e8cfb81118f2dc85189a5@kernel.crashing.org>
	<4662EAA9.70104@ru.mvista.com>
	<e4197fd2753f2b4d548d5dde9e3fd1d3@kernel.crashing.org>
	<466308F4.8050004@ru.mvista.com>
	<8ac5664208e0f59329b62ac2138bbc8c@kernel.crashing.org>
	<466312C2.4090200@ru.mvista.com>
	<548a7e11ffb577f6395b8f5a9c2fba2d@kernel.crashing.org>
	<466323EF.5040807@ru.mvista.com>
	<1181228442.2785.60.camel@pmac.infradead.org>
	<18fbfbaf113ab76b602d279848d9b405@kernel.crashing.org>
	<20070615041423.GB30104@localhost.localdomain>
Mime-Version: 1.0 (Apple Message framework v623)
Content-Type: text/plain; charset=US-ASCII; format=flowed
Message-Id: <6dcf3b4c6c7fcd8060baccf5374316c5@kernel.crashing.org>
Content-Transfer-Encoding: 7bit
From: Segher Boessenkool <segher@kernel.crashing.org>
Subject: Re: [PATCH] powerpc: Create "rom" (MTD) device prpmc2800
Date: Fri, 15 Jun 2007 10:42:33 +0200
To: David Gibson <david@gibson.dropbear.id.au>
Cc: linuxppc-dev@ozlabs.org, linux-mtd@lists.infradead.org,
	David Woodhouse <dwmw2@infradead.org>, Milton Miller <miltonm@bga.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>> So I think the best thing to have would be
>>
>> 	compatible      "cfi-flash"
>> 	bank-width      like you said
>> 	device-width    width of a single flash device
>> 	reg             complete address range of this thing
>>
>> and then the Linux OF CFI flash code / MTD code just keeps
>> on probing devices from that address range until it has it
>> filled.
>>
>> Sounds good / comments / anything I missed?
>
> Slight revision suggestion.  Can we make 'device-width' optional, with
> the default value being equal to the bank-width?

Yes, certainly.  Or, the other way around I like better
("bank-width" optional).

I didn't say all these properties were required anyway,
this is still a very rough draft.


Segher
