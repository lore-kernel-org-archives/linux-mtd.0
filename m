Received: from wall.comdev.cc ([63.150.62.162] helo=cleanup.comdev.cc)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16fNCA-0003OU-00
	for <linux-mtd@lists.infradead.org>; Mon, 25 Feb 2002 15:37:43 +0000
Date: Mon, 25 Feb 2002 07:44:21 -0800 (PST)
From: Adam Wozniak <awozniak@comdev.cc>
To: Robert Kaiser <rob@sysgo.de>
cc: David Woodhouse <dwmw2@infradead.org>,  <linux-mtd@lists.infradead.org>,
    Jonas Holmberg <jonas.holmberg@axis.com>
Subject: Re: Re-entrancy of flash erase/write 
In-Reply-To: <Pine.LNX.4.21.0202251153370.8474-100000@dagobert.svc.sysgo.de>
Message-ID: <Pine.LNX.4.33.0202250739340.28327-100000@rangers.comdev.cc>
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

On Mon, 25 Feb 2002, Robert Kaiser wrote:
> I looked into this a little further: it seems that the erase
> functions in cfi_cmdset_000?.c and amd_flash.c temporarily release
> the chip->mutex while VPP is on. Won't that allow other threads
> to get hold of the mutex and fiddle with VPP, possibly turning it
> off ?
>
> That would explain the behavior I'm observing here. Only why doensn't
> anyone else see this problem ?
>
> A proper solution IMHO would be to use a counter (similar to what I
> now have in my mapping driver) in the ENABLE/DISABLE_VPP() macros.

If I recall correctly, last time I dug into this:

ENABLE/DISABLE_VPP  call the map_info set_vpp function
For the physmap_map map_info, there is no set_vpp, it is NULL

So for people who use physmap_map anyway, they won't see the behavior
you are describing.  I suspect it is the same for other maps.

--Adam
-- 
Adam Wozniak (KG6GZR)   COM DEV Broadband - Digital and Software Systems
awozniak@comdev.cc      805 Aerovista Place, San Luis Obispo, CA 93401
                        http://www.comdev.cc
                        Voice: (805) 544-1089       Fax: (805) 544-2055
