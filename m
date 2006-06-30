Received: from mta065b.interbusiness.it ([85.37.17.65])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1FwKtz-0004Rc-8P
	for linux-mtd@lists.infradead.org; Fri, 30 Jun 2006 11:27:31 -0400
Message-ID: <44A53E0F.4060305@eptar.com>
Date: Fri, 30 Jun 2006 17:06:55 +0200
From: Claudio Lanconelli <lanconelli.claudio@eptar.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH][NAND] Add ssfdc read-only translation layer
References: <449AA7E2.5020609@eptar.com>
	<1151417243.17609.151.camel@hades.cambridge.redhat.com>
In-Reply-To: <1151417243.17609.151.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
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

David Woodhouse wrote:
>> One question, I use major number 44 (since it's the number used by old 
>> ssfdc.c) but I don't know if it's the correct number.
>>     
>
> It isn't. Please send mail to device@lanana.org requesting a new major
> number.
>   
Done, I'm waiting for a reply.
> Also, why is the GETGEO stuff conditional? Why not just build it in
> always?
You're right, no need for conditional. I removed it and tested
the code with getgeo code. I'll prepare the patch again without
it.
> And do we need the table? Can't we just calculate it? There's
> code to do similar calculations in NFTL already.
>
>   
SSFDC specifications recommends the exact CHS
combinations of the table in the code to maintain data
compatibility. It may works even with NTFL calculations
but with different CHS values. Why not the table?
