Received: from wall.comdev.cc ([63.150.62.162] helo=cleanup.comdev.cc)
	by pentafluge.infradead.org with smtp (Exim 3.22 #1 (Red Hat Linux))
	id 16ZDfy-0002ye-00
	for <linux-mtd@lists.infradead.org>; Fri, 08 Feb 2002 16:15:03 +0000
Message-ID: <3C63FB44.5541D76D@comdev.cc>
Date: Fri, 08 Feb 2002 08:22:28 -0800
From: Adam Wozniak <adam.wozniak@comdev.cc>
MIME-Version: 1.0
To: acurtis@onz.com
CC: linux-mtd@lists.infradead.org
Subject: Re: Flash left in a write mode
References: <NCBBIINEHIPFGJPLBEIFMEBBDEAA.acurtis@onz.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
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

Allen Curtis wrote:
> 
> I have observed a problem where the flash is left in a write mode even after
> the file-system is unmounted. (Intel Strata flash, cmdset_0001.c)
> 
> The problem is this: if the flash is written to and then the system is
> immediately rebooted, the flash is left in a write state. (if you read it
> you get status information not flash contents.) If you then try to boot off
> of this device, it will fail. If you read the flash, with a "dd" command for
> instance, then you can reboot successfully.
> 
> I am surprised that this problem has not been reported. It should be an easy
> fix. (something that I will handle in BIOS code until it is patched.)

Yeah, I've seen that.  I patched my reboot code to always throw the
flash
into read mode.

--Adam
-- 
Adam Wozniak (KG6GZR)   COM DEV Wireless - Digital and Software Systems
awozniak@comdev.cc      3450 Broad St. 107, San Luis Obispo, CA 93401
                        http://www.comdev.cc
                        Voice: (805) 544-1089       Fax: (805) 544-2055
