Received: from miranda.axis.se ([193.13.178.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16TomX-0001wh-00
	for <linux-mtd@lists.infradead.org>; Thu, 24 Jan 2002 18:39:30 +0000
Message-ID: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6DD7@mailse01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: "'David Woodhouse '" <dwmw2@infradead.org>
Cc: "'linux-mtd@lists.infradead.org '" <linux-mtd@lists.infradead.org>
Subject: RE: How to understand :interleave,numeraseregions and regions 
Date: Thu, 24 Jan 2002 19:49:29 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

> jonas.holmberg@axis.com said:
> >  I would like to ask the MTD people why it's necessary to have a
> > variable for device_type? Isn't it always possible to calculate the
> > device_type (buswidth / interleave)? 
>
> You can use 16-bit devices in 8-bit mode. And it matters. 

I thought that device_type==(buswidth/interleave) even in that case.
Is device type X8 or X16 if a 16-bit device is in 8-bit mode?
Buswidth must be interleave*1 bytes in that case, right?

/Jonas
