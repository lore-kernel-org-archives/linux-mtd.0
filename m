Received: from tesla.selinc.com ([12.110.71.2])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JtVJj-000748-F6
	for linux-mtd@lists.infradead.org; Tue, 06 May 2008 22:07:24 +0000
In-Reply-To: <20080504221951.163ba145@zod.rchland.ibm.com>
To: Josh Boyer <jwboyer@linux.vnet.ibm.com>
Subject: Re: nand flash's size overflow
MIME-Version: 1.0
Message-ID: <OF49461F52.A0F6064A-ON88257441.00793764-88257441.007983D1@selinc.com>
From: Bruce_Leonard@selinc.com
Date: Tue, 6 May 2008 15:07:16 -0700
Content-Type: text/plain; charset="US-ASCII"
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> > Hi,all
> >    is there an official way to solve this problem?
> 
> Provide patches to convert the MTD subsystem to overcome the limit of
> using a 32bit variable to store size/offset in a sane manner.
> 
> This is getting asked often enough that it should be an FAQ.
> 
> josh
> 

Josh,

I was the first one to raise this issue a couple of months ago, and 
fortunately I've finally convinced my company that all the hack jobs we 
kept coming up with to avoid fixing this were a waste of time.  Once I 
wrap up some work I've got in progress I'm going to start working on a 
solution.  Hopefully get started in about a week.  Stand by for questions 
;-).

Bruce
