Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A5Ivn-0006hz-3n
	for <linux-mtd@lists.infradead.org>; Fri, 03 Oct 2003 06:56:48 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Selwyn Tang <selwyn@hectrix.com>
In-Reply-To: <3F7CD9CA.5090805@hectrix.com>
References: <Law15-F74mSknvh7wFI000062b3@hotmail.com>
	 <3F7CD9CA.5090805@hectrix.com>
Message-Id: <1065160480.16088.0.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Fri, 03 Oct 2003 06:54:41 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: high cpu usage using nftl for DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2003-10-03 at 10:07 +0800, Selwyn Tang wrote:
> Hi Edward,
> 
> On 10/02/2003 02:54 PM, edward jose wrote:
> > i don't know if any one else experience this, i have a doc2000 with linux 
> > 2.4.17 kernel compiled with mtd and doc modules. i use the kernel to boot 
> > the doc2000 everything is ok, but when i check the cpu load, it uses all the 
> 
> I experienced the same problem recently. I notice that whenever I try to
> access the DOC, the process [nftla] starts to use up all the cpu time.
> Right now I am suspecting that it is the problem with the filesystem on
> the DOC. Sometimes, after running e2fsck on my ext2 partition on the
> DOC, the problem just goes away. I have this problem both in 2.4.22 and
> 2.4.17, both patched with mtd snapshots of different dates. Therefore, I
>  think it is a problem with the mtd driver.

Boot with 'profile=1' and use readprofile to see where it's spending all
the CPU time. Note your driver must be built-in to the kernel for this.

-- 
dwmw2
