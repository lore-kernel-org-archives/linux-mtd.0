Received: from smtp-out.bhp.t-online.de ([195.145.119.39] helo=orvill.bhp.t-online.de)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 18GcfZ-0002Os-00
	for <linux-mtd@lists.infradead.org>; Tue, 26 Nov 2002 10:10:17 +0000
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
 by smtp-out.bhp.t-online.de (iPlanet Messaging Server 5.2 (built Feb 21 2002))
 with SMTP id <0H6600M1NIZ451@smtp-out.bhp.t-online.de> for
 linux-mtd@lists.infradead.org; Tue, 26 Nov 2002 11:40:17 +0100 (MET)
Date: Tue, 26 Nov 2002 11:38:16 +0100
From: Thomas Gleixner <tglx@linutronix.de>
Subject: Re: SmartMedia Card need to create fs before mounting it ?
In-reply-to: 
 <Pine.LNX.4.44.0211260527100.20708-100000@structure.biochem.nchu.edu.tw>
To: shadow <saturn@structure.biochem.nchu.edu.tw>,
 John Hall <john.hall@optionexist.co.uk>
Cc: linux-mtd@lists.infradead.org, manningc2@actrix.gen.nz
Reply-to: tglx@linutronix.de
Message-id: <200211261138.16297.tglx@linutronix.de>
MIME-version: 1.0
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
References: 
 <Pine.LNX.4.44.0211260527100.20708-100000@structure.biochem.nchu.edu.tw>
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

On Monday 25 November 2002 22:42, shadow wrote:
> I don't understand what difference between /dev/mtd/x and /dev/mtdblock/x
dev/mtd is a character device
dev/mtdblock is a block device, which is required for mounting filesystems

> I used eraseall to erase /dev/mtd/6, it shown following messages..
> ----
> <---------skip above
> eraseall: /dev/mtd/6: MTD Erase failure: Input/output error
> Erasing 8 Kibyte @ 7f4000 -- 99 % complete.
> eraseall: /dev/mtd/6: MTD Erase failure: Input/output error
> Erasing 8 Kibyte @ 7f8000 -- 99 % complete.
> eraseall: /dev/mtd/6: MTD Erase failure: Input/output error
> Erasing 8 Kibyte @ 7fa000 -- 99 % complete.
> eraseall: /dev/mtd/6: MTD Erase failure: Input/output error
> Erasing 8 Kibyte @ 7fe000 -- 99 % complete.
> eraseall: /dev/mtd/6: MTD Erase failure: Input/output error
> Erased 8192 Kibyte @ 0 -- 100% complete.
The I/O errors indicate probably that you have bad blocks on your FLASH.
Use dmesg to verify.
But it's not a problem. JFFS2 can handle this.

now 
mount -t jfss2 /dev/mtdblock/x /mnt/bla

-- 
Thomas
____________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
