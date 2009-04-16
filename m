Received: from relais.videotron.ca ([24.201.245.36])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LuUNB-0005Ar-0N
	for linux-mtd@lists.infradead.org; Thu, 16 Apr 2009 16:23:39 +0000
MIME-version: 1.0
Content-transfer-encoding: 7BIT
Content-type: TEXT/PLAIN; charset=US-ASCII
Received: from xanadu.home ([66.131.194.97]) by VL-MH-MR001.ip.videotron.ca
	(Sun Java(tm) System Messaging Server 6.3-4.01 (built Aug  3 2007;
	32bit))
	with ESMTP id <0KI7003Z3C76HE60@VL-MH-MR001.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Thu, 16 Apr 2009 12:23:30 -0400 (EDT)
Date: Thu, 16 Apr 2009 12:23:30 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
To: David Howells <dhowells@redhat.com>
Subject: Re: Bug in physmap driver?
In-reply-to: <13360.1239895664@redhat.com>
Message-id: <alpine.LFD.2.00.0904161222280.6741@xanadu.home>
References: <20090416151433.GS1760@mail.wantstofly.org>
	<20090416150630.GR1760@mail.wantstofly.org>
	<5680.1239894019@redhat.com>
	<11416.1239894581@redhat.com> <13360.1239895664@redhat.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Lennert Buytenhek <buytenh@wantstofly.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 16 Apr 2009, David Howells wrote:

> Do you by any chance know what the 'width' field of struct physmap_flash_data
> means?  Is it the total width of the data bus going to the flash chips?  Or is
> it the width of each flash chip?

It's the total bus width.


Nicolas
