Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 178Mrn-0003hz-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 May 2002 16:08:31 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <20020516144608.86328.qmail@web21509.mail.yahoo.com> 
References: <20020516144608.86328.qmail@web21509.mail.yahoo.com> 
To: Studying MTD <studying_mtd@yahoo.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: FAT for NAND Flash 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 16 May 2002 16:08:17 +0100
Message-ID: <20085.1021561697@redhat.com>
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

studying_mtd@yahoo.com said:
> To use JFFS2 with NAND, currently we use four layers
> of software :-
> 
> A. JFFS2: filesystem driver 
> B. MTD: Memory Technology Devices driver 
> C. NAND: generic NAND driver 
> D. Hardware specific driver 
> 
> If i want to use FAT with NAND then i have to use :-
> 
> A. FAT: filesystem driver 
> B. Translation: Translation layer
> C. MTD: Memory Technology Devices driver 
> D. NAND: generic NAND driver 
> E. Hardware specific driver 
> 
> So i have to add only Translation layer, rest layers
> will remain same.
> 
> Am i right ? If not, please correct me.

Basically, yes. Some of those layers are so small they probably shouldn't 
be included -- the 'MTD' layer only really allows MTD 'users' such as JFFS2 
and the translation layers to find MTD 'device' such as the flash chip 
drivers -- it doesn't get involved after passing a pointer to the access 
methods.


> How can i write traslation layer , any reference.

Look at the FTL and NFTL code in drivers/mtd/ . Also look at the sddr09 
driver for USB SmartMedia readers -- I think that has some of the actual 
SmartMedia format implemented. 

> Are you supporting SmartMedia DOS-FAT .
> From where i can get sources for SmartMedia DOS-FAT ,
> Linux tree , your CVS or some where else.

We don't support the SmartMedia translation layer yet. Many people have 
talked about implementing it; nobody's yet shown me code. There is some 
code which may be useful in the SDDR-09 driver for USB SmartMedia readers, 
though. 

--
dwmw2
