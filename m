Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12X9bd-000435-00
	for mtd-list@infradead.org; Mon, 20 Mar 2000 21:20:57 +0000
Received: from out4.prserv.net ([32.97.166.34] helo=prserv.net)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12X9ba-00042f-00
	for mtd@infradead.org; Mon, 20 Mar 2000 21:20:54 +0000
From: "Dvir Oren" <dviro@hotpop.com>
To: MTD <mtd@infradead.org>
Date: Mon, 20 Mar 2000 23:20:01 +0200
MIME-Version: 1.0
Content-type: text/plain; charset=US-ASCII
Content-transfer-encoding: 7BIT
Subject: (Fwd) LILO to use with MTD
Message-Id: <E12X9ba-00042f-00@infradead.org>
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>


------- Forwarded message follows -------
From:           	Dvir Oren <dviro@ibm.net>
To:             	MTD <mtd@infradead.org>
Subject:        	LILO to use with MTD
Date sent:      	Mon, 20 Mar 2000 21:51:43 +0200

I will tomorrow post a patched lilo that should work with /dev/nftla,
and has been partially tested to work (my file systems keeps 
getting
corrupt, so LILO can't find boot.b, but it worked one time at least). 
The boot.b file should be the same as the boot.b file that worked 
with
M-Systems'.  In fact, I think you could run the patched lilo that I
previously posted here using M-Systems' drivers, to boot a kernel 
with
MTD.  Nonetheless, tomorrow I'll post a lilo that can work both with
/dev/fla and with /dev/nftla.

As for GRUB - is it usable?
And why use GRUB instead of LILO?

(Again - tomorrow I'll send the files)

------- End of forwarded message -------
---------------
Dvir Oren
<dviro@hotpop.com>
<http://thor.prohosting.com/~dviro>



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
