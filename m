Received: from user11.ucall.net ([63.126.131.11] helo=guinan.diversehost.net)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 17eJX1-0004oP-00
	for <linux-mtd@lists.infradead.org>; Mon, 12 Aug 2002 19:03:07 +0100
Subject: kernel won't load root on doc millenium
From: Glen <mtd@empireenterprises.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Date: 12 Aug 2002 14:02:19 -0400
Message-Id: <1029175339.2250.36.camel@glen>
Mime-Version: 1.0
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

I'm not sure whether my problem is a mtd issue or not, but here goes.  


I finally have grub booting off the doc millenium.  
I achieved this by compiling grub with the grub-0.92 mtd patch.  
I then loaded the grub_firmware from the grub-0.92/stage1 directory onto
the doc using the mtd supplied doc_loadbios utility.  

Then, using, the mtd supplied nftl_format command, starting at offset
106496.  
(./nftl_format /dev/mtd/0 106496)  

I had been running nftl_format at offset 98304, however grub would never
load after that.  So, after running nftl_format, I rebooted (mtd is
loaded within the kernel), and then ran fdisk to partition the doc.  

This is all working fine, and I have my teeny linux filesystem on the
doc.  Grub loads, boots the kernel off of the doc, and then reports the
same message it always does when it loads an ext3 filesystem, then
stops.  

No error messages like "cannot mount root" or "i want to scream" or
"kernel panic" or anything.  

It just stops and sits there, mocking me.  

I originally thought this may have had something to do with my using
devfs.  I was specifying /dev/nftl/disc0/part1 as root within grub, and
I also tried writing it to the kernel with rdev.  No results.  

So I created the devices (mknod /dev/nftla b 93 0 and mknod /dev/nftla1
b 93 1) on the doc filesystem and mounted the kernel without devfs.  

Still nothing.  
I'm at odds as to the cause of the problem. I though possibly that it
could have been a problem with init, so I removed init from the
filesystem and tried again -- this should have at least given me another
error message -- no change.  This prompts me to think it is an mtd
issue, specifically because I have an exact duplicate of the doc root
filesystem on a 10M ide partition; it loads perfectly.  

Ideas..??


-g


~~
It felt like the entire ship was a party, and she was the pooper
thereof.  
--Peter David
