Received: from anchor-post-30.mail.demon.net ([194.217.242.88])
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1AFEDv-00028L-2N
	for <linux-mtd@lists.infradead.org>; Thu, 30 Oct 2003 14:56:31 +0000
From: Simon Haynes <simon@baydel.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Thu, 30 Oct 2003 14:26:30 +0000
References: <3F9F94C0.28402.10FED3@localhost>
	<1067424903.15551.1537.camel@hades.cambridge.redhat.com>
In-Reply-To: <1067424903.15551.1537.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Message-ID: <EDC19A8677F@baydel.com>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
cc: linux-mtd@lists.infradead.org
Subject: Re: SmartMedia FAT
Reply-To: simon@baydel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I have been looking at the OOB data format for SSFDC and it seems I will have 
to create and process my own OOB data as I can not see how the NAND/MTD layer 
will work with this. 

When we started this project there seemed to be a fixed NAND OOB format. Now 
the NAND OOB format is selectable. I have noticed in a couple of kernel 
distributions that the JFFS2 code does not seem to be aware of this and just 
calls pain mtd->read. I guess this would mean no ecc for JFFS2 on NAND unless 
it was done automatically by the hardware. This was the case for latest 
stable kernel, 2.4.22 downloaded from kernel.org today. 

Is this really the case ?

Cheers

Simon.


On Wednesday 29 Oct 2003 10:55 am, David Woodhouse wrote:
> On Wed, 2003-10-29 at 10:21 +0000, simon@baydel.com wrote:
> > Thanks too all for your help. I have started to write my own block
> > driver using the FTL code as a guide. It seems fairly simple and
> > should not take too long.
>
> Send me a SSH key and I'll give you an account so you can put it in CVS.
> Commit early and often and I'll try to heckle helpfully... :)
