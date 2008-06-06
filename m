Date: Fri, 6 Jun 2008 15:01:05 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: =?ISO-8859-15?Q?J=F6rn_Engel?= <joern@logfs.org>
Subject: Re: [RFC/PATCH 2/3] NAND multiple plane feature
In-Reply-To: <20080605210929.GB19234@logfs.org>
Message-ID: <alpine.LFD.1.10.0806061448270.26291@pentafluge.infradead.org>
References: <alpine.LFD.1.10.0805281342150.23606@pentafluge.infradead.org>
	<20080601174841.GH13094@logfs.org>
	<alpine.LFD.1.10.0806031754030.32134@pentafluge.infradead.org>
	<20080605210929.GB19234@logfs.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: linux-mtd@lists.infradead.org, tglx@linutronix.de, dwmw2@infradead.org,
	vasiliy.leonenko@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> On Tue, 3 June 2008 17:57:35 +0100, Alexey Korolev wrote:
> > 
> > We did some performance testing for this feature: we did not find a test
> > case where JFFS2 on NAND with dual-plane has lower performance than
> > JFFS2 on NAND without dual-plane features. (note: subpage read feature
> > was enabled for both cases)
> 
> Maybe I have a testcase for you.  The "evil workload".
> 
> 1. Write a file until you get -ENOSPC.
> 2. Replace 1000 page-sized page-aligned blocks at random offsets.
> 
> The time for 2 should roughly double with bigger eraseblocks.
> 
> [ And yes, I originally got this testcase from you. ;) ]
We just tried to check your scenario. It is not
possible to overwrite something if JFFS2 returned -ENOSPC until
something got deleted. 

In fact our test suite do not include this test case. We have another.
Write file1 at about 5% of whole space, write file2 for rest of space.
Delete file1. Do step 2. 
In this not so good case we got the following numbers:

single-plane:
73 sec 424541 usec

dual-plane:
69 sec 428637 usec

Thanks,
Alexey 
