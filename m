Received: from web21505.mail.yahoo.com ([66.163.169.16])
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 178kXP-00066A-00
	for <linux-mtd@lists.infradead.org>; Fri, 17 May 2002 17:25:03 +0100
Message-ID: <20020517161920.75017.qmail@web21505.mail.yahoo.com>
Date: Fri, 17 May 2002 09:19:20 -0700 (PDT)
From: Studying MTD <studying_mtd@yahoo.com>
Subject: Re: FAT for NAND Flash 
To: David Woodhouse <dwmw2@infradead.org>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
In-Reply-To: <2284.1021646359@redhat.com>
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

To use FAT filesystem for NAND flash i need :-

A. FAT: filesystem driver 
B. Translation: translation layer on the NAND flash to
make it emulate a normal hard drive
C. MTD: Memory Technology Devices driver (MTD Block)
D. NAND: generic NAND driver
E. Hardware specific driver (Plus NFTL)

am i right ? Please correct me as i am still learning
MTD's model.

yes, i can understand that NAND Flash Translation
Layer(NFTL) and Translation layer for FAT are in
different layers.

but is it possible to make FAT filesystem for NAND
flash like this :-

A. FAT: filesystem driver 
B. Translation: translation layer on the NAND flash to
make it emulate a normal hard drive (with NFTL)
C. MTD: Memory Technology Devices driver (MTD Char)
D. NAND: generic NAND driver 
E. Hardware specific driver (without NFTL)

Thank you for your help.

--- David Woodhouse <dwmw2@infradead.org> wrote:
> 
> studying_mtd@yahoo.com said:
> >  I was asking these question because you told me
> that i have to add
> > translation layer for FAT. what i was thinking
> that, is it possible
> > that if i write only one translation layer which
> will be good for FAT
> > as well as it will replace NFTL.
> 
> I don't understand what you're trying to say. Please
> could you rephrase it, 
> preferably not making any reference at all to FAT,
> ext2, reiserfs or 
> anything else which is not relevant because it's
> handled by an entirely 
> separate layer.
> 
> --
> dwmw2
> 
> 
> 
>
______________________________________________________
> Linux MTD discussion mailing list
>
http://lists.infradead.org/mailman/listinfo/linux-mtd/


__________________________________________________
Do You Yahoo!?
LAUNCH - Your Yahoo! Music Experience
http://launch.yahoo.com
