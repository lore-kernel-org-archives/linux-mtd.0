Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15FZi1-0000NE-00
	for <linux-mtd@lists.infradead.org>; Thu, 28 Jun 2001 12:11:41 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <F83i95HfqR77bieLYCT000174a7@hotmail.com> 
References: <F83i95HfqR77bieLYCT000174a7@hotmail.com> 
To: "Svend Bengt" <pastaanta@hotmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: JEDEC flash confusion? 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 28 Jun 2001 12:16:55 +0100
Message-ID: <17844.993727015@redhat.com>
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

pastaanta@hotmail.com said:
>  What chip driver should generally be used for JEDEC flash chips? When
>  looking at the MTD snapshots i found both jedec.c, cfi_jedec.c and
> amd_flash.c as possible candidates. Will there be made a "unified"
> JEDEC  driver which incorporates support for all JEDEC flashes? 

Hopefully, yes. We'll use the cfi_cmdset_0002 back end, and write a probe
routine which does the necessary magic to identify the chips, then sets up a
faked CFI data structure.

Some work has already been done on this, but it is merged into the real CFI 
probe code, which in hindsight was probably the wrong thing to do - it 
should be separated into a new probe routine.

pastaanta@hotmail.com said:
> Here is my patch to mtd-snapshot-20010609 to include support for
> Macronix  flash. I hope you can use it. (Is this an OK way to supply
> patches?)

3 out of 3 hunks FAILED -- saving rejects to amd_flash.c.rej

Your mailer ate the whitespace.

--
dwmw2
