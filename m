Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173CUz-0003IG-00
	for <linux-mtd@lists.infradead.org>; Thu, 02 May 2002 10:03:37 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3CD0F92C.3010306@bigpond.com> 
References: <3CD0F92C.3010306@bigpond.com> 
To: brendan.simon@bigpond.com
Cc: mtd <linux-mtd@lists.infradead.org>
Subject: Re: more docprobe.c 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 02 May 2002 10:03:30 +0100
Message-ID: <17502.1020330210@redhat.com>
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

brendan.simon@bigpond.com said:
> I think that the platform specific config option should be checked
> before (or within) the generic arch blocks. 

Needs to be done before CONFIG_MIPS, not any of the others unless they 
suddenly start making Ocelots with other CPUS.

--
dwmw2
