Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17zdcP-0003Of-00
	for <linux-mtd@lists.infradead.org>; Thu, 10 Oct 2002 14:44:49 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F942WnIstaBE8v3dUh70001d6c9@hotmail.com> 
References: <F942WnIstaBE8v3dUh70001d6c9@hotmail.com> 
To: "vijay vijay" <vijay_peshkar@hotmail.com>
Cc: linux-mtd@lists.infradead.org, vijay.peshkar@wipro.com
Subject: Re: CFI and driver code for AM29LV320D ..newbie query 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 10 Oct 2002 14:44:44 +0100
Message-ID: <25416.1034257484@passion.cambridge.redhat.com>
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

vijay_peshkar@hotmail.com said:
>  Thanks. Do we have a list of devices supported by the mtd code?.
> Searching  thru the code,embeddedLinuxWorks.com/db.html and
> linux-mtd.infradead.org, am still unable to locate any reference (part
> number / device id?) to AM29LV320D while the rest of the AMD
> family(and rest of the families) seems to be there!!!.

> Please let me know what I am missing..

The whole point of CFI is that devices no longer need to be explicitly 
listed. It should work fine if it's CFI-compliant unless it's a random new 
CFI command set -- which it isn't; it's the standard AMD command set.


--
dwmw2
