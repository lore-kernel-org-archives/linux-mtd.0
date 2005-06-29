Received: from ms-smtp-03-smtplb.ohiordc.rr.com ([65.24.5.137]
	helo=ms-smtp-03-eri0.ohiordc.rr.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Dnk9m-00066w-C2
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2005 17:31:43 -0400
Message-ID: <42C317C0.1010803@clarionsensing.com>
Date: Wed, 29 Jun 2005 16:50:56 -0500
From: "Brian O'Dell" <brian@clarionsensing.com>
MIME-Version: 1.0
To: Dan Brown <dan.brown@nrl.navy.mil>
References: <42C03FFB.3080208@clarionsensing.com>	<42C04A65.5040804@ieee.org>	<42C180D4.1010607@clarionsensing.com>	<42C1A11A.2020108@ieee.org>	<42C1C3A3.5030007@clarionsensing.com>
	<42C2EAEE.8040204@clarionsensing.com>
	<42C2ECC4.1000705@nrl.navy.mil> <42C3009A.6020700@nrl.navy.mil>
In-Reply-To: <42C3009A.6020700@nrl.navy.mil>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOCBoot doesn't compile
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dan Brown wrote:

> Dan Brown wrote:
>
>> It's been a while since I've actually run DOCBoot (I've been working 
>> on other stuff), so I just built and installed it on my device from 
>> the latest CVS as a sanity check.  I get the same hard lockup as you do.
>>
>> I'll let you know when I've found the problem.  Needless to say, I'm 
>> a bit embarassed to have checked in code this broken and let it sit 
>> that way in the repository for several months :(
>
>
>
> OK, I found the issue; I was clobbering a register I shouldn't have.  
> I guess I must have made this change right before I committed the 
> latest version and not properly tested it.
>
> I'd appreciate feedback from anyone interested in using DOCBoot... 
> does the latest CVS now work for you?
>
>     -Dan
>
>
It works great.  You are my new hero man.  Thank you!  Thanks to dwmw2 
and the entire mtd team for putting all of this together for us to use.  
You guys are doing good work. 

bto
