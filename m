Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17zbsh-0003BS-00
	for <linux-mtd@lists.infradead.org>; Thu, 10 Oct 2002 12:53:31 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20021010114147.GB9941@tkeitel001.bln.gelonet.local> 
References: <20021010114147.GB9941@tkeitel001.bln.gelonet.local>  <009701c27036$ee169f00$9000010a@paulwong> 
To: Tino Keitel <tino.keitel@innominate.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: help! compile error 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 10 Oct 2002 12:53:29 +0100
Message-ID: <10847.1034250809@passion.cambridge.redhat.com>
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

tino.keitel@innominate.com said:
>  IIRC this is a binutils<->kernel issue that has nothing to do with
> the mtd source. 

Nah. Something needs __devexit_p() but as it's been discussed so many times 
elsewhere I can't be bothered to respond. Although I should fix it in CVS 
at some point I suppose.

--
dwmw2
