Return-path: <owner-mtd@imladris.demon.co.uk>
Received: from [62.6.164.226] (helo=mail.linuxgrrls.org ident=postfix)
	by imladris.mvhi.com with esmtp (Exim 2.12 #1)
	id 11iMSD-0003zZ-00
	for mtd@infradead.org; Mon, 1 Nov 1999 18:45:19 +0000
Date: Mon, 1 Nov 1999 18:42:06 +0000 (GMT)
From: Kira Brown <kira@linuxgrrls.org>
To: Alan Cox <alan@lxorguk.ukuu.org.uk>
Cc: David Woodhouse <David.Woodhouse@mvhi.com>, miket@bluemug.com,
	SLEAS@videoupdate.com, sct@redhat.com, joh@xinit.se,
	linux-kernel@vger.rutgers.edu, mtd@infradead.org
Subject: Re: jfs/linux
In-Reply-To: <E11iLRd-0002uk-00@the-village.bc.nu>
Message-ID: <Pine.LNX.4.10.9911011841010.8103-100000@carrot.linuxgrrls.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: owner-mtd@imladris.demon.co.uk
List-ID: <linux-mtd.lists.infradead.org>



On Mon, 1 Nov 1999, Alan Cox wrote:

> Ditto with Compact flash (ATAPI). Compact flash according to the docs does
> its own wear levelling.  Im still baffled why people use the other stuff 8)

SmartMedia does too, according to the stuff I have here.  SmartMedia is
slightly smaller than CompactFlash, which may explain why we're using it.

Either way it'll be good to get rid of rassen frassen DiskOnChip.

kira.




To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
