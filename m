Received: from fish.redhat.com ([213.86.99.237]
	helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19cM0E-0000ek-D6
	for <linux-mtd@lists.infradead.org>; Tue, 15 Jul 2003 10:21:42 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: "Mike G." <gohas@actinium.org>
In-Reply-To: <1058260708.5914.4.camel@localhost.localdomain>
References: <1058249854.1031.24.camel@localhost.localdomain>
	 <1058251000.2262.114.camel@imladris.demon.co.uk>
	 <1058260708.5914.4.camel@localhost.localdomain>
Message-Id: <1058260908.27293.63.camel@passion.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 15 Jul 2003 10:21:49 +0100
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: help installing MTD
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2003-07-15 at 10:18, Mike G. wrote:
> I have try to use the new kernel 2.4.20 .. Somehow it doesn't work on
> the custom board. So i m back to the ancient kernel. 

Find out why. Fix it. Seriously. Using 2.4.4 is likely to cause you more
trouble in the long term.

> I did used the patch now the compling complaint the exactly as you said
> "kernel too old" *sigh* 
> > 
> > If you really do stay with 2.4.4 you'll probably need some surgery on
> > linux/mtd/compatmac.h to make it support kernels that ancient again.
> ok ok  if i were to do surgery, wat changes i hav to do. 

If you really must do this, then start by taking an older copy of
compatmac.h from CVS, from before I removed all the support for ancient
kernels. Drop that in place of the current one and then fix up the stuff
that still breaks. 

-- 
dwmw2
