Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14mpi0-0003Yn-00
	for mtd-list@infradead.org; Tue, 10 Apr 2001 05:24:52 +0100
Message-ID: <3AD28A67.9D61C5AA@sis.com.tw>
Date: Tue, 10 Apr 2001 12:21:59 +0800
From: Ollie Lho <ollie@sis.com.tw>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
CC: Fabrizio Pollastri <pollastri@iriti.cnr.it>, mtd@infradead.org
Subject: sszie_t and loff_t V.S u_int32_t (Was Re: Problems with nftl_format)
References: <3AD17FC6.6A918EA0@iriti.cnr.it> <18147.986809264@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

David Woodhouse wrote:
> 
> pollastri@iriti.cnr.it said:
> > MEMWRITEOOB at 14200: Invalid argument
> 
> OK, I probably broke it when I changed the structures slightly to make
> sparc64 happy. Can you confirm or deny my suspicion that it broke on the
> 17th of March?
> 
> Does it start to work again if you recompile nftl_format against the new
> headers?
> 

David,
	I think the problem should be that you have changed the definition
of struct mtd_oob_buf. In older header file you have:

struct mtd_oob_buf {
        loff_t start;
        ssize_t length;  
        unsigned char *ptr;
};

and in newer header file:

struct mtd_oob_buf {
        loff_t start;
        ssize_t length;  
        unsigned char *ptr;
};

But you still use loff_t and ssize_t in mtd_ioctl in mtdchar.c

		ret = (mtd->write_oob)(mtd, buf.start, buf.length, &retlen, 			
databuf);

		if (copy_to_user((void *)arg + sizeof(loff_t), &retlen, 			
sizeof(ssize_t)))
			ret = -EFAULT;

Dose this cause any problem ??

Ollie


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
