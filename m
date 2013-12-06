Received: from mail-ie0-x22c.google.com ([2607:f8b0:4001:c03::22c])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Voqj1-0006b9-Sc
 for linux-mtd@lists.infradead.org; Fri, 06 Dec 2013 08:25:28 +0000
Received: by mail-ie0-f172.google.com with SMTP id qd12so659001ieb.17
 for <linux-mtd@lists.infradead.org>; Fri, 06 Dec 2013 00:25:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <52A0775B.3080005@ADwin.de>
References: <52A0775B.3080005@ADwin.de>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Fri, 6 Dec 2013 09:24:40 +0100
Message-ID: <CACQ1gAiYBT987kad3Tk6cwsSfv29_uiAm8S=NzA=7FOR6FybYg@mail.gmail.com>
Subject: Re: UBI+UBIFS on Read-Only NAND
To: Thomas Herrmann <THerrmann@adwin.de>
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2013/12/5 Thomas Herrmann <THerrmann@adwin.de>:
> We had an old JFFS based system that had a dip switch connected to the
> write-enable pin of the flash device, and it worked as expected. Users
> were able to configure and use the system in r/w mode and then "lock"
> the configuration.
>
> I tried the same with our newer hardware, and UBI/UBIFS. I did not use
> static volumes, since write support is essential for initial setup.
> However, the system will not boot if the flash is write-protected in
> hardware, because UBI assumes that it is R/W.
>
> What is the suggested solution for such a setup? I could not find
> anything in the FAQ or in the archive, but I may have been searching for
> the wrong keywords...

AFAIK, UBI is not design to be used on a write protected NAND.
As it is basically a wear-leveling / bad block handling layer, it
wouldn't make much sense without a write capability.
The closest use case I can imagine would be to mount the UBIFS volume
RO by default and remount it RW when a gpio button is pushed.
But with a dip switch directly on the NAND WP pin, I don't think
there's an UBI based solution.

Richard.
