Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12XKXG-0005iB-00
	for mtd-list@infradead.org; Tue, 21 Mar 2000 09:01:10 +0000
Received: from gate.mvhi.com ([194.205.184.34] helo=server.axiom.internal)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12XKXF-0005i5-00
	for mtd@infradead.org; Tue, 21 Mar 2000 09:01:09 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <E12X9bX-00042l-00@infradead.org> 
References: <E12X9bX-00042l-00@infradead.org> 
To: Dvir Oren <dviro@ibm.net>
Cc: mtd@infradead.org
Subject: Re: Questions about MTD 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 21 Mar 2000 09:01:08 +0000
Message-ID: <30814.953629268@devel2.axiom.internal>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


dviro@ibm.net said:
>  When I do dd if=/dev/nftla of=some_file bs=512 count=1, what do I
> get?

This goes through the NFTL translation code, and you get the boot sector of 
the simulated hard disk.


> When I do dd if=/dev/mtd0 of=some_file bs=512 count=1, what do I
> get? 

The first 512 bytes of the raw data on the flash, which is the start of the 
firmware bootloader.


dviro@ibm.net said:
> Suppose I take a brand new flash, run nftl_format /dev/mtd0 49152. 
>  I then run fdisk /dev/nftla to create the partition, and then mke2fs
> /dev/nftla1, and then reboot, or remove the modules, and then  insert
> them.  When I'll mount /dev/nftla1, it will be trashed.  Before I
> took out the module, I could mount, e2fsck, or whatever, and
> everything was fine. 

You need to remove the NFTL module before using nftl_format, and then load it 
again afterwards. The NFTL code caches a lot of data about what blocks are 
stored where on the flash, and if you reformat the NFTL while it's loaded, 
you're going to confuse the hell out of it.


dviro@ibm.net said:
>  Then what should I pass doc_loadbios, and why not simply dd (and  to
> where should I dd, and from where should I dd)? 

doc_loadbios is almost the same as dd - it just erases the blocks before 
writing to them. 

You need to convert the DOC121.EXB file into the form in which it actually 
takes on the flash. It's probably easier to explain in pseudo-C than English:

	u_char buf[512];

	memset(buf,255,512);

	/* Split up the first 4Kb of data over the first 8Kb of flash */

	while (x<8192) {
		read(0,buf,256);
		write(1,buf,512);
		x += 512;
	}

	/* Add the rest */

	while (!eof) {
		read(0,buf,512);
		write(1,buf,512);
	}
	

I'm not sure if this is right, but it's something like that. Try comparing 
what you get by dd'ing 48Kb _from_ /dev/mtd0 with the data in the file.

--
dwmw2




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
