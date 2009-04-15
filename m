Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LtyBz-0001Lc-9s
	for linux-mtd@lists.infradead.org; Wed, 15 Apr 2009 06:01:58 +0000
Subject: Re: UBIFS Corrupt during power failure
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20090414180010.GC32311@shareable.org>
References: <C77C279BA71FD14985DC8E75FB265AB702DEFBF5@usw-am-xch-02.am.trimblecorp.net>
	<C77C279BA71FD14985DC8E75FB265AB702E4C3CA@usw-am-xch-02.am.trimblecorp.net>
	<1239366310.3390.9.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE51AC@usw-am-xch-02.am.trimblecorp.net>
	<1239376652.3390.49.camel@localhost.localdomain>
	<1239378582.3390.66.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE5324@usw-am-xch-02.am.trimblecorp.net>
	<1239383500.3390.76.camel@localhost.localdomain>
	<C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>
	<1239689500.3390.82.camel@localhost.localdomain>
	<20090414180010.GC32311@shareable.org>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 15 Apr 2009 09:00:37 +0300
Message-Id: <1239775237.3390.144.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Urs Muff <urs_muff@Trimble.com>, Eric Holmberg <Eric_Holmberg@Trimble.com>,
	linux-mtd@lists.infradead.org, Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-04-14 at 19:00 +0100, Jamie Lokier wrote:
> Artem Bityutskiy wrote:
> > > This is for the CFI flash interface.  The
> > > drivers/mtd/chips/cfi_cmdset_0002.c driver has write buffers which is
> > > uses to do a "block" write to the NOR flash which for my chip allows
> > > writing up to 32 16-bit words. 
> > 
> > Oh, this is something from the CFI standard? Then we may just add this
> > knowledge to UBIFS: if this is NOR, then UBIFS knows that the up to 64
> > bytes may contain garbage.
> 
> I think the block write size is only used when you _submit_ a write of
> that many words or more.

Yes, this is my understanding too.

> So it would be correct for UBIFS to know that writes of N > 64(*)
> bytes may be broken into blocks, with corruption distributed
> anywhere within each of those blocks, but not more than one block.

I though the corruption will be inside the last block, because they
are written sequentially.

> But it doesn't mean the minimum safe write size is 64(*), because if
> UBIFS writes (say) 16 bytes for a small update, then the corruption
> should be limited to just those 16 bytes.

Right, I did not mean that. I meant that we can teach recovery code
to understand that the corruption may be withing 64-bytes.

> If you wrote a 16-byte item which encodes "and the next item I write
> will be 16-byte too", then you know if you see >16 corrupt bytes after
> the item that it's not due to power failure.  This even with a 64 byte
> buffer on the flash chip, because you know you will have done only a
> 16 byte write in that position.
> 
> I don't know if it's useful for UBIFS and its block scanning
> algorithm to consider item sizes in that much detail.

No, does not seem to be very useful.

> The main thing is you can write smaller items safely, so you don't
> have to pad them to 64 bytes and wear out the flash faster.  But
> scanning may need to use a 64 byte window to decide the corruption type.

Right. I assumed the same, may be I just did not put it clearly. But
thanks for this suggestion.

> That means MTD and UBI should export two values:
> 
>     - Maximum block write size which may be affected by power failure / reset.
>       (Maybe that needs an alignment too.)

Yup. MTD does not inform about this ATM, though.

>     - Minimum write size for padding written items.
>       (Is that assumed aligned?)

Right.

> For this particular NOR, the two values would be 64 bytes and 1 byte.
> I don't think it's specific to CFI.

Agree.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
