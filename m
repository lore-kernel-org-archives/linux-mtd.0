Received: from ip67-153-123-160.z123-153-67.customer.algx.net
	([67.153.123.160] helo=calypsoo.voxware.com)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1D4nbs-0000y0-Ak
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2005 17:06:57 -0500
Message-ID: <421FA178.1070103@voxware.com>
Date: Fri, 25 Feb 2005 17:06:48 -0500
From: "Craig A. Vanderborgh" <craigv@voxware.com>
MIME-Version: 1.0
To: Nicolas Pitre <nico@cam.org>
References: <Pine.LNX.4.62.0502251700220.25966@localhost.localdomain>
In-Reply-To: <Pine.LNX.4.62.0502251700220.25966@localhost.localdomain>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Kernel Panic w/Xscale (PXA255) & 2.6.10
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Nicolas Pitre wrote:

>On Fri, 25 Feb 2005, Craig A. Vanderborgh wrote:
>
>  
>
>>Our platform is a PXA-255 based SBC.  It is running kernel 2.6.10
>>    
>>
>*extremely*
>  
>
>>well, with one exception - when accessing a VIRGIN jffs2 filesystem,
>>    
>>
>we get a
>  
>
>>kernel panic.  We cannot get past this unless we reload our 2.4.27
>>    
>>
>kernel and
>  
>
>>let it do the initial JFFS2 setup stuff.  After reloading kernel
>>    
>>
>2.6.10,
>  
>
>>everything is then okay.  Just the uninitialized JFFS2 is a problem.
>>    
>>
>
>Are you using L18 Intel flash? If so you should consider applying the 
>latest fixes from MTD CVS.
>
>
>Nicolas
>
>  
>
Wow, sorry I forgot to mention this - we're using Intel K3 Strataflash - 
it's
2 32 MB K3 chips interleaved into one bank.

Regards,
craig vanderborgh
voxware incorporated
