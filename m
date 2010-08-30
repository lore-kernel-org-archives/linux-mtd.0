Received: from mail-px0-f177.google.com ([209.85.212.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oq5Tk-0005Re-PR
	for linux-mtd@lists.infradead.org; Mon, 30 Aug 2010 14:36:57 +0000
Received: by pxi4 with SMTP id 4so2468671pxi.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 30 Aug 2010 07:36:52 -0700 (PDT)
From: Kevin Hilman <khilman@deeprootsystems.com>
To: dedekind1@gmail.com
Subject: Re: [PATCH 0/6] davinci: add support for aemif timing configuration
References: <1281349000-822-1-git-send-email-nsekhar@ti.com>
	<1283082501.2131.29.camel@brekeke>
Date: Mon, 30 Aug 2010 07:36:46 -0700
In-Reply-To: <1283082501.2131.29.camel@brekeke> (Artem Bityutskiy's message of
	"Sun, 29 Aug 2010 14:48:21 +0300")
Message-ID: <877hj8b20x.fsf@deeprootsystems.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Cc: linux-mtd@lists.infradead.org,
	davinci-linux-open-source@linux.davincidsp.com,
	Sekhar Nori <nsekhar@ti.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> writes:

> On Mon, 2010-08-09 at 15:46 +0530, Sekhar Nori wrote:
>> This series of patches adds support for AEMIF timing configuration
>> for DaVinci SoCs.
>> 
>> Currently AEMIF timing configuration is done as a special case for
>> DM644x EVM. This work provides for a generic way of doing this.
>> 
>> David,
>> 	Patch 1/6 and 2/6 of this series touch the
>> 	drivers/mtd/nand/davinci_nand.c file along with other arch specific
>> 	files. Based on the discussion on DaVinci list, Kevin is OK to merge
>> 	this with your agreement. Please let us know how to proceed.
>
> Pushed to l2-mtd-2.6.git / dunno.

Hi Artem,

If it's OK with you, and with your Ack, I'd prefer to merge this series
via the davinci tree.

The reason is because the files touched in arch/arm/mach-davinci/* are
also getting lots of other changes for 2.6.37, and I'd like to minimize
conflicts.

Let me know if that's OK with you and if I can add your signoff to the
drivers/mtd/* patches.  

Thanks,

Kevin
