Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15W4qa-00009p-00
	for <linux-mtd@lists.infradead.org>; Mon, 13 Aug 2001 00:40:44 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <200108122333.TAA14506@stone.tmok.com> 
References: <200108122333.TAA14506@stone.tmok.com> 
To: pla <pla@tmok.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: DOC2000 erase size of 16k? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Mon, 13 Aug 2001 00:46:05 +0100
Message-ID: <32503.997659965@redhat.com>
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

pla@tmok.com said:
> I have a problem with a DOC2000.  I use the 2.4.5 kernel, and the
> 20010807 MTD snapshot for the utils. 

Use the latest code. It may fix it.


pla@tmok.com said:
> Okay, I think, not a problem, the MTD-JFFS HowTo specifically says to
> run nftl_format for that problem. 

It shouldn't. Never run nftl_format unless you really have to.

--
dwmw2
