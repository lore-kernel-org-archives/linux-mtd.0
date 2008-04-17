Received: from ernst.netinsight.se ([212.247.11.2])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jmasb-0003q1-Sl
	for linux-mtd@lists.infradead.org; Thu, 17 Apr 2008 20:38:50 +0000
Message-ID: <4807B552.7090501@users.sourceforge.net>
Date: Thu, 17 Apr 2008 22:38:42 +0200
From: =?ISO-8859-1?Q?Anders_Grafstr=F6m?= <grfstrm@users.sourceforge.net>
MIME-Version: 1.0
To: Linux-MTD Mailing List <linux-mtd@lists.infradead.org>
Subject: cfi_cmdset_0001.c: Excessive erase suspends
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With recent kernels I've been seeing a lot of these
"Newly-erased block contained word 0xffff0000 at offset 0x00180000"
on a board using Intel 28F640J5 flash chips.

It looks like the errors are caused by large amounts of erase suspends.
Each erase gets suspended around 8500 times and in some extreme cases
a lot more. The erase ends without any error bits set but it turns out
that it has failed.

It seems like some flash chips have a limit on the number of times that
the erase can be suspended. I have not seen any information on the Intel
chips but a Spansion AppNote says 5,980 times for some of their devices
before running the risk of an erase fail.

So I'm guessing that erase suspends need to be paced somehow?

/Anders
