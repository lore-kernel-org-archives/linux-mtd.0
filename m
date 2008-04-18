Date: Fri, 18 Apr 2008 16:02:50 +0100 (BST)
From: Alexey Korolev <akorolev@infradead.org>
To: =?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
Subject: Re: cfi_cmdset_0001.c: Excessive erase suspends
In-Reply-To: <4807B552.7090501@users.sourceforge.net>
Message-ID: <Pine.LNX.4.64.0804181554230.27235@pentafluge.infradead.org>
References: <4807B552.7090501@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Cc: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Anders,

> With recent kernels I've been seeing a lot of these
> "Newly-erased block contained word 0xffff0000 at offset 0x00180000"
> on a board using Intel 28F640J5 flash chips.
> 
> It looks like the errors are caused by large amounts of erase suspends.
> Each erase gets suspended around 8500 times and in some extreme cases
> a lot more. The erase ends without any error bits set but it turns out
> that it has failed.
> 
> It seems like some flash chips have a limit on the number of times that
> the erase can be suspended. I have not seen any information on the Intel
> chips but a Spansion AppNote says 5,980 times for some of their devices
> before running the risk of an erase fail.
> 
We saw the similar  problem in our tests. As a possible solution I could
suggest to disable erase suspend on write. 

Regarding limit of suspend/resume cycles: it is rather unclear how many cycles would be ok how many cycles would be not. 
Special investigations are required here. 

Thanks,
Alexey
