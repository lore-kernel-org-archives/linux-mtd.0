Received: from ip66-35-227-11.altera.com ([66.35.227.11] helo=www.altera.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 161qDI-0003QP-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Nov 2001 14:31:28 +0000
Message-ID: <82B1591A280FD411B91200D0B75B484A015F5D4D@sis-uk-msg01.altera.com>
From: Clive Davies <cdavies@altera.com>
To: "'David Woodhouse'" <dwmw2@infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: RE: Intel protection register read 
Date: Thu, 8 Nov 2001 06:41:04 -0800 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
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

> > +	unsigned char *ProtRegData;  /* Protection register 
> data bytes */
> > 	struct flchip chips[0];  /* per-chip data structure for 
> each chip */
> 
> The ProtRegData are per-chip, but you've only left space for 
> one pointer. 
> What happens when people have arrays of multiple chips 
> side-by-side and/or
> consecutively mapped?
> 

Hmm, this is a problem. Am I correct in thinking that the code only reads
the cfi tables from the first device and assumes that any additional devices
are of the same type? (That's what it looks like to me) If so there is no
way to read the protection register data from subsequent devices. 

I reckon the best way to handle the multiple/interleaved chip configuration
would be to concatenate all the protection registers together into one
block. All the other interfaces I can think of would require a chip number
to be passed in, which doesn't seem that nice to me. Does that sound
reasonable?

> Also, isn't it possible to _write_ to the user areas of the chips?
> 

Yes it is, but I haven't implemented that because I don't need it. If adding
writes is a condition for getting read functionality into cvs then I can do
that too.

> do you need 
> to check the version number?
Yes, I'd assumed that the data in the table would default to zero for
earlier versions but I'm not so sure now. I'll fix that.

Thanks,
Clive
