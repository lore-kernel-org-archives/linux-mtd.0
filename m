Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17zbyz-0003C7-00
	for <linux-mtd@lists.infradead.org>; Thu, 10 Oct 2002 13:00:01 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F180uwd3bQLWpt71lUC00020b01@hotmail.com> 
References: <F180uwd3bQLWpt71lUC00020b01@hotmail.com> 
To: "vijay vijay" <vijay_peshkar@hotmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: CFI and driver code for AM29LV320D ..newbie query 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 10 Oct 2002 12:59:56 +0100
Message-ID: <11388.1034251196@passion.cambridge.redhat.com>
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
> Have a query. Can I get CFI and driver code for AM29LV320D anywhere?.
> Going thru AMD site found some cfi code, but it didn't have reference
> to this flash.

The whole point in CFI is that you don't _need_ to have a specific 
reference to the chip in question. The standard Linux drivers should drive 
it just fine.

With the exception that AMD managed to screw up the CFI table on some of 
the chips -- but we work around that.

--
dwmw2
