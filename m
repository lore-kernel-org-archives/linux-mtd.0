Received: from rose.man.poznan.pl ([150.254.173.3])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 19u5GA-0004Pb-2D
	for <linux-mtd@lists.infradead.org>; Tue, 02 Sep 2003 08:07:26 +0100
Date: Tue, 2 Sep 2003 09:06:52 +0200 (CEST)
From: Michal Schulz <mschulz@rose.man.poznan.pl>
To: Felix Frey <ffrey@freesurf.ch>
In-Reply-To: <200308291104.06237.ffrey@freesurf.ch>
Message-ID: <Pine.GSO.4.44.0309020905210.2493-100000@rose.man.poznan.pl>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
cc: linux-mtd@lists.infradead.org
Subject: Re: SRAM and MTD
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 29 Aug 2003, Felix Frey wrote:

> I'd like to connect a 32kx8 static RAM (battery buffered) to the ISAbus of my
> x86 based system to frequently store sensitive data which _must_ survive a
> powerfail. Access should be made through the mtd character device. By diving
> a bit into the code I saw there is a ram chip driver, however, I got pretty
> confused.
> Do I have to write my own mapping driver or how can I tell the chip driver
> where it finds my RAM device and how large it is ?
> Does the ram chip driver accept any parameters ?

Perhaps my article might help you. Have a look at
http://hedera.linuxnews.pl/_news/2002/09/03/_long/1445.html

My aim was to use mostly free GFX memory, but your seems to be similiar :)

regards,

-- 
Michal Schulz
