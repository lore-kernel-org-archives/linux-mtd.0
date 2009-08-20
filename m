Received: from sdcmail02.amcc.com ([198.137.200.90])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MeHHJ-0001vr-HM
	for linux-mtd@lists.infradead.org; Thu, 20 Aug 2009 23:42:50 +0000
Message-ID: <4A8DDF72.2080808@amcc.com>
Date: Thu, 20 Aug 2009 16:42:42 -0700
From: Feng Kan <fkan@amcc.com>
MIME-Version: 1.0
To: Stefan Roese <sr@denx.de>
Subject: Re: [U-Boot] NAND  ECC Error with wrong SMC ording bug
References: <19081.57584.173693.798535@cargo.ozlabs.ibm.com>
	<4A8C87E6.6070702@amcc.com>
	<20090820003851.1a532444@lappy.seanm.ca>
	<200908200701.21076.sr@denx.de>
In-Reply-To: <200908200701.21076.sr@denx.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linuxppc-dev@ozlabs.org, u-boot@lists.denx.de,
	linux-mtd@lists.infradead.org, Sean MacLennan <smaclennan@pikatech.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Stefan:

We had a board with high number of correctable ECC errors. Which crashed 
the jffs when it
was miss correcting the wrong byte location.

Do you want me to submit a patch for this, or do you prefer to do it. I 
am submitting a patch
for linux right now.

Feng Kan
AMCC Software

On 08/19/2009 10:01 PM, Stefan Roese wrote:
> On Thursday 20 August 2009 06:38:51 Sean MacLennan wrote:
>    
>>> I see other boards using SMC as well, can someone comment on the
>>> change I am proposing.
>>> Should I change the correction algorithm or the calculate function?
>>> If the later is preferred
>>> it would mean the change must be pushed in both U-Boot and Linux.
>>>        
>> Odds are the calculate function is wrong. The correction algo is used
>> by many nand drivers, I *assume* it is correct. The calculate function
>> was set to agree with u-boot (1.3.0).
>>      
> Yes, it seems that you changed the order in the calculation function while
> reworking the NDFC driver for arch/powerpc. So we should probably change this
> order back to the original version. And change it in U-Boot as well.
>
> BTW: I didn't see any problems with ECC so far with the current code. Feng,
> how did you spot this problem?
>
> Cheers,
> Stefan
>
> --
> DENX Software Engineering GmbH,      MD: Wolfgang Denk&  Detlev Zundel
> HRB 165235 Munich,  Office: Kirchenstr.5, D-82194 Groebenzell, Germany
> Phone: (+49)-8142-66989-0 Fax: (+49)-8142-66989-80 Email: office@denx.de
>    
