Received: from miranda.axis.se ([193.13.178.2])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16bJgd-0003zm-00
	for <linux-mtd@lists.infradead.org>; Thu, 14 Feb 2002 11:04:23 +0000
Message-ID: <3C6BEE8B5E1BAC42905A93F13004E8AB6B6DDF@mailse01.axis.se>
From: Jonas Holmberg <jonas.holmberg@axis.com>
To: "'Robert Kaiser '" <rob@sysgo.de>,
   "'David Woodhouse '"
	 <dwmw2@infradead.org>
Cc: "'joakim.tjernlund@lumentis.se '" <joakim.tjernlund@lumentis.se>,
   "'linux-mtd@lists.infradead.org '" <linux-mtd@lists.infradead.org>,
   "'J?rn Engel '" <joern@wohnheim.fh-wedel.de>
Subject: RE: MTD concat layer 
Date: Thu, 14 Feb 2002 12:14:25 +0100
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

>> You could hack up a map driver that appears to have the two CFI chips 
>> contiguously, and then the probe code would find them both and make a 
>> single MTD device from them -  but there was a reason why he wasn't
doing 
>> this. Perhaps the 'BIOS' bit is in fact the beginning of the second
chip, 
>> not actually a separate chip at all? I don't remember.
>
>No, the BIOS is in the middle of the chip's addressing space. All this
>_could_ conceivably be solved with a hacked-up map driver, but then
>again,
>one might as well do the partitioning stuff in a hacked-up map driver.
>The
>idea was to have this functionality available in a generic form, so it
>it is accessible as a service from the MTD core layer.

I started to work on a different solution; probe functions that could be called several times with the same map. This would also make it possible to mix CFI and JEDEC chips. And you could mix chips of different geometry. I did , however, caught a nasty cold and haven't been working on it for a week now. If you are interested in this solution I will continue working on it when I get well, otherwise I'll use your solution.

/Jonas
