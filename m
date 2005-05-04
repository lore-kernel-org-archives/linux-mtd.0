Received: from web52709.mail.yahoo.com ([206.190.39.160])
	by canuck.infradead.org with smtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DTMWh-000312-1i
	for linux-mtd@lists.infradead.org; Wed, 04 May 2005 12:15:07 -0400
Message-ID: <20050504161510.69444.qmail@web52709.mail.yahoo.com>
Date: Wed, 4 May 2005 09:15:10 -0700 (PDT)
From: Michael <xemc@yahoo.com>
To: amareesh@tataelxsi.co.in, linux-mtd@lists.infradead.org
In-Reply-To: 6667
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: 
Subject: Re: Booting from onboard flash
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> Hi 
> 
> Plzz help me on this. .
> I want to boot Linux image straight from my onboard flash.

Yep.  I guess we all want that.
What kind of flash do you have?  I'm assuming NOR-type flash,
right?
Does your bootloader (dBug? I'm not familar with it) run from
flash?

> WHat i have ::
> 
> 1. Motorola coldfire 5272C3 based board.

Is that like a development kit?  If it is, perhaps someone has the
same one.

> 2. Complied uClinux for the same.
> 3. have the image for LINUX +FILESYSTEM(romfs)

And you've tested them out by running out of ram, right?

> 4. Have copied this image to flash.
> 
> What i wanna do :
> 
> I want to use the dBug option go <start address> to boot straight
> from flash.

Well.. What happened (in my case, anyways) is that I put a 'zImage'
into NOR flash, and it knew where to uncompress itself (into RAM).
My bootloader set up ram and a few other things, and then ran the
zImage (like the 'go' command), which uncompressed itself to
0xc0008000.

Take a look here:
http://www.arm.linux.org.uk/developer/noboot-checklist/

What do you use for those values (ZRELADDR, TEXTADDR, ...)?
You may need to fix or tweak them.

> Can anyone plzz help me on this.

I'd like to be helpful.  =]

Mike
