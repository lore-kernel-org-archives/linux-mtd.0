Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QU5DC-00025t-5J
	for linux-mtd@lists.infradead.org; Tue, 07 Jun 2011 22:57:27 +0000
Received: by wyb28 with SMTP id 28so5399185wyb.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 07 Jun 2011 15:57:22 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4DEDD2A3.8030408@compulab.co.il>
References: <1306360741-12770-1-git-send-email-computersforpeace@gmail.com>
	<4DDDE19D.9010505@compulab.co.il>
	<1306387008.2785.138.camel@localhost>
	<BANLkTimsTWAcR4HgOoHguDMv9P-Eox=kbg@mail.gmail.com>
	<1306924235.4405.102.camel@localhost>
	<BANLkTi=BYeQ+cBMpRodDDY_KapjEoHVA+A@mail.gmail.com>
	<4DEDD2A3.8030408@compulab.co.il>
Date: Tue, 7 Jun 2011 15:57:22 -0700
Message-ID: <BANLkTimo0iHCmgc1wfSG=1OUO8f0G2Vccg@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: nand: generalized error messages with __func__
From: Brian Norris <computersforpeace@gmail.com>
To: Igor Grinberg <grinberg@compulab.co.il>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jun 7, 2011 at 12:26 AM, Igor Grinberg <grinberg@compulab.co.il> wrote:
> You should not define pr_fmt() in .h file.
> pr_fmt() should be defined in _.c_ file at the top - _before any include is done_.
> And yes, like Artem already said, _only_ in those _.c_ files where we want to use it.

Hmm, well I guess I'll try defining pr_fmt() in nand_bbt.c only. Look
for the following patchset shortly:
* removing those printk's when a memory allocations fail
* changing other printk's to pr_*'s
* changing some DEBUG messages to dev_dbg
* define pr_fmt() to include __func__ in debug messages for nand_bbt.c

The only inconsistency with the 4th patch is that it adds the __func__
prefix to some print messages that didn't have them previously. Thus,
I'd be fine if the 4th patch is dropped.

Thanks,
Brian
