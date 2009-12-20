Received: from mail-bw0-f212.google.com ([209.85.218.212])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NMSsk-00018g-DO
	for linux-mtd@lists.infradead.org; Sun, 20 Dec 2009 21:00:06 +0000
Received: by bwz4 with SMTP id 4so3173950bwz.2
	for <linux-mtd@lists.infradead.org>;
	Sun, 20 Dec 2009 13:00:00 -0800 (PST)
Subject: Re: Few problems in mtd system
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: Alex Dubov <oakad@yahoo.com>
In-Reply-To: <290458.39840.qm@web37604.mail.mud.yahoo.com>
References: <290458.39840.qm@web37604.mail.mud.yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 20 Dec 2009 22:59:55 +0200
Message-ID: <1261342795.4798.14.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: joern <joern@logfs.org>, linux-mtd <linux-mtd@lists.infradead.org>,
	arnd <arnd@arndb.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Now it all clear.
Here is the stupid emulated nand interface of the olympus 1 GB card:


-> page read returns sector contents + cooked oob which includes LBA and
'always correct ecc'

-> oob read (0x50 ....) returns only LBA. ecc is set 0xFFFFF.
Only LBA in fact is returned.


-> erase is faked. It does put 0xFFs into erase block, but actual flash
isn't touched at all.


-> page write only works if LBA is set to correct number in the oob.
Nothing else matters. If invalid ecc is written, page writes correctly
and returns 'correct' ecc. In other words XD's ecc is not used.
Of course it possible to do many page writes, without doing erases,
writing arbitrary data.


-> oob write doesn't do anything but confuses the card. It returns
garbage on following reads, but flash isn't touched ether.


Writing different physical sector with same LBA makes other one magicly
disappear...
Of course you understand why....

However, individual page writes do work correctly.

I suspect that older non type M cards didn't have such emulation, but
were real nand chips, bacause there are some references on the web about
using XD card as a nand chip replacement.
Such card as I have will really will make very poor nand replacement...


Folks, could you review my other questions about bugs in mtd core, and
tell your opinion?


Best regards,
Maxim Levitsky
