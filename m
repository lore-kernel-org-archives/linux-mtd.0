Received: from mta-rtd-2.nl.easynet.net ([194.165.92.5])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AetMA-0002sU-TW
	for linux-mtd@lists.infradead.org; Fri, 09 Jan 2004 09:55:06 +0000
Received: from unspecified.host ([195.86.30.10])i099qxCt026859
	for <linux-mtd@lists.infradead.org>;
	Fri, 9 Jan 2004 10:53:00 +0100 (CET)
Message-ID: <002e01c3d696$8a421190$1800a8c0@inetrjasper>
From: "Jasper Jackson" <jasper@vidicode.nl>
To: "MTD Mailinglist" <linux-mtd@lists.infradead.org>
Date: Fri, 9 Jan 2004 10:54:14 +0100
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Subject: EDB9312 Flash chips
Reply-To: Jasper Jackson <jasper@vidicode.nl>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

We've been working around for a while with the EDB9312 developmentboard from
Cirrus Logic,
Now the time has come that we want a filesystem on our flashchips, the
problem is, that the flash chips don't seem
to respond to a CFI probe. There is a memory map written by David for the
edb7312 (the little brother).
It seems that the only thing that has to be done is ajust the WINDOW_START
and the WINDOW_SIZE,
but that doesn't work.
CFI Flash device in physical memory map, seems to work
when set to:
Physical start: 0x60000000
Physical length: 0x2000000
But reading from those adresses results in crep,
Almost everything I read is 'R' or 'U' and some dots, no binary data from ie
redboot which resides at adress 0x60000000 is found.
When lowlevel writing to those adresses (from a homebrew kernel module), the
data written can be read back that goes OK, but after a reboot it's gone,
not exactly what you expect from flash memory.
According to the Cirrus Documentation those are the right adresses, it is
also said that there is no difference between the
physical and the virual adress (not that I believe that, but ok).
Before I go ahead with JFFS I think that it's important that my flashchips
are detected.
Ok, ready for that part,
My question however, is, are there people familiar with MTD and the EDB9312,
i've been working for a week now on it,
I think i'm doing something terribly stupid wrong, I should be ashamed for
that, I know, but I don't see it at the moment.

Some extra information:

Kernel: 2.4.21-rmk1
Config:
MTD Support ON
Direct char device access ON
Caching block device access ON
ROM/Flashchip drivers -> Detect flash by CFI
ROM/Flashchip drivers -> Intel/sharp support

Thanks in advance,

Jasper Jackson
