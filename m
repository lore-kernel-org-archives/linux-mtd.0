Received: from mail-fx0-f222.google.com ([209.85.220.222])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1NSdfK-000530-Rw
	for linux-mtd@lists.infradead.org; Wed, 06 Jan 2010 21:43:48 +0000
Received: by fxm22 with SMTP id 22so20323409fxm.2
	for <linux-mtd@lists.infradead.org>;
	Wed, 06 Jan 2010 13:43:40 -0800 (PST)
Subject: RFC: [PATCH 0/9 Integration of SmartMedia/xD into mtd subsystem
From: Maxim Levitsky <maximlevitsky@gmail.com>
To: linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 06 Jan 2010 23:43:36 +0200
Message-ID: <1262814216.14552.22.camel@maxim-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: joern <joern@logfs.org>, linux-mtd <linux-mtd@lists.infradead.org>,
	Alex Dubov <oakad@yahoo.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Here is the result of my work of supporting an xD card reader that I
have on my notebook.

I had to fix few problems in mtd translation layer, add few workarounds.
This is by no way a final version of the patches, there is still lot of
cleanup to do.
The patches weren't tested with checkpatch.pl for example.

I can now read and write an xD card, and I have no crashes.
Still following issues remain:

1 - Write speed IS very SLOW, just about 200 Kbytes/s
In fact a reader in my printer gives me about 330 Kbytes/s, thus
partially card is to blame.
Also, hardware doesn't support interrupts to test when card is ready,
thus writes consume 100% of one cpu.

2 - I rely on mtd driver to have empty oob layout so I can read both oob
and data using ->read_oob  with MTD_OOB_PLACE.
I thinking to add new mode to allow to read whole oob + data and check
ecc, or I will have to do pointless copying of data from 'censored' oob
to normal structure. (This applies to FTL driver I also include in this
patchset)

3 - Using the mtd device directly with anything but supplied FTL or
SSFDC, on 'modern' xD cards just doesn't. These cards implement a fake
nand command set, thus don't have a real oob.
It was disappointing for me too.
I suspect that all 'Type M' cards are of this fake type, but older cards
are OK.


4 - Suspend/resume support works, but relies on all mtd users not to
suspend in middle of card access, bacause in this case its very
difficult/impossible to know card state.
Driver will refuse suspend in that case.
Access via all block devices is safe.


5 - And of course there are bugs, thus I warn you now that this driver
has high probability to erase data from your card.
Thus DON'T USE THIS DRIVER IF ANYTHING IMPORTANT IS STORED ON THE CARD.


6 - driver only detects PCI ID of my notebook, so it might not load on
compatable chips with different ID.


7 - patches developed against stable 2.6.32, and won't compile against
latest git due to changes in kfifo api.


Feedback is welcome, flames too :-)


Best regards,
Maxim Levitsky
