Received: from web21509.mail.yahoo.com ([66.163.169.58])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 178MWA-0003ds-00
	for <linux-mtd@lists.infradead.org>; Thu, 16 May 2002 15:46:10 +0100
Message-ID: <20020516144608.86328.qmail@web21509.mail.yahoo.com>
Date: Thu, 16 May 2002 07:46:08 -0700 (PDT)
From: Studying MTD <studying_mtd@yahoo.com>
Subject: Re: FAT for NAND Flash 
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
In-Reply-To: <15117.1021559057@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
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

--- David Woodhouse <dwmw2@infradead.org> wrote:
> 
> studying_mtd@yahoo.com said:
> >  1. Is it possible to use FAT filesystem with NAND
> Flash.
> 
> Not directly. You need to use a translation layer on
> the NAND flash to make 
> it emulate a normal hard drive, on which you can put
> any normal file system.
> 

To use JFFS2 with NAND, currently we use four layers
of software :-

A. JFFS2: filesystem driver 
B. MTD: Memory Technology Devices driver 
C. NAND: generic NAND driver 
D. Hardware specific driver 

If i want to use FAT with NAND then i have to use :-

A. FAT: filesystem driver 
B. Translation: Translation layer
C. MTD: Memory Technology Devices driver 
D. NAND: generic NAND driver 
E. Hardware specific driver 

So i have to add only Translation layer, rest layers
will remain same.

Am i right ? If not, please correct me.

How can i write traslation layer , any reference.


> > 3. What is the difference between SmartMedia
> DOS-FAT and ordinary Fat
> > filesystem. 
> 
> AFAIK nothing. SmartMedia has a translation layer
> just like FTL and NFTL, 
> and you put a normal FAT file system on top of that.
> 

Are you supporting SmartMedia DOS-FAT .
>From where i can get sources for SmartMedia DOS-FAT ,
Linux tree , your CVS or some where else.

Thank you for your help.


__________________________________________________
Do You Yahoo!?
LAUNCH - Your Yahoo! Music Experience
http://launch.yahoo.com
