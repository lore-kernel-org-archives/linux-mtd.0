Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.20 #2)
	id 14RuFf-0006pG-00
	for mtd-list@infradead.org; Sun, 11 Feb 2001 11:01:07 +0000
Received: from waltz.softhome.net ([204.144.231.7])
	by infradead.org with smtp (Exim 3.20 #2)
	id 14RuFd-0006p7-00
	for mtd@infradead.org; Sun, 11 Feb 2001 11:01:05 +0000
Message-ID: <20010211110027.22505.qmail@softhome.net>
References: <20010209160048.20512.qmail@softhome.net>
            <9992.981735020@redhat.com>
In-Reply-To: <9992.981735020@redhat.com>
From: oskaya@softhome.net
To: David Woodhouse <dwmw2@infradead.org>
Cc: mtd@infradead.org
Subject: Re: m-systems doc 2000 : no free space left 
Date: Sun, 11 Feb 2001 11:00:27 GMT
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>


   here i'm at work in order to grab the latest version from cvs and give
msystems flashdisk a try ...
   I have downloaded the latest version using cvs  commands found in mtd
home page . At first i tried to compile it by typing make at the source
directory . It gave some errors related to something is not defined . Then
i decided to compile it by putting it in the kernel with applying
patchin.sh and building it as module . I was able to compile the modules .
I run insmod command in the order provided in a previous mail . It finds
Diskonchip at 0xd6000 address . The same things occurred . It has gone to a
deadlock while making filesystem . The message is below :

writing superblocks and filesystem accounting information : Argh ! No free
blocks found ! LastFreeEUN=3068 FirstEUN = 32768 .

M-Systems DiskOnChip driver...
Using configured probe address 0xd6000
DiskOnChip 2000 found at address 0xd6000
Cannot calculate an NFTL geometry to match size of 0xbba0.
Using C:1000: H:16 S:3 ( == 0xbb80 sects)



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
