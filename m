Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15Cyqh-0005wJ-00
	for <linux-mtd@lists.infradead.org>; Thu, 21 Jun 2001 08:25:55 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <02b301c0f9f9$63009790$0201a8c0@dieckman.net> 
References: <02b301c0f9f9$63009790$0201a8c0@dieckman.net> 
To: "Darryl Dieckman" <ddieckma@cliftonlabs.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: USB Device Support 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 21 Jun 2001 08:31:23 +0100
Message-ID: <30891.993108683@redhat.com>
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

ddieckma@cliftonlabs.com said:
> I'm looking into the feasibility of developing a driver for a USB
> FLASH storage device.

Are you sure this USB device really looks like flash to the computer?

I thought that USB devices, just like CompactFlash, had a kind of
translation layer built in which does everything for you, including wear
levelling. They just appear as a USB storage device, don't they?

--
dwmw2
