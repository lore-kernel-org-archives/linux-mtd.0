Message-ID: <499292A2.9070708@linutronix.de>
Date: Wed, 11 Feb 2009 09:56:02 +0100
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: [PATCH v2] ubiformat: make it work on mtd parts > 2GiB
References: <20090210095614.GA1995@www.tglx.de>	
	<1234260416.17790.109.camel@localhost.localdomain>	
	<20090210103354.GA8405@www.tglx.de>
	<1234337417.17790.123.camel@localhost.localdomain>
In-Reply-To: <1234337417.17790.123.camel@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:
> On Tue, 2009-02-10 at 11:33 +0100, Sebastian Andrzej Siewior wrote:
>> diff --git a/ubi-utils/new-utils/src/libmtd.c b/ubi-utils/new-utils/src/libmtd.c
>> index aab4b0e..69705dd 100644
>> --- a/ubi-utils/new-utils/src/libmtd.c
>> +++ b/ubi-utils/new-utils/src/libmtd.c
>> @@ -189,7 +189,7 @@ int mtd_is_bad(const struct mtd_info *mtd, int eb)
>>  	if (!mtd->allows_bb)
>>  		return 0;
>>  
>> -	seek = eb * mtd->eb_size;
>> +	seek = (unsigned int)eb * mtd->eb_size;
> 
> I believe this should be:
> 
> seek = (off_t)eb * mtd->eb_size;
> 
> instead.
Yes, indeed.
> 

Sebastian
