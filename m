Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fDA7r-0000nQ-1M
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2018 14:50:00 +0000
Date: Mon, 30 Apr 2018 16:49:36 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Aaron Sierra <asierra@xes-inc.com>
Cc: David Woodhouse <dwmw2@infradead.org>, Brian Norris
 <computersforpeace@gmail.com>, Boris Brezillon
 <boris.brezillon@free-electrons.com>, Marek Vasut <marek.vasut@gmail.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd
 <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH RESEND] mtd: cfi: Support early CFI fixups
Message-ID: <20180430164936.5a7012c6@bbrezillon>
In-Reply-To: <370277171.65649.1525099125471.JavaMail.zimbra@xes-inc.com>
References: <2051977971.384388.1524012814487.JavaMail.zimbra@xes-inc.com>
 <20180430123956.05074e3b@bbrezillon>
 <370277171.65649.1525099125471.JavaMail.zimbra@xes-inc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 30 Apr 2018 09:38:45 -0500 (CDT)
Aaron Sierra <asierra@xes-inc.com> wrote:

> >> --- a/include/linux/mtd/cfi.h
> >> +++ b/include/linux/mtd/cfi.h
> >> @@ -353,6 +353,15 @@ void __xipram cfi_qry_mode_off(uint32_t base, struct
> >> map_info *map,
> >>  
> >>  struct cfi_extquery *cfi_read_pri(struct map_info *map, uint16_t adr, uint16_t
> >>  size,
> >>  			     const char* name);
> >> +
> >> +/* CFI fixup that can occur immediately after reading */  
> > 
> >					   ^ "after reading the ID" ?  
> 
> After reading the CFI structure out of the device, not just the ID. These
> fixups apply to the just-read, byte-swapped, in-memory representation of
> the CFI structure. Is more clarification necessary?

Yep, you should say after reading what. "after reading the CFI
structure out of the device" sounds good.

> 
> >> +struct cfi_early_fixup {
> >> +	uint16_t mfr;
> >> +	uint16_t id;
> >> +	void (*fixup)(struct cfi_private *cfi);
> >> +};
> >> +
> >> +/* CFI fixup that can only occur after MTD device exists */
> >>  struct cfi_fixup {
> >>  	uint16_t mfr;
> >>  	uint16_t id;
> >> @@ -380,6 +389,7 @@ struct cfi_fixup {
> >>  #define CFI_MFR_TOSHIBA		0x0098
> >>  #define CFI_MFR_WINBOND		0x00DA
> >>  
> >> +void cfi_early_fixup(struct cfi_private *cfi, struct cfi_early_fixup *fixups);  
> > 
> > Is cfi_early_fixup() intended to be used outside of cfi_probe.c? If
> > that's not the case, I'd recommend to keep the struct and function def
> > in cfi_probe.c.  
> 
> It is not, but since this is adding a second fixup mechanism for CFI, I
> thought there may be value in defining both of them in close proximity to
> each  other. That way anyone looking for available mechanisms would find
> both instead of only one or the other. Does that value outweigh it only
> being used in one file?

Well, we try to avoid exposing symbols when they're only used from the
file itself. If someone ever needs a similar mechanism in a different
file (cfi_jedec.c for example), we'll consider exposing it in
cfi_util.c/cfi.h, but that's not the case yet, so let's keep it private
to cfi_probe.c for now.
