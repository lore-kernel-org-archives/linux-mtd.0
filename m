Received: from osdsun1.nrl.navy.mil ([132.250.130.7])
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1Dniur-0005jt-B7
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2005 16:12:14 -0400
Message-ID: <42C3009A.6020700@nrl.navy.mil>
Date: Wed, 29 Jun 2005 16:12:10 -0400
From: Dan Brown <dan.brown@nrl.navy.mil>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <42C03FFB.3080208@clarionsensing.com>	<42C04A65.5040804@ieee.org>	<42C180D4.1010607@clarionsensing.com>	<42C1A11A.2020108@ieee.org>	<42C1C3A3.5030007@clarionsensing.com>
	<42C2EAEE.8040204@clarionsensing.com>
	<42C2ECC4.1000705@nrl.navy.mil>
In-Reply-To: <42C2ECC4.1000705@nrl.navy.mil>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: alschult@eecs.berkeley.edu, Brian O'Dell <brian@clarionsensing.com>
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
> It's been a while since I've actually run DOCBoot (I've been working on 
> other stuff), so I just built and installed it on my device from the 
> latest CVS as a sanity check.  I get the same hard lockup as you do.
> 
> I'll let you know when I've found the problem.  Needless to say, I'm a 
> bit embarassed to have checked in code this broken and let it sit that 
> way in the repository for several months :(


OK, I found the issue; I was clobbering a register I shouldn't have.  I 
guess I must have made this change right before I committed the latest 
version and not properly tested it.

I'd appreciate feedback from anyone interested in using DOCBoot... does 
the latest CVS now work for you?

	-Dan
