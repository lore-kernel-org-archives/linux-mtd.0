Received: from tiku.hut.fi ([130.233.228.86])
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15jGnT-0000Fq-00
	for <linux-mtd@lists.infradead.org>; Tue, 18 Sep 2001 10:04:03 +0100
Received: from kosh.hut.fi (jlavi@kosh.hut.fi [130.233.228.10])
	by tiku.hut.fi (8.9.3/8.9.3) with ESMTP id MAA03815
	for <linux-mtd@lists.infradead.org>; Tue, 18 Sep 2001 12:10:09 +0300 (EET DST)
Received: (from jlavi@localhost)
	by kosh.hut.fi (8.9.3/8.9.3) id MAA20432
	for linux-mtd@lists.infradead.org; Tue, 18 Sep 2001 12:10:09 +0300 (EET DST)
Date: Tue, 18 Sep 2001 12:00:45 +0300
From: Jarkko Lavinen <jlavi@iki.fi>
To: MTD List <linux-mtd@lists.infradead.org>
Subject: Re: jffs & amd_flash.c
Message-ID: <20010918120045.A23770@kosh.hut.fi>
References: <20010918111926.A22357@kosh.hut.fi> <005a01c1401d$55661ff0$0203a8c0@mediasolv.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <005a01c1401d$55661ff0$0203a8c0@mediasolv.com>; from Kugan on Tue, Sep 18, 2001 at 01:37:35AM -0700
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

> The flash chip I have also support simultaneous read and write on different
> plane simultaneously. Is your patch in latest CVS or do i have to get and
> apply???

It is in the MTD CVS, but the changes are so small it may not be worth the 
trouble to take fresh CVS image. flash_is_busy() is called only in two places.
The change applies to its second argument. Previously there was "chip->start".
Now there should be "adr".

For example in write_one_word() there should read:

891:  while (times_left-- && flash_is_busy(map, adr, private->interleave)) {

This cured all my writing problems. You may already have this fixed in
erase_one_block(), since I committed that already many weeks ago and the
write_one_word() change only last weekend.

Regards,
Jarkko Lavinen
