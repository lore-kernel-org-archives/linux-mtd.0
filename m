Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=debian.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CDqpj-00082a-Qe
	for linux-mtd@lists.infradead.org; Sat, 02 Oct 2004 16:50:27 -0400
From: Thomas Gleixner <tglx@linutronix.de>
To: Nicolas Pouillon <nipo@ssji.net>
In-Reply-To: <20041002155505.083d8440.nipo@ssji.net>
References: <20041001154617.163cc484.nipo@ssji.net>
	<1096639064.30942.477.camel@hades.cambridge.redhat.com>
	<20041001162705.5873dc7c.nipo@ssji.net>
	<20041002155505.083d8440.nipo@ssji.net>
Content-Type: text/plain
Message-Id: <1096749729.21297.54.camel@thomas>
Mime-Version: 1.0
Date: Sat, 02 Oct 2004 22:42:09 +0200
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: Patch !
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2004-10-02 at 15:55, Nicolas Pouillon wrote:
> I made two patches, for different handleds.org kernel dates (fall July,
> (the one I'm working on): 2.6.7, and now: 2.6.8.1)
> 
> (I've not tried 2.6.8.1 version)

You should have tried 2.6.8.1 !!

Did you notice the DEPRECATED NOTE in Kconfig ????

INFTL in 2.6.8.1 tells you: 
"INFTL no longer supports the old DiskOnChip drivers loaded via
docprobe.\n"
"Please use the new diskonchip driver under the NAND subsystem.\n");

Please follow this advise. The docxx stuff in mtd/devices will be
removed in the near future and INFTL with the old drivers was missing
some functionality anyway, AFAIK.

The chip ID part of your patch is giving me a bit more headache. The ID
0xA5 is a valid ID for NAND 2GiB 1,8V 8-bit.
Since NAND is available _all_ manufacturers use the same Chip ID codes
for chips with the same specifications. All Cardreaders, MP3-Players and
Digicams rely on those ID's.
I doubt that there are 32 MiB chips around with chip ID 0xA5. The Chip
ID in all Toshiba datasheets of their various 32MiB NAND chips is 0x75. 
I'm not going to put this line into the code without sensible
confirmation that this is the real ID. Please figure out the DoC
partnumber and let M-Sys confirm this. If they confirm that some moron
started to break the ID rules, then we have to figure out a way to make
this work. Putting this line without any further modifications into the
code would break other drivers.

tglx
