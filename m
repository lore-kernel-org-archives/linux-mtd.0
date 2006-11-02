Received: from [85.21.88.2] (helo=mail.dev.rtsoft.ru)
	by canuck.infradead.org with smtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GfWal-0007Pt-SI
	for linux-mtd@lists.infradead.org; Thu, 02 Nov 2006 02:02:31 -0500
Message-ID: <45499801.7030800@ru.mvista.com>
Date: Thu, 02 Nov 2006 10:02:25 +0300
From: Vitaly Wool <vwool@ru.mvista.com>
MIME-Version: 1.0
To: dedekind@infradead.org
Subject: Re: [PATCH/RFC] remove len/ooblen confusion in MTD/NAND code
References: <20061030145105.84f953e7.vwool@ru.mvista.com>
	<1162392062.7527.11.camel@sauron>
In-Reply-To: <1162392062.7527.11.camel@sauron>
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

Hi Artem,

Artem Bityutskiy wrote:
> Hello Vitaly,
>
> the patch looks logical for me, please find my comments below.
>
> 1. You did not change comments above the 'struct mtd_oob_ops' structure
> declaration.
>   
Oh right, thanks. I'll come up shortly with a new one.
> On Mon, 2006-10-30 at 14:51 +0300, Vitaly Wool wrote:
>   
>>  		if (devops.datbuf)
>>  			devops.datbuf += devops.retlen;
>>  		if (devops.oobbuf)
>> -			devops.oobbuf += devops.ooblen;
>> +			devops.oobbuf += subdev->oobsize;
>>     
>
> Is this is an independent bug-fix?
>
>   
No. The point here is that devops.ooblen is no more the OOB size, so we 
have to obtain OOB size from somewhere else. I. e. for the old version 
this would have been an equivalent change.

Vitaly
