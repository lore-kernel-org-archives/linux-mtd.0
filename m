Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 143N3B-0001Fr-00
	for mtd-list@infradead.org; Tue, 05 Dec 2000 18:42:49 +0000
Date: Tue, 5 Dec 2000 13:42:42 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: <ian.nelson@echostar.com>, "mtd@infradead.org" <mtd@infradead.org>
Subject: Re: Possibly a FAQ or stupid question 
In-Reply-To: <8883.976037403@redhat.com>
Message-ID: <Pine.LNX.4.30.0012051340230.2601-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Tue, 5 Dec 2000, David Woodhouse wrote:

>
> ian.nelson@echostar.com said:
> > Can I just dd to the flash?  Assuming that my AMD flash works with CFI...
>
> No. you have to use the MEMERASE ioctl first.

Well...  not if using /dev/mtdblock.

To update my kernel in flash I simply use

	cp zImage /dev/mtdblock1


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
