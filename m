Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 12UXim-0003dH-00
	for mtd-list@infradead.org; Mon, 13 Mar 2000 16:29:32 +0000
Received: from colo.asti-usa.com ([205.252.89.99] ident=root)
	by infradead.org with esmtp (Exim 3.03 #1)
	id 12UXik-0003dB-00
	for mtd@infradead.org; Mon, 13 Mar 2000 16:29:30 +0000
Received: from zentropix.com ([195.166.67.91])
	by colo.asti-usa.com (8.9.3/8.9.3) with ESMTP id LAA27028
	for <mtd@infradead.org>; Mon, 13 Mar 2000 11:34:41 -0500
Message-ID: <38CD17D1.8E4447E6@zentropix.com>
Date: Mon, 13 Mar 2000 16:31:13 +0000
From: Trevor Woolven <trevw@zentropix.com>
MIME-Version: 1.0
To: MTD <mtd@infradead.org>
Subject: Reviving DOCs
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>

Firstly, thanks to everyone for their help and advice.
Secondly, I appear to have found another way...

	nftl_format /dev/mtd0
	fdisk /dev/nftla	(sometimes a reboot is needed first)
	mke2fs /dev/nftla1	(I only create one partition on the DOC at present)

Now, so far this method appears to have revived three DOC2000 devices.
I've got a few more to try yet and so the chicken count hasn't started
but so far so good.

I haven't used docpmap to revive a DOC:

	docpmap /br /f:<filename>	to get an image of a 'virgin' DOC
	docpmap /bw /f:<filename>	to write virgin image onto 'broken' DOC

...because I haven't got any 'virgin' devices left (oops!) and I needed
to rebuild a kernel with MSDOS fs support (somewhere to store the image
files) and I couldn't be bothered.

DW's idea of using nanddump needs (I believe) a utility to write the
image back onto the DOC. I've hacked nanddump into nandput but have yet
to try it out. Is it worth it?????

Cheers

Trev.	(Much happier now)
-- 
Trevor Woolven - Director of Customer Applications Engineering
Zentropix Inc - a Lineo company

Tel: +44 (0)1273 234 647	 Fax: +44 (0)1273 704 482

Visit http://www.zentropix.com/ for Real Time Linux Tools
Visit http://www.realtimelinux.org/ for Real Time Linux Information


To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
