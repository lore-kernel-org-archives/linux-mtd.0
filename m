Received: from relais.videotron.ca ([24.201.245.36])
	by pentafluge.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GKzJw-0004gR-Ah
	for linux-mtd@lists.infradead.org; Wed, 06 Sep 2006 16:28:09 +0100
Received: from xanadu.home ([74.56.106.175]) by VL-MO-MR002.ip.videotron.ca
	(Sun Java System Messaging Server 6.2-2.05 (built Apr 28 2005))
	with ESMTP id <0J5600AJ5G4IWV50@VL-MO-MR002.ip.videotron.ca> for
	linux-mtd@lists.infradead.org; Wed, 06 Sep 2006 11:24:18 -0400 (EDT)
Date: Wed, 06 Sep 2006 11:24:18 -0400 (EDT)
From: Nicolas Pitre <nico@cam.org>
Subject: Re: Intel P30, locked sectors?
In-reply-to: <44FEE692.9020900@redfish-group.com>
To: Justin Clacherty <justin@redfish-group.com>
Message-id: <Pine.LNX.4.64.0609061122510.18635@xanadu.home>
MIME-version: 1.0
Content-type: TEXT/PLAIN; charset=US-ASCII
Content-transfer-encoding: 7BIT
References: <44FED214.7090309@kernelconcepts.de>
	<Pine.LNX.4.64.0609061024300.18635@xanadu.home>
	<44FEE692.9020900@redfish-group.com>
Cc: Nils Faerber <nils.faerber@kernelconcepts.de>,
	linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 7 Sep 2006, Justin Clacherty wrote:

> Nicolas Pitre wrote:
> > Before the first write attempt you need to run flash-unlock on the
> > corresponding flash partition.
> >   
> Will this work if it's your rootfs?  ie. it will need to be mounted and 
> possibly written to before you get to the point where you can run 
> flash-unlock. 

Up to you to manage for flash-unlock to be executed before writes.

> I guess if you mount ro then there won't be any writes.

Yes, And then you can remount rw.


Nicolas
