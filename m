From: tglx@linutronix.de (Thomas Gleixner)
Date: Fri, 14 Feb 2003 14:02:53 +0100
Subject: Initialising NAND OOB with Software ECC
In-Reply-To: <200302141136.29775.phil@river-bank.demon.co.uk>
References: <200302132020.02330.phil@river-bank.demon.co.uk>
 <200302141200.50767.tglx@linutronix.de>
 <200302141136.29775.phil@river-bank.demon.co.uk>
Message-ID: <200302141402.53443.tglx@linutronix.de>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

On Friday 14 February 2003 12:36, Phil Thompson wrote:
> What about the other elements of struct mtd_oob_buf, ie. start and ptr?
Ok, I forgot start.
> What about a pointer to the oob buffer?
I see, we need data too. :)
But then we should add two pointers, so you can hold two different buffers 
from userspace.
truct nand_ctrl {
	int	start;			// startadress 
	int	oob_select;	// selector for OOB usage
 	int	data_lenght;	// length of data
 	int	oob_length;	// length of oob-buffer
	int	data_ptr;		// pointer to data buffer
	int	oob_ptr;		// pointer to oob buffer
};

> > JFFS2 needs no oob buffer for write, but YAFFS does.
> JFFS2 doesn't need one for read either does it?
No, you can just use it if you're curious or, if you want to read a complete 
image with oob-data included, which could be useful for debugging ....

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx at linutronix.de
