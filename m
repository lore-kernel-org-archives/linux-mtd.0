Received: from smtp-out.bhp.t-online.de ([195.145.119.39])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19GKyp-0000g3-3B
	for <linux-mtd@lists.infradead.org>; Thu, 15 May 2003 16:49:15 +0100
Received: from ylva.bhp.t-online.de (ylva.ada.t-online.de [172.30.8.40])
	21 2002)) with SMTP id <0HEX00IISQLPXY@smtp-out.bhp.t-online.de> for
	linux-mtd@lists.infradead.org; Thu, 15 May 2003 17:49:02 +0200 (MEST)
Date: Thu, 15 May 2003 18:48:10 +0200
From: Thomas Gleixner <tglx@linutronix.de>
In-reply-to: <20030515101003.471557de.emanning@austin.rr.com>
To: Earl Manning <emanning@austin.rr.com>, linux-mtd@lists.infradead.org
Message-id: <200305151848.10479.tglx@linutronix.de>
MIME-version: 1.0
Content-disposition: inline
References: <20030515101003.471557de.emanning@austin.rr.com>
Content-type: text/plain; charset=iso-8859-1
Content-transfer-encoding: 7BIT
Subject: Re: Generating a NAND Image
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thursday 15 May 2003 17:10, Earl Manning wrote:
> Is there a way to get a complete image off of a NAND part?  I have a
> partition describing the complete chip, but I need the OOB data inline with
> the rest of the data.  We need to send the data off to have it pre-burned
> in the flash chips.
>
mtd/util/nanddump.c
The only missing thing there is the userspace supllied ECC function. See 
nandwrite.c for an example. If you don't have it, you will read without ECC 
and you will get tons of kernel warnings.

P.S.
Could you provide a patch please, if it works ? :):)

-- 
Thomas
________________________________________________________________________
linutronix - competence in embedded & realtime linux
http://www.linutronix.de
mail: tglx@linutronix.de
