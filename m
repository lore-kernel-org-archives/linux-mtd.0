Received: from www.tglx.de ([62.245.132.106])
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1N897j-0008Bu-Qy
	for linux-mtd@lists.infradead.org; Wed, 11 Nov 2009 09:04:24 +0000
To: dedekind1@gmail.com
Subject: Re: mxc nand i.mx35: no OOB with HW_ECC
From: John Ogness <john.ogness@linutronix.de>
References: <80bpjj7hrd.fsf@merkur.tec.linutronix.de>
	<1257924123.21596.830.camel@localhost>
Date: Wed, 11 Nov 2009 10:04:12 +0100
In-Reply-To: <1257924123.21596.830.camel@localhost> (Artem Bityutskiy's
	message of "Wed\, 11 Nov 2009 09\:22\:03 +0200")
Message-ID: <80ljid301f.fsf@merkur.tec.linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: s.hauer@pengutronix.de, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2009-11-11, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> The problem is that for page sizes larger than 512 bytes, the i.MX35
>> NANDFC can only write the page and oob data together. When writing
>> the page and oob data, the ECC hardware also writes the ECC codes for
>> it. This is ok if the filesystem driver or userspace application
>> understands that only one write per page+oob is allowed.
>> 
>> But jffs2 and "nandwrite -n -o" assume that they can write the oob
>> data and the page data separately. With the recently posted
>> mxc_nand.c driver, this results in the NANDFC writing the ECC codes
>> to flash twice... with different values. This means the ECC codes
>> that end up on the flash chip are garbage.
>
> Err, the classical model is that you can write whole page (or
> sub-pages), then the driver/HW also generates ECC and stores it in the
> OOB. However, traditionally ECC codes do not occupy whole OOB, so
> there is space left. And you can write separately to that space.

That is the problem. With the i.MX35 you can _not_ write separately to
that leftover space (at some other time) because the hardware ECC codes
are calculated based on the values within that leftover space as
well. The OOB and page data must be written simultaneously, at which
point the ECC codes over the OOB and page data will also be
written. Afterwards, neither the OOB data nor the page data may be
written to again until the block has been erased.

> Your case is confusing. If your ECC occupies whole OOB, your driver
> should simply prohibit writing to the OOB. If it does not, it is your
> drivers' fault.

Perhaps it is the "fault" of the hardware ECC that is including the OOB
data when calculating the ECC codes. If leftover OOB space and page data
are written simultaneously, there is no problem. The problem arises when
they are written separately, which I suppose is the classical model.

> Really, your driver should either correctly support the classical
> model, or it should simply not support OOB writing at all. Not
> something in the middle, right?

Agreed. The i.MX35 NANDFC driver should not support OOB writing (if
hardware ECC is used) because its ECC hardware is not capable of
supporting the classical model.

John Ogness
