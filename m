Received: from dsl-64-129-131-125.telocity.com
	([64.129.131.125] helo=mir.outpostsentinel.com ident=root)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fsrI-0005xW-00
	for <linux-mtd@lists.infradead.org>; Wed, 27 Feb 2002 01:26:16 +0000
From: "Chris Fowler" <cfowler@outpostsentinel.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Cc: <linux-mtd@lists.infradead.org>
Subject: RE: Testing MTD driver 
Date: Tue, 26 Feb 2002 20:38:44 -0500
Message-ID: <NFBBLCEFBCFEPMJJKOIKOENJCDAA.cfowler@outpostsentinel.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: 7bit
In-Reply-To: <10878.1014773364@redhat.com>
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

How about the M-SYS as module and MTD as compiled in?  Will that work?  

-----Original Message-----
From: David Woodhouse [mailto:dwmw2@redhat.com]On Behalf Of David
Woodhouse
Sent: Tuesday, February 26, 2002 8:29 PM
To: Chris Fowler
Cc: linux-mtd@lists.infradead.org
Subject: Re: Testing MTD driver 



cfowler@outpostsentinel.com said:
> I would like to begin migrating to the OpenSource DOC2000 driver.  I'm
> uning kernel 2.4.17 and would like to have the M-SYS driver installed
> as weel as the OpenSource one.  I will test with the OS one then
> remove M-SYS.  Will this be a problem? 

Compiling each as a module, and loading either one or the other, should be 
fine. Be aware that the major numbers are different, though.

--
dwmw2
