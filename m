Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 14vn6S-0003CI-00
	for <linux-mtd@lists.infradead.org>; Fri, 04 May 2001 22:27:08 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <NEBBIDMHCLDPHDHEGDMLGEGJCBAA.jasonw@uswo.net> 
References: <NEBBIDMHCLDPHDHEGDMLGEGJCBAA.jasonw@uswo.net> 
To: "Jason Walker" <jasonw@uswo.net>
Cc: "MTD Mailing List" <linux-mtd@lists.infradead.org>
Subject: Re: MTD and 2.4 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 04 May 2001 22:27:28 +0100
Message-ID: <29965.989011648@redhat.com>
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

jasonw@uswo.net said:
>  I did as you said, enabled CONFIG_MTD_DOC2001 and checked out the
> #define in docprobe.c and it was already enabled. 

> request_module[doc2000]: Root fs not mounted

Argh. Sorry, _disable_ DOC_SINGLE_DRIVER and use doc2001.
The less likely to work alternative is to leave it _enabled_ and use 
doc2000. The message above is because it's trying to load the doc2000 
driver, because DOC_SINGLE_DRIVER is enabled and the doc2000 option isn't 
(only the doc2001 option).

This will be made less complex - the DOC_SINGLE_DRIVER is an attempt to 
merge it all into one, but some people still find the doc2001 driver to be 
more reliable.

--
dwmw2
