Received: from mail.fh-wedel.de ([195.37.86.23])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17SjPf-0001x8-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 20:15:39 +0100
Date: Thu, 11 Jul 2002 21:15:40 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Frederic Gobry <frederic.gobry@smartdata.ch>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mmap question
Message-ID: <20020711191540.GA16466@wohnheim.fh-wedel.de>
References: <20020604132254.GA4911@rhin.smartdata.ch> <20020701131443.GA10227@rhin> <20020711161909.GA8143@rhin>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20020711161909.GA8143@rhin>
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

Hi!

> I don't despair having an answer to at least one of my questions :-)

Hm. Maybe I should read/reread them. :-)

> I implemented mmap on a mtd device (via a simple remap_page_range). I
> have a userland program that opens and mmap a mtd device with success,
> and can read-access it correctly. But once I perform a MEMERASE ioctl
> or a simple write, the process only reads series of 0x80 bytes. If I
> restart the process, it continues reading this value (even before any
> erase/write operation) unless I reboot.
> 
> Do anybody have a clue about this behavior ?

0x80 is the status register, you are reading. The command set (Intel
or Amd, I suppose) can read it, handle any errors (0x80 mean no errors
on intel) and return to read mode by writing 0xff to the flash.

My guess is that you command set has a bug. Fix it or provide a spec
and some beer and pizza. ;-)

Jörn

-- 
Often, the most striking and innovative solutions come from realizing
that your concept of the problem was wrong.
-- Eric Raymond in "The cathedral and the bazaar"
