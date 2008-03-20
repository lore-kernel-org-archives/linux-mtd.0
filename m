Received: from mk-filter-3-a-1.mail.uk.tiscali.com ([212.74.100.54]
	helo=mk-filter-3-a-4.mail.uk.tiscali.com)
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JcKKH-0005f6-3B
	for linux-mtd@lists.infradead.org; Thu, 20 Mar 2008 12:56:58 +0000
Message-ID: <47111.85.118.17.158.1206017802.squirrel@newgolddream.dyndns.info>
In-Reply-To: <20080320112029.GB1355@logfs.org>
References: <1205961641.6276.6.camel@localhost.localdomain>
	<20080320100353.GA409@logfs.org>
	<21996.85.118.17.158.1206014214.squirrel@newgolddream.dyndns.info>
	<20080320112029.GB1355@logfs.org>
Date: Thu, 20 Mar 2008 12:56:42 -0000 (UTC)
Subject: Re: [Fwd: Re: [PATCH] 2/2 mtd: Add support for the Dreamcast VMU
	flash]
From: "Adrian McMenamin" <adrian@newgolddream.dyndns.info>
To: =?iso-8859-15?Q?J=C3=B6rn_Engel?= <joern@logfs.org>
MIME-Version: 1.0
Content-Type: text/plain;charset=iso-8859-15
Content-Transfer-Encoding: 8bit
Cc: MTD <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, March 20, 2008 11:20 am, Jörn Engel wrote:
> On Thu, 20 March 2008 11:56:54 -0000, Adrian McMenamin wrote:
>> >> +
>> >> +	((unsigned long *)sendbuf)[0] = cpu_to_be32(MAPLE_FUNC_MEMCARD);
>> >> +	((unsigned long *)sendbuf)[1] = cpu_to_be32(partition << 24 | num);
>> >
>> > unsigned long is larger than 32bit on many architectures.  Better
>> > variant:
>> > 	__be32 *sendbuf;
>>
>>
>> No, it's not. This is part of a bus subsystem where different parts of
>> the
>> incoming packets may or may not be in big endian format. Eg for block
>> writes the then the opening blocks may be in big endian format but the
>> data to be written is not.
>
> Data to be written is usually treated as opaque void* pointer.  You
> don't need to know what's in it, just the pointer and the length.  But
> once you dereference the data, it is no longer opaque and you better
> know its endianness.
>
> So why do you use void* for data you actually dereference?


Because for other devices data can be passed as 16 bit structures as well
as 32 bit ones.


>.
>
> A couple of lines down you have "return -ENOMEM;".  Notice the "-"?  As
> a general rule, negative return values in the kernel are errors,
> positive or zero are non-errors.  Exceptions exist, but they tend to
> surprise users and cause subtle bugs.
>

Ah. I understand your point better now. I'd basically saw that too - but I
didn't realise that is what you meant.
