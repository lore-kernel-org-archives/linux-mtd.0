Received: from elasmtp-curtail.atl.sa.earthlink.net ([209.86.89.64])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KYFFv-0002fn-UH
	for linux-mtd@lists.infradead.org; Wed, 27 Aug 2008 07:15:52 +0000
Message-Id: <A45237D9-5E44-4900-86C4-C59666FA3142@earthlink.net>
From: Bruce Leonard <brucle@earthlink.net>
To: dedekind@infradead.org
In-Reply-To: <1219815617.18027.132.camel@sauron>
Content-Type: text/plain; charset=US-ASCII; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0 (Apple Message framework v926)
Subject: Re: [PATCH 2/2] Add support for > 2GiB MTD devices
Date: Wed, 27 Aug 2008 00:15:48 -0700
References: <48AB3AAF.3010504@earthlink.net>
	<1219815617.18027.132.camel@sauron>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Aug 26, 2008, at 10:40 PM, Artem Bityutskiy wrote:

> Hi Bruce,
>
> On Tue, 2008-08-19 at 14:27 -0700, Bruce Leonard wrote:
>> +/*
>> + * Inline function for determining the size of the MTD device,  
>> independant
>> + * of old or new way of doing things.
>> + *
>> + */
>> +static inline u_int64_t device_size(struct mtd_info *a)
>> +{
>> +	return a->num_eraseblocks == 0 ? a->size : a->num_eraseblocks * a- 
>> >erasesize;
>> +}
>
> I do not think it is a good idea to do multiplication every time we  
> need
> MTD device size. It is unnecessarily large overhead in terms of speed
> and code size.
>
> Did you consider a possibility of just making mtd->size 64 bit?

I did consider making size 64-bit, but it seemed less intrusive to go  
the direction I did.  I wanted to change as little code as possible  
but at the same time make it obvious there was a fundamental change.   
There's also a desire to move more in the direction of a BIO-like  
aspect to the MTD layer and some of the suggestions I got early made  
it seem that this would make that future move easier.

>
> Or using eraseblock:offset pairs instead of absolute address?

I didn't really see how I could convey the idea of size using  
eraseblock:offset.

Bruce
