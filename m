Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1RE98G-000814-B6
	for linux-mtd@lists.infradead.org; Thu, 13 Oct 2011 00:26:45 +0000
Received: by bkbc12 with SMTP id c12so951432bkb.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 12 Oct 2011 17:26:40 -0700 (PDT)
From: Marek Vasut <marek.vasut@gmail.com>
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH] Add driver for M-sys / Sandisk diskonchip G4 nand flash
Date: Thu, 13 Oct 2011 02:26:38 +0200
References: <1318258091-12670-1-git-send-email-mikedunn@newsguy.com>
	<8762jtlx19.fsf@free.fr>
In-Reply-To: <8762jtlx19.fsf@free.fr>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-6"
Content-Transfer-Encoding: 7bit
Message-Id: <201110130226.38567.marek.vasut@gmail.com>
Cc: linux-mtd@lists.infradead.org, Mike Dunn <mikedunn@newsguy.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wednesday, October 12, 2011 11:28:34 PM Robert Jarzmik wrote:
> Mike Dunn <mikedunn@newsguy.com> writes:
> > This is a driver for the diskonchip G4 in my Palm Treo680.  I've tested
> > it fairly well; it passes the nandtest utility, and I've been able to
> > create a ubifs using it.
> 
> Hi Mike,
> 
Hi Robert,

> I had a look at your driver, to see how close it was to the docg3 I
> submitted before and if we could share some code.
> 
> My feeling is that the 2 chips are a bit different, and that the deserve
> each a separate driver, until one can manage them both (if that ever is
> possible). The discrepencies I noticed are :
>  - docg4 doesn't need to write to an "address register" before reading some
>  random register (ie. between io+0x1000 and io+0x1800), docg3 needs it

This can be done on both ...

>  - docg4 adressing is larger (4 bytes against 3 in docg3)

if (drvdata->version == 4) {} ?

>  - docg4 adressing is different (the calculation 0x108 * page_number),
> while docg3 is more straight forward (0x100 * page)

See above ... you can determine if it's G3 or G4 by version register iirc ?

>  - in docg4 driver, I didn't see the "2 pages per block notion". I think
> it's there, but I couldn't find it
>  - some read/write sequences are different, with different registers, and
> with additionnal reads in your case (ie. the MYSTERY register for
> example).

This can be done on G3 too?

> 
> The good part is that I think we share the same registers, although you
> seem to have more of them. And I think the BCH algorithm is the same, and
> I'm really interested in the outcome of your work with Ivan.
> 
> Therefore, I'll help review your driver as much as I can, so that you can
> merge it in mainline.
>

Definitelly looking forward to this too. I can try on PalmT5 if you like, it 
SHOULD have a G3. You can also prep me a testing patch on top of this one which 
would add support for G3 and I can test that too.

Cheers
