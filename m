Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12sjNh-0001IR-00
	for mtd-list@infradead.org; Fri, 19 May 2000 10:47:45 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E12sTDL-0008GA-00@infradead.org> 
References: <E12sTDL-0008GA-00@infradead.org> 
To: eauth@infradead.org
Cc: cvs-notify@infradead.org
Subject: Re: MTD CVS update: 'mtd/include/linux sysdep-2.1.h sysdep-2.2.h' 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Fri, 19 May 2000 10:47:42 +0100
Message-ID: <19253.958729662@devel2.axiom.internal>
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


eauth@infradead.org said:
> An attempt to support 2.0 and 2.1 kernels for uClinux  and other
> systems where the latest kernel is not used. Until now, only the MTD
> core modules, mtdram.c and ftl.c are converted. The changes are
> centralized in the file sysdep-2.2.h. 

I'd rather this were done with the file linux/compatmac.h which has been 
introduced for this purpose into 2.2.15

I'd also like to do without constructs such as...

+#if LINUX_VERSION_CODE >= KERNEL_VERSION(2,2,0)
        if (mtd->module)
 	       __MOD_DEC_USE_COUNT(mtd->module);
+#endif

In the 2.0 compatmac.h, we can simply define __MOD_DEC_USE_COUNT() to do 
nothing, instead of making the check in mtd.h



--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
