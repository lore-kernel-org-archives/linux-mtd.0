Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14ub7U-0005Mv-00
	for <linux-mtd@lists.infradead.org>; Tue, 01 May 2001 15:27:16 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <m3hez6754y.fsf@DLT.linuxnetworx.com> 
References: <m3hez6754y.fsf@DLT.linuxnetworx.com>  <26353.988569497@redhat.com> 
To: ebiederman@lnxi.com (Eric W. Biederman)
Cc: linux-mtd@lists.infradead.org
Subject: Re: Flash driver probe/commandset separation. 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 01 May 2001 15:26:59 +0100
Message-ID: <16016.988727219@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


ebiederman@lnxi.com said:
>  I'm not certain seperating the jedec probe by manufacturer is
> necessary, and it wouldn't suprise me if ordering might be important
> in a jedec probe.  (If so we might only want to seperate the tables of
> chips).

There are many different ways of probing a chip to find out what its JEDEC 
ID is. This is the problem that CFI was designed to solve.

The probes we're referring to as 'jedec probe' are one method. There's 
another for Intel-compatible chips. PCMCIA devices often have the JEDEC IDs 
listed in the CIS. 

Once you have the JEDEC IDs, you can then pass control to the right command
set driver. But you need to do the right magic to probe for it first.


ebiederman@lnxi.com said:
>  I wonder if we need something like a revision parameter to the cmdset
> code, so we don't try to use new additions to the cmdset on old chips.

We have that already, to a certain extent. We do buffer writes on Intel 
chips only if we've already determined that the chips support it.


ebiederman@lnxi.com said:
>  And I would like to double check the bus size usages.  As last time I
> looked cfi_cmdset_002 would do 16 bit accesses on an 8 bit bus.   My
> mapping driver deliberately didn't implement 16 or 32 bit reads to so
> attempting to call them would oops the kernel.   Shoot me I need to
> merge my alpha mapping driver with the main mtd tree.  

Let them oops. They shouldn't ever get called. Does this mapping driver 
work on the SX164? I'm severely tempted... :)


ebiederman@lnxi.com said:
>  P.s.  What is the right way to merge my code with the main mtd tree? 

Send me patches and/or SSH keys.

--
dwmw2
