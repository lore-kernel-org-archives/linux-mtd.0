Received: from mail.frequentis.com ([213.47.210.156])
	by canuck.infradead.org with smtp (Exim 4.33 #1 (Red Hat Linux))
	id 1BzysB-0002o3-1x
	for linux-mtd@lists.infradead.org; Wed, 25 Aug 2004 10:35:38 -0400
Message-Id: <s12cbf16.032@mail.frequentis.com>
Date: Wed, 25 Aug 2004 16:35:12 +0200
From: "Gerhard TAEUBL" <Gerhard.TAEUBL@frequentis.com>
To: <linux-mtd@lists.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Subject: 28F320S3
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

I'm wondering if the mtd driver (cfi_cmdset_0001.c) really works?
I get sometimes the error that the drive is read only.
OK now my configuration: 
Two 28F320S3 in parallel manner used as 32bit data device with an
MPC860T.
After looking at the code and put some Debug outputs into the code. It
seems, that the chip isn't fast enough, to set the bits in the status
register, because I got 00800082 (or 00820080). OK so thats right that I
got an error as read only device...
Then I look at the Status regsiter, and there you clear all other bits
beside the bit 7. If I dont mask all unneeded bits I run in troubles
while one block is erased and not suspended.

(if (status == status_OK)
   break;)

Because bit 6 is still set and never cleared, so I get a timeout. I
modified this line again:
if ((status & ~0x00400040) == status_OK)
   break;

So it works. Of course this mask has to be set up via CMD(0x40), but
does anyone else have such problems, or do you think that this
workaround won't work properly?

Please answer direct to my mail address, I'm not in the list.

br
Gerhard
