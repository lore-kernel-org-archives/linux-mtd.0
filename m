Received: from mail13.speakeasy.net ([216.254.0.213] helo=mail.speakeasy.net)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19c50I-0005Gd-SZ
	for <linux-mtd@lists.infradead.org>; Mon, 14 Jul 2003 16:12:39 +0100
Received: from unknown (HELO [192.168.2.4]) ([66.93.32.104])
          (envelope-sender <rogerxxmaillist@san.rr.com>)
          by mail13.speakeasy.net (qmail-ldap-1.03) with SMTP
          for <linux-mtd@lists.infradead.org>; 14 Jul 2003 15:12:45 -0000
From: roger <rogerxxmaillist@san.rr.com>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1058180967.26819.83.camel@passion.cambridge.redhat.com>
References: <1058094420.2750.13.camel@localhost3.localdomain>
	 <1058180967.26819.83.camel@passion.cambridge.redhat.com>
Message-Id: <1058195527.2163.10.camel@localhost3.localdomain>
Mime-Version: 1.0
Date: 14 Jul 2003 08:12:45 -0700
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
Subject: Re: intel 440bx unshadow for doc2001
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2003-07-14 at 04:09, David Woodhouse wrote:
> On Sun, 2003-07-13 at 12:08, roger wrote:
> > If i'm correct, the unshadow code just needs to be written into MTD for
> > everything to work easily? 
> 
> Seems perfectly reasonable.
> 
> In theory, we ought to already have the appropriate unshadowing code in
> drivers/mtd/maps/l440gx.c; it's just that that driver will only then
> look for NOR flash chips rather than a DiskOnChip. Does it work if you
> load l440gx.c, watch it fail to find any flash chips, then unload it and
> load docprobe.c?

no. on 440BX.B683 motherboard, the l440gx.o module fails to even load. 
believe me, in my prior posts, you'll probably notice that i did
everything including pulling a rabbit out of my computer's rear port.

on my 440BX.tyan motherboard, I think the l440gx.o module will load but
it still fails to find the doc(?) (or vice versa with the motherboards)

> I'm working on a rewrite of the DiskOnChip drivers; I'll probably make
> it so that a separate driver can call a 'probe for DiskOnChip at address
> XXXX' function, then we can make that an option for l440gx and other
> such drivers rather than having hard-coded tables in the docprobe code
> itself.

I was scanning over the openbios/devbios/pcisets.c and looks like
there's only a couple lines of code that are required to unshadow the
bus so that the DOC (or motherboard's original bios chip) can become
visible to the mtd modules. The other motherboards (other chipsets)
appear to require more code to unshadow.

If i'm not mistaken, I won't be able to use the DOC with linux bios
until mtd can recognize the chip on bootup. (?)

well, code is there. it just needs to be integrated correct?

-- 

Roger
http://www.eskimo.com/~roger/index.html
