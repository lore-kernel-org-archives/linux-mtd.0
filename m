Received: from darwaza.gdatech.com ([66.237.41.98])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GgOPj-0005ZL-Ao
	for linux-mtd@lists.infradead.org; Sat, 04 Nov 2006 11:30:43 -0500
Message-ID: <000801c7002e$88114fc0$99c8a8c0@jrakeshsw>
From: "Jagota Rakesh" <jrakesh@gdatech.com>
To: <s.balamurugan@gdatech.co.in>, <linux-mtd@lists.infradead.org>
References: <26116.202.144.30.226.1162630659.squirrel@mail.gdatech.co.in>
Subject: Re: doubts in creating jffs2 image
Date: Sat, 4 Nov 2006 08:30:25 -0800
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Helo bala,

To create a jffs2 image for NAND flash,

mkfs.jffs2 -l   //if u wanty to create for little -indian , it should 'b' if 
its  big-endian
                  -e 0x20000        //erase block size ..let us sectore size 
is 128Kb,
                  -no-cleanmarkers  //do not add clean markers to every 
erased block
                  -p 0x500000    //let us say u want to creat a total size 
of 5MB , ifur directory structure contains 3.3MB then rest of the thing is 
going to pad with 0xff
                 -r  /home/roots    //root file syte.m.here /home/rootfs 
contians the complete file system structure.......like use,bin,sbin,lib,etc, 
dev..etc..whatever u needed create a directory structure and put under 
rootfs.
                 -o image.jffs2      //this is the output hffs2 image with 
the name as image.jffs2

That should be sufficient. To get mkfs.jffs2 utility, u can download the mtd 
utils from net and compile it with x86 system, as you need to run the 
mkfs.jffs2 utility in x86 machine to create a jffs2 image.

Andto create a directory structure as shown as /home/rootfs, you neeed to 
put the lib for custom processor if its required, same way you should have 
all the bin. sbin files compiled with custom processor. And if the NAND 
flash is only to store some data  then you can have single directory under 
rootfs folder. In that case you wont need any lib, bin, sbin, lib, etc. dev 
folder etc.

        Best of luck!

Regards,
Rakesh Jagota





Regards,
Rakesh Jagota
----- Original Message ----- 
From: <s.balamurugan@gdatech.co.in>
To: <linux-mtd@lists.infradead.org>
Sent: Saturday, November 04, 2006 12:57 AM
Subject: doubts in creating jffs2 image


>
> Hello gurus,
>
>            I want to know what are the options to be specified when
> creating the jffs2 image for nand flash.
>
>            by
> bala
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
