Received: from [2002:c1ed:8229::1] (helo=baythorne.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1B39fe-0003UO-U3
	for linux-mtd@lists.infradead.org; Tue, 16 Mar 2004 08:11:31 +0000
From: David Woodhouse <dwmw2@infradead.org>
To: Brad Campbell <brad@wasp.net.au>
In-Reply-To: <405686B3.4090607@wasp.net.au>
References: <002901c406cb$3c049ec0$fd0ba8c0@briantpc>
	 <1079387201.5835.344.camel@imladris.demon.co.uk>
	 <405686B3.4090607@wasp.net.au>
Content-Type: text/plain
Message-Id: <1079424685.5835.404.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Tue, 16 Mar 2004 08:11:25 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: free_list / free_size messages
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-03-16 at 08:46 +0400, Brad Campbell wrote:
> I have seen this a bit on my iPAQ 3800 with a familiar 2.4.19-hh36 kernel. I just guessed it was 
> informative and I tend to ignore it. Should I try and reproduce it for debugging?

Yes please. It should be harmless; it's just an accounting screwup. We
seem to have placed a block on the free_list which doesn't actually have
any significant amount of free space in it at all.

-- 
dwmw2
