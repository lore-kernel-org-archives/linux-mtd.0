Received: from rproxy.gmail.com ([64.233.170.196])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1COkSj-0003Fe-Ky
	for linux-mtd@lists.infradead.org; Mon, 01 Nov 2004 17:15:44 -0500
Received: by rproxy.gmail.com with SMTP id 76so176531rnl
	for <linux-mtd@lists.infradead.org>;
	Mon, 01 Nov 2004 14:15:33 -0800 (PST)
Message-ID: <a084b59f04110114152b341fea@mail.gmail.com>
Date: Mon, 1 Nov 2004 17:15:33 -0500
From: Ed Berube <eberube@gmail.com>
To: linux-mtd@lists.infradead.org
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: MTD Driver problem/question with 384MB MD2202-D384.
Reply-To: Ed Berube <eberube@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I saw a message in the archive from June 2003, but there was no
response that I could find.

This is the DiskOnChip I concerned about.  

Its the 384MB - The MD2202-D384.   
Under Linux with a 2.4.27 patched with MTD kernel

Now I have followed the instructions on building a DOC system from
OReilly's Building Embedded Systems book.  And its pretty straight
forward.  Building/patching the kernel (version 2.4.27) with the MTD
drivers.  However it claims that the MTD drivers don't work with DOCs
with firmware version 5.0 or larger.  Now I don't know if this is
still the case.  Now the book advises replacing the firmware with the
Version 4.2 firmware.  However, this fails on the 384 MB DOC.  Now
when I compile the kernel and run it, and it doesn't seem to find the
DOC.

I have to ask is the MD2202-D384 supported by MTD?  Is there a work
around to get this DOC to work with MTD.  Or am I missing something
and this should all be working.


I would like to note, that I actually have tested a MD2202-D32-X
(32MB) DOC (w/ version 4.2 firmware), and it seems to work.  I haven't
extensively tested it, but it is accessible, which is further than I
have gotten on the 384MB Version.


Any help that can be provided will be greatly appreciated.  

Thank you,
Ed
