Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 161bfm-0002A7-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Nov 2001 22:59:54 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <2178200CCE4ED311974300A0CC4263FB143612@accounting> 
References: <2178200CCE4ED311974300A0CC4263FB143612@accounting> 
To: jglennon@getntds.com
Cc: linux-mtd@lists.infradead.org
Subject: Re: I still do not see how it (fails to) get from cfi_probe into cfi_cmdset_0002 ? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 07 Nov 2001 23:09:15 +0000
Message-ID: <20169.1005174555@redhat.com>
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

jglennon@getntds.com said:
> I have re-read the HOW_TO!  Is do_cfi_probe now replaced by
> do_map_probe?  I AM doing the "you have to dive into the routine
> 'do_cfi_probe()' I think...! 

Hmmm. Double-check that the flash really is wired up the way you think it 
is, that it really is CFI-compliant chips, and that you don't have some 
special board-specific protection on the WE line - sometimes you need to 
turn a GPIO pin on to enable write cycles, etc. 



--
dwmw2
