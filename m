Received: from gateway-1237.mvista.com ([12.44.186.158] helo=av.mvista.com)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1C71oT-00076E-PW
	for linux-mtd@lists.infradead.org; Mon, 13 Sep 2004 21:08:55 -0400
Message-ID: <4146449D.8030305@mvista.com>
Date: Mon, 13 Sep 2004 18:08:45 -0700
From: Todd Poynor <tpoynor@mvista.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <4123FE19.9000109@mvista.com>
	<1092904045.3777.69.camel@imladris.demon.co.uk>
In-Reply-To: <1092904045.3777.69.camel@imladris.demon.co.uk>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtdblock cache flush at remount
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:
> I don't care much, but if you see a way to make sync() have the desired
> effect I wouldn't be averse to it.

I took a look, and don't see a good way to fix this short of modifying 
generic code that requires a commit to media (like remount read-only and 
sync).  The modifications might call the block device layer to sync 
things from its standpoint, such as issuing a BLKFLSBUF ioctl.  If 
mtdblock is unique in that it does not necessarily write a block to 
stable storage when the block layer issues a write then this is not 
likely to gain much interest.  It's possible that the IDE drivers might 
want to flush disk hardware buffers in such a situation as well, much 
like what occurs at suspend and shutdown, but I haven't looked into that 
yet.  Thanks,

-- 
Todd Poynor
MontaVista Software
