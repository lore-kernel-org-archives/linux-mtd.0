Received: from wproxy.gmail.com ([64.233.184.201])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FDl1h-0001wt-IR
	for linux-mtd@lists.infradead.org; Mon, 27 Feb 2006 11:15:13 -0500
Received: by wproxy.gmail.com with SMTP id i30so864536wra
	for <linux-mtd@lists.infradead.org>;
	Mon, 27 Feb 2006 08:15:07 -0800 (PST)
Message-ID: <625fc13d0602270815l5c334b06u1a41a1ed7b7dc4ad@mail.gmail.com>
Date: Mon, 27 Feb 2006 10:15:07 -0600
From: "Josh Boyer" <jwboyer@gmail.com>
To: "Artem B. Bityutskiy" <dedekind@yandex.ru>
In-Reply-To: <44032266.1040501@yandex.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <43EB96DC.3030900@eptar.com> <43F74BF1.1080307@ru.mvista.com>
	<1140337326.2480.674.camel@localhost.localdomain>
	<200602210942.38302.manningc2@actrix.gen.nz>
	<1140471467.2480.793.camel@localhost.localdomain>
	<43FB00B4.9040706@yandex.ru>
	<1140523614.2480.931.camel@localhost.localdomain>
	<44004666.8030805@yandex.ru>
	<625fc13d0602270527k39b18cabv5762c008bb1e2b73@mail.gmail.com>
	<44032266.1040501@yandex.ru>
Cc: tglx@linutronix.de, linux-mtd@lists.infradead.org
Subject: Re: [Yaffs] bit error rates --> a vendor speaks
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2/27/06, Artem B. Bityutskiy <dedekind@yandex.ru> wrote:
> Josh Boyer wrote:
> > Often times the eraseregions have no practical use for the software
> > involved.  Take the Intel P30 for example.  It has a few eraseblocks
> > at either the top or bottom of the chip that are different eraseblock
> > size.
> This explains why putting this all together in one mtd-> structure is
> bad  (they have different eraseblocks size).

The chip driver abstracts that away.  The users of the device
typically don't _know_ there are different eraseregions.

>
> > If you have different eraseregions show up as different MTD devices
> > (or partitions which are essentially the same thing in this
> > discussion),
> Err, actually partitions are better, because they are handeled by the
> same flash driver.

I meant that for all intents and purposes, partitions show up as
completely different MTD devices.  They aren't traditional partitions
as on a hard drive.  It's unrelated to this topic, so ignore that.

>
> > then you have to manually concatenate them back into a
> > single device.
> What for do you need to concatenate them back? Different erase regions
> are used for completely different purposes, right? So if you work with
> the small "boot" region, you don't normally need the rest of the flash
> and vice versa.

Different erase regions _can_ be used for completely different
purposes.  Often, they aren't used at all.  Which means that if the
show up as a separate device, you have to concatenate them back
together.

> My point is that there should be a generalized flash model like this:
>
> 1. there are only 3 operations: read, write, erase;
> 2. erase is done in terms of eraseblocks, eraseblocks are all equivalent
> in size;
> 4. there is a minimal input/output unit exists;
>
> That's all. Erase regions and OOB is out of this simple flash model, do
> you see what I mean? Add your erase regions to this model and you'll end
> up with a mess. Organize these regions as different instances of the
> above generalized model, and you have a very nice picture.

A very nice picture that complicates things for end users and wastes
DRAM when there is no intention to use the eraseregions differently.

I can buy the OOB argument.  I think we'll have to agree to disagree
on the eraseregion stuff.

josh
