Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 13tYDs-0002UR-00
	for mtd-list@infradead.org; Wed, 08 Nov 2000 16:37:16 +0000
Date: Wed, 8 Nov 2000 11:49:41 -0500 (EST)
From: Nicolas Pitre <nico@cam.org>
To: David Woodhouse <dwmw2@infradead.org>
cc: mtd@infradead.org
Subject: Re: cfi_cmdset_0001
In-Reply-To: <1552.973014908@redhat.com>
Message-ID: <Pine.LNX.4.10.10011081140110.927-100000@xanadu.gn.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>



On Tue, 31 Oct 2000, David Woodhouse wrote:

> Note to self: Must produce a proper bug report for Nico for the current
> cfi_cmdset_0001 code, does doesn't work for me on 1x16 devices.

I'm interested in it.  I just tested the current code on a GraphicsClient
board with Intel parts.  There is apparently a problem withe the buffer
write code.  The word write method works well though.  Oddly enough, the
buffer write method in my (being deprecated) flash-mem driver has no
problem...

Could you test with the write buffer disabled?


Nicolas



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
