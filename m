Received: from ns.sysgo.de ([213.68.67.98] helo=dagobert.svc.sysgo.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16Y1GA-0006zy-00
	for <linux-mtd@lists.infradead.org>; Tue, 05 Feb 2002 08:47:26 +0000
Date: Tue, 5 Feb 2002 09:58:30 +0100 (MET)
From: Robert Kaiser <rob@sysgo.de>
To: Kristberg Karlsson <gustix@visir.is>
cc: linux-mtd@lists.infradead.org
Subject: Re: Jedec chip mapping in SC400
In-Reply-To: <46EF036A548E485419D075DB0E69CEF6@gustix.visir.is>
Message-ID: <Pine.LNX.4.21.0202050945490.24810-100000@dagobert.svc.sysgo.de>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
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


On Tue, 5 Feb 2002, Kristberg Karlsson wrote:

> I am having trouble finding the map of 2 AMD 29F016(Jedec) chips that
> are in my Elan SC400 custom made board. Does anyone know if there is
> a way to make jedec_probe (or another method) search for them.
> Or if anyone has an experience in how to map the chips in a Elan
> SC400 to a predefined place.
> 

The AMD 29F016 should be already be supported (at least it appears in
jedec_probe.c). I believe the tricky part is to make the flash chips
appear in the address space. For that, you might want to have a look at
the mapping driver for the SSV DIL/NetPC that has been committed to the
MTD CVS a few days ago (file name dilnetpc.c). The DIL/NetPC has an Elan
SC410 which -I think- is the same as the SC400 in terms of how boot rom is
mapped into the addess space. Look at function dnpc_map_flash().

Cheers

Rob

----------------------------------------------------------------
Robert Kaiser                          email: rkaiser@sysgo.de
SYSGO RTS GmbH
Am Pfaffenstein 14
D-55270 Klein-Winternheim / Germany    fax:   (49) 6136 9948-10
