Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fsjb-0005wj-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Feb 2002 01:18:19 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <NFBBLCEFBCFEPMJJKOIKOENICDAA.cfowler@outpostsentinel.com> 
References: <NFBBLCEFBCFEPMJJKOIKOENICDAA.cfowler@outpostsentinel.com> 
To: "Chris Fowler" <cfowler@outpostsentinel.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Testing MTD driver 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 27 Feb 2002 01:29:24 +0000
Message-ID: <10878.1014773364@redhat.com>
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

cfowler@outpostsentinel.com said:
> I would like to begin migrating to the OpenSource DOC2000 driver.  I'm
> uning kernel 2.4.17 and would like to have the M-SYS driver installed
> as weel as the OpenSource one.  I will test with the OS one then
> remove M-SYS.  Will this be a problem? 

Compiling each as a module, and loading either one or the other, should be 
fine. Be aware that the major numbers are different, though.

--
dwmw2
