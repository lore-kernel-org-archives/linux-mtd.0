Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17cUpC-0002ES-00
	for <linux-mtd@lists.infradead.org>; Wed, 07 Aug 2002 18:42:22 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <957BD1C2BF3CD411B6C500A0C944CA2601499C3D@pdsmsx32.pd.intel.com> 
References: <957BD1C2BF3CD411B6C500A0C944CA2601499C3D@pdsmsx32.pd.intel.com> 
To: "Yuan, Cain" <cain.yuan@intel.com>
Cc: "'linux-mtd@lists.infradead.org'" <linux-mtd@lists.infradead.org>
Subject: Re: JFFS2 peoblems with K3 strata flash on Dalhart 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 07 Aug 2002 18:42:21 +0100
Message-ID: <11201.1028742141@redhat.com>
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

cain.yuan@intel.com said:
> Please notice the fact:  
>    at the first,  I burn JFFS2  into K3  flash, then load zImage It
> boot up all ok, and   JFFS2 file system are all OK. 

OK... and you can write to it too? What if you reset the board between 
flashing the image and booting Linux?

> But after reset and load zImage again  I can't create/del  files on 
> JFFS2 file system.

Strange. I'm wondering if perhaps the map driver isn't correctly setting 
the Vpp line, but again you should get an _error_ for that, not a zero 
return status. So even if the underlying fault doesn't lie with the write 
routine, it seems to be doing _something_ wrong. 

--
dwmw2
