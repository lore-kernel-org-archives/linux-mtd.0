Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 182W1n-0005Q7-00
	for <linux-mtd@lists.infradead.org>; Fri, 18 Oct 2002 13:14:55 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20021018104910.GA11807@jupiter> 
References: <20021018104910.GA11807@jupiter> 
To: Frank Neuber <neuber@convergence.de>
Cc: linux-mtd@lists.infradead.org
Subject: Re: parse_cmdline_partitions equivalent for map_info 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 18 Oct 2002 13:14:48 +0100
Message-ID: <26791.1034943288@passion.cambridge.redhat.com>
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

neuber@convergence.de said:
> Now I'm looking for the same feature to pass the physically
> informations to the kernel (struct map_info). I could add this simply
> to the cmdline.c file based on the parse_cmdline_partitions function.

That seems like a relatively sensible addition to physmap.c. You could make 
it take the probe type that way too...

 'physmap=0xe0000000,0x100000,16,cfi'

--
dwmw2
