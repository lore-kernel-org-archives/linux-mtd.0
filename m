Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18Xdpw-0004Hd-00
	for <linux-mtd@lists.infradead.org>; Sun, 12 Jan 2003 08:51:20 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1042352498.1998.19.camel@tp> 
References: <1042352498.1998.19.camel@tp> 
To: Federico Ferreres <fferreres@arrancar.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 on block devices 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Sun, 12 Jan 2003 09:21:26 +0000
Message-ID: <13805.1042363286@passion.cambridge.redhat.com>
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

fferreres@arrancar.com said:
>  * What is the maximun size jffs2 supports? I am using a 300MB image.
> Is there a recommended minimun?

The theoretical maximum is 4GiB. In practice, it'll get far too slow and 
take up far too much RAM before you get that far. I'm not sure what the 
_practical_ limit is.

The minimum is 6 erase blocks, at the moment. It reserves 5 for its garbage 
collection.

> * Is it too bad to "resize my image" by appending 0xFF's to it's end? 

No, that's fine. 

Out of interest, are you using the current code from CVS or the stable 
branch from the 2.4 kernel? The current code should mount a _lot_ faster.
How long does it take to mount?

--
dwmw2
