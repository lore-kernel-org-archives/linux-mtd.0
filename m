Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15rMN7-0002UN-00
	for <linux-mtd@lists.infradead.org>; Wed, 10 Oct 2001 17:38:17 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <3BC47ADD.504E81C3@airfiber.com> 
References: <3BC47ADD.504E81C3@airfiber.com>  <Pine.LNX.4.21.0110101821350.18912-100000@lxserver.deltes.cz> <22822.1002731498@redhat.com> 
To: Tom McMillan <tsm@airfiber.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Eraseblock size in jffs2 ? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 10 Oct 2001 17:47:26 +0100
Message-ID: <24225.1002732446@redhat.com>
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

tsm@airfiber.com said:
>  Where, exactly?  Or at least, a starting point.  I've just started
> looking into using JFFS2 with my DOC2000s.

Firstly, you need to deal with the restrictions imposed by NAND flash - 
you can only make ten individual write() calls to any given 512-byte page 
before the contents of that page become undefined until the next erase. 
Because dirent nodes are quite small, it's feasible that you could try to 
fit more than ten of them in a single page - basically, on the tenth write 
you need to also pad to the end of the page with free space.

Secondly, you want ECC on the nodes instead of just a CRC - you want to be 
able to _correct_ errors instead of just complaining about them.

That's quite a simple addition and can be implemented and tested without 
even playing with real hardware. Define two new node types and make the 
code deal with them accordingly. The actual ECC code is easy enough - 
there's plenty of example code around, including some in nand/nand_ecc.c.


--
dwmw2
