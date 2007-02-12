Received: from mtagate4.de.ibm.com ([195.212.29.153])
	by pentafluge.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HGYl0-0002NU-LO
	for linux-mtd@lists.infradead.org; Mon, 12 Feb 2007 10:50:07 +0000
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate4.de.ibm.com (8.13.8/8.13.8) with ESMTP id l1CAnrKv081774
	for <linux-mtd@lists.infradead.org>; Mon, 12 Feb 2007 10:49:53 GMT
Received: from d12av01.megacenter.de.ibm.com (d12av01.megacenter.de.ibm.com
	[9.149.165.212])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v8.2) with
	ESMTP id l1CAnrhG1482990
	for <linux-mtd@lists.infradead.org>; Mon, 12 Feb 2007 11:49:53 +0100
Received: from d12av01.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av01.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id l1CAnqWH017042
	for <linux-mtd@lists.infradead.org>; Mon, 12 Feb 2007 11:49:52 +0100
Message-ID: <45D045FC.7090902@linux.vnet.ibm.com>
Date: Mon, 12 Feb 2007 11:48:28 +0100
From: Timo Lindhorst <lindhors@linux.vnet.ibm.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: [PATCH] [MTD] UBI: Fix counting of ec value
References: <200702121016.40516.lindhors@linux.vnet.ibm.com>
	<1171273959.17314.16.camel@sauron>
In-Reply-To: <1171273959.17314.16.camel@sauron>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD list <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

>>+	ec_hdr = ubi_zalloc_ec_hdr(ubi);
>>+	if (unlikely(!ec_hdr))
>>+		return -ENOMEM;
> 
> 
> So why have you moved this memory allocation here?
Actually I have not moved up the allocation, but moved down the
'if (unlikely(ec > UBI_MAX_ERASECOUNTER)) { ... ' block, since we need 
to know the new ec value before we can do this test.

I thought you want the allocation to be done before erasure, to prevent 
the erasure if the ec_hdr cannot be written due to a failure of memory 
allocation.
Otherwise, the allocation can be moved down again, but than the new ec 
is possibly not written to the EB if no memory can be allocated for ec_hdr.

Do I miss something? What do you think?

>>+
>>+	ret = err = ubi_io_sync_erase(ubi, e->pnum, torture);
>>+	if (unlikely(err < 0))
>>+		goto out_free;
>>+
>>+	ec += ret;
> 
> What's the point in the new 'ret' variable? Why ec += err does not work?
I just thought adding an error code to a counter seems odd. Do you 
prefer this way?

> 
>> 	if (unlikely(ec > UBI_MAX_ERASECOUNTER)) {
>> 		/*
>> 		 * Erase counter overflow. Upgrade UBI and use 64-bit
>> 		 * erase counters internally.
>> 		 */
>> 		ubi_err("erase counter overflow at PEB %d, EC %d",
>>-			e->pnum, e->ec);
>>+			e->pnum, ec);
>> 		return -EINVAL;
> 
> And now you do not free memory.
Yes, sorry! I have changed it to:

		err = -EINVAL;
		goto out_free;
	}


I will resend the patch when I have got your comments to the upper points.

Kind regards,
Timo
