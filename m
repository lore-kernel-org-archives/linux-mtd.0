Received: from gatekeeper.tait.co.nz ([202.37.96.11])
	by canuck.infradead.org with esmtp (Exim 4.62 #1 (Red Hat Linux))
	id 1GjlAy-0006ej-WC
	for linux-mtd@lists.infradead.org; Mon, 13 Nov 2006 18:25:22 -0500
Received: from gatekeeper.tait.co.nz (localhost.localdomain [127.0.0.1])
	by localhost.tait.co.nz (Postfix) with ESMTP id 62D364675B
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Nov 2006 12:25:12 +1300 (NZDT)
Received: from sunstrike.tait.co.nz (sunstrike [172.25.40.92])
	by gatekeeper.tait.co.nz (Postfix) with ESMTP id 4F815467D6
	for <linux-mtd@lists.infradead.org>;
	Tue, 14 Nov 2006 12:00:21 +1300 (NZDT)
Received: from conversion-daemon.sunstrike.tait.co.nz by sunstrike.tait.co.nz
	(Sun Java System Messaging Server 6.1 (built Apr 28 2004))
	id <0J8O00E01YK5P900@sunstrike.tait.co.nz>
	(original mail from robin.gilks@tait.co.nz) for
	linux-mtd@lists.infradead.org;
	Tue, 14 Nov 2006 12:00:21 +1300 (NZDT)
Date: Tue, 14 Nov 2006 12:00:16 +1300
From: Robin Gilks <robin.gilks@tait.co.nz>
Subject: Re: Kernel oops in jffs2 mount - any ideas?
In-reply-to: <1163411683.3925.31.camel@sauron>
To: dedekind@infradead.org
Message-id: <4558F900.7020103@tait.co.nz>
MIME-version: 1.0
Content-type: text/plain; format=flowed; charset=UTF-8
Content-transfer-encoding: 7BIT
References: <4553C6CB.2040207@tait.co.nz> <1163146170.3925.7.camel@sauron>
	<4557E56F.8070100@tait.co.nz> <1163411683.3925.31.camel@sauron>
Cc: MTD mail list <linux-mtd@lists.infradead.org>
Reply-To: robin.gilks@tait.co.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy wrote:

> So the crash is somewhere in the CFI code. You should try to dig it and
> realize why it oopses.
> 
Refering to standard 2.6.18 kernel...

OK - making progress in sorting bugs in the CFI code but still not fixed 
the kernel panic which is looking more & more to be in the depths of the 
jffs2 code :-(

1. In cfi_cmdset_0001.c, the fixup table is processed in order top to 
bottom. The m28w320cb chip fixup disables buffer write method but the 
buffer write fixup has already been executed by then so it tries to do 
buffered writes which are not supported! The chip fixups *MUST* be first 
in the table for this whole idea to work.

2. The chip ID as defined by ST is 0x88bb and that is what is read (in 
my case) in 16 bit mode into cfi->id but the table only has the 8 bit 
short code. Should this be masked to 8 bits so the table lookup works or 
should the 8 bit probe be extended to get both halves of the ID or 
should the table have the full 16 bit codes. In fact this chip only 
supports 16 bit mode as far as I can see!!

-- 
Robin


=======================================================================
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
 altered or corrupted during transmission.
=======================================================================
