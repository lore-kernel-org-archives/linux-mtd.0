Received: from h139-142-224-7.gtcust.grouptelecom.net ([139.142.224.7])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16sXcr-0003Qg-00
	for <linux-mtd@lists.infradead.org>; Wed, 03 Apr 2002 00:23:41 +0100
Received: from athlon (24-66-30-3.gatewest-shaw.ca [24.66.30.3])
        by kynes.gatewest.net (8.12.1/8.12.0.Beta19/Debian 8.12.0.Beta19) with SMTP id g32NNcdu030461
        for <linux-mtd@lists.infradead.org>; Tue, 2 Apr 2002 17:23:39 -0600
Message-ID: <002101c1da9d$7294ce80$87657bc8@athlon>
From: "Derek Ross" <dross@iders.ca>
To: <linux-mtd@lists.infradead.org>
References: <015901c1d9a2$973ef720$87657bc8@athlon>  <30890.1017696947@redhat.com>
Subject: Re: Can cfi_cmdset.c functions be called by anybody? 
Date: Tue, 2 Apr 2002 17:23:50 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
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

Would it be possible for me to modify, or
add to, the function pointers in the mtd_info
struct, so there there are also non-blocking 
write and erase functions?

Thanks,
Derek.

----- Original Message ----- 
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Derek Ross" <dross@iders.ca>
Cc: <linux-mtd@lists.infradead.org>
Sent: Monday, April 01, 2002 3:35 PM
Subject: Re: Can cfi_cmdset.c functions be called by anybody? 


> 
> dross@iders.ca said:
> > This would be simplified if I were able to directly use the functions
> > from cfi_cmdset_0001.c.
> 
> > Are the functions available for any application to use, or are they
> > only available for device drivers? 
> 
> The read/write/erase functionality of the chip driver is presented to 
> userspace via the /dev/mtd[0123...] devices. Read and write work as 
> expected, and there's an ioctl to perform an erase.
> 
> --
> dwmw2
