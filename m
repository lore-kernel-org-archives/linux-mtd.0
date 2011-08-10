Received: from db3ehsobe006.messaging.microsoft.com ([213.199.154.144]
	helo=DB3EHSOBE006.bigfish.com)
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QrATQ-0007t1-Gy
	for linux-mtd@lists.infradead.org; Wed, 10 Aug 2011 15:13:37 +0000
Message-ID: <4E42A017.7040608@freescale.com>
Date: Wed, 10 Aug 2011 10:13:27 -0500
From: Scott Wood <scottwood@freescale.com>
MIME-Version: 1.0
To: Jamie Iles <jamie@jamieiles.com>
Subject: Re: [PATCHv4] mtd: gpio-nand: add device tree bindings
References: <1312902747-21372-1-git-send-email-jamie@jamieiles.com>
In-Reply-To: <1312902747-21372-1-git-send-email-jamie@jamieiles.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Cc: Grant Likely <grant.likely@secretlab.ca>,
	David Woodhouse <dwmw2@infradead.org>, devicetree-discuss@lists.ozlabs.org,
	linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/09/2011 10:12 AM, Jamie Iles wrote:
> +Optional properties:
> +- bank-width : Width (in bytes) of the device.  If not present, the width
> +  defaults to 8 bits.

"in bytes" versus "defaults to 8 bits"...

> +- chip-delay : chip dependent delay for transferring data from array to
> +  read registers (tR).  If not present then a default of 0 is used.

nand_set_defaults() will set this to 20 us if you pass in zero.

> +- gpio-control-nand,io-sync-reg : A 64-bit physical address for a read
> +  location used to guard against bus reordering with regards to accesses to
> +  the GPIO's and the NAND flash data bus.  If present, then after changing
> +  GPIO state, this register will be read to ensure that the accesses have
> +  completed.

The driver does it before and after all cmd_ctrl byte writes, in
addition to after changing the GPIO state.

-Scott
