Received: from hex.linuxgrrls.org ([212.18.228.73] ident=postfix)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 173fmp-0005MW-00
	for <linux-mtd@lists.infradead.org>; Fri, 03 May 2002 17:19:59 +0100
Date: Fri, 3 May 2002 17:19:55 +0100
Subject: Re: Booting from DOC2000 with GRUB loader
Content-Type: text/plain; charset=US-ASCII; format=flowed
Mime-Version: 1.0 (Apple Message framework v481)
Cc: linux-mtd@lists.infradead.org
To: John Sutton <john@scl.co.uk>
From: Jasmine Strong <jasmine@regolith.co.uk>
In-Reply-To: <02050315580600.13762@diva.localdomain>
Message-Id: <9A9FD862-5EB1-11D6-B6D6-000502893FA1@regolith.co.uk>
Content-Transfer-Encoding: 7bit
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

On Friday, May 3, 2002, at 02:40 PM, John Sutton wrote:
> ...the nftl
> format put on there by M-systems.  Once you want to have a go with grub,
> this is no good.  (Presumably precisely because the mtd-patched grub
> insists on putting stage2 onto the doc thus trashing this existing 
> format?

Yes.  The M-systems stuff reserves a block at the start of the DoC for
the BIOS extender-  however it only seems to be 48kbytes on any of the
parts I've tried, so that's not big enough for grub, and you need to
make more space.

If you don't reformat and make more space, you'll trash the first two
blocks of the NFTL, which contain the media headers, and this will
effectively destroy the NFTL.

>  Can't see why you couldn't have a "standard" grub installation which
> would only need to overwrite 512 bytes like lilo does?  Not that that
> would have much merit in itself.)

You could, but you would have to leave the M-Systems int13h 
implementation
in the first 48k of the DoC (as an unpatched grub would need to be able 
to
use standard int13h calls to read its second stage) and that would suck
*much* harder than just reformatting the thing.

Jas.
