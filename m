Received: from [202.177.17.107] (helo=donut.udomain.com.hk)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A5FMV-0006F2-7l
	for <linux-mtd@lists.infradead.org>; Fri, 03 Oct 2003 03:08:07 +0100
Message-ID: <3F7CD9CA.5090805@hectrix.com>
Date: Fri, 03 Oct 2003 10:07:06 +0800
From: Selwyn Tang <selwyn@hectrix.com>
MIME-Version: 1.0
To: edward jose <eaydjay@hotmail.com>
References: <Law15-F74mSknvh7wFI000062b3@hotmail.com>
In-Reply-To: <Law15-F74mSknvh7wFI000062b3@hotmail.com>
Content-Type: text/plain; charset=us-ascii
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

Hi Edward,

On 10/02/2003 02:54 PM, edward jose wrote:
> i don't know if any one else experience this, i have a doc2000 with linux 
> 2.4.17 kernel compiled with mtd and doc modules. i use the kernel to boot 
> the doc2000 everything is ok, but when i check the cpu load, it uses all the 

I experienced the same problem recently. I notice that whenever I try to
access the DOC, the process [nftla] starts to use up all the cpu time.
Right now I am suspecting that it is the problem with the filesystem on
the DOC. Sometimes, after running e2fsck on my ext2 partition on the
DOC, the problem just goes away. I have this problem both in 2.4.22 and
2.4.17, both patched with mtd snapshots of different dates. Therefore, I
 think it is a problem with the mtd driver.

Any ideas are appreciated.

Selwyn
