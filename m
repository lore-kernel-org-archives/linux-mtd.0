Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Dnhb0-00054b-O0
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2005 14:47:41 -0400
Message-ID: <42C2ECC4.1000705@nrl.navy.mil>
Date: Wed, 29 Jun 2005 14:47:32 -0400
From: Dan Brown <dan.brown@nrl.navy.mil>
MIME-Version: 1.0
To: Brian O'Dell <brian@clarionsensing.com>
References: <42C03FFB.3080208@clarionsensing.com>	<42C04A65.5040804@ieee.org>	<42C180D4.1010607@clarionsensing.com>	<42C1A11A.2020108@ieee.org>	<42C1C3A3.5030007@clarionsensing.com>
	<42C2EAEE.8040204@clarionsensing.com>
In-Reply-To: <42C2EAEE.8040204@clarionsensing.com>
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

Brian O'Dell wrote:
> After reading through the doc_bootstub.S a bit, it looks like my system 
> isn't even getting to the interrupt handler.  I've installed to 18h and 
> 19h.  Both with the same result:  The system locks hard right after it 
> exits from the SPL.  Could docboot be clobbering something important 
> when it loads the interrupt handler?  I'm assuming that it isn't getting 
> to the interrupt handler because I don't get the "Kernel Loading..." 
> message.  Is my theory plausible or likely?

It's been a while since I've actually run DOCBoot (I've been working on 
other stuff), so I just built and installed it on my device from the 
latest CVS as a sanity check.  I get the same hard lockup as you do.

I'll let you know when I've found the problem.  Needless to say, I'm a 
bit embarassed to have checked in code this broken and let it sit that 
way in the repository for several months :(

	-Dan
