Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.03 #1)
	id 13Hk9l-0006sq-00
	for mtd-list@infradead.org; Thu, 27 Jul 2000 10:40:45 +0100
Received: from mail.auriga.ru ([213.24.209.102])
	by infradead.org with esmtp (Exim 3.03 #1)
	id 13Hk9k-0006sk-00
	for mtd@infradead.org; Thu, 27 Jul 2000 10:40:45 +0100
Received: from iron.auriga.ru
	([213.24.209.81] helo=auriga.ru ident=nick)
	by mail.auriga.ru with esmtp (Exim 3.14 #1)
	id 13Hk9g-00009l-00
	for mtd@infradead.org; Thu, 27 Jul 2000 13:40:40 +0400
Message-ID: <39800397.3C3CB51B@auriga.ru>
Date: Thu, 27 Jul 2000 13:40:39 +0400
From: Nick Ivanter <nick@auriga.ru>
MIME-Version: 1.0
To: mtd <mtd@infradead.org>
Subject: flash write, erase & timeouts
Content-Type: text/plain; charset=koi8-r
Content-Transfer-Encoding: 7bit
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

Hi All.

Could anyone please explain the following thing which I see
in cfi_cmdset_0001.c.

After writing a Program command and data we are do
udelay(chip->word_write_time), but when erasing a sector
we instead call schedule_timeout(HZ) as the Erase command
is written. Is it just ocassionally or there is a point in
doing that way?

Thanks, Nick.



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
