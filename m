Received: from mail-ey0-f177.google.com ([209.85.215.177])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q77Fw-0005F6-ST
	for linux-mtd@lists.infradead.org; Tue, 05 Apr 2011 14:29:21 +0000
Received: by eyh6 with SMTP id 6so138957eyh.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 Apr 2011 07:29:18 -0700 (PDT)
Subject: Re: [PATCH V8] MIPS: lantiq: add NOR flash support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: John Crispin <blogic@openwrt.org>
In-Reply-To: <1302013192-8854-1-git-send-email-blogic@openwrt.org>
References: <1302013192-8854-1-git-send-email-blogic@openwrt.org>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 05 Apr 2011 17:26:38 +0300
Message-ID: <1302013598.2760.140.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mips@linux-mips.org, Ralf Baechle <ralf@linux-mips.org>,
	Ralph Hempel <ralph.hempel@lantiq.com>, linux-mtd@lists.infradead.org,
	Daniel Schwierzeck <daniel.schwierzeck@googlemail.com>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-04-05 at 16:19 +0200, John Crispin wrote:

> +/* 
> + * The NOR flash is connected to the same external bus unit (EBU) as PCI.
> + * To make PCI work we need to enable the endianess swapping for the address
> + * written to the EBU. This endianess swapping works for PCI correctly but
> + * fails for attached NOR devices. To workaround this we need to use a complex
> + * map. The workaround involves swapping all addresses whilste probing the chip.
> + * Once probing is complete we stop swapping the addresses but swizzle the
> + * unlock addresses to ensure that access to the NOR device works correctly.
> + */
> +
> +enum ltq_nor_state {
> +	LTQ_NOR_PROBING,
> +	LTQ_NOR_NORMAL
> +};

You do not have to re-send because of this, just a note that in this
case it makes more sense to use anonymous enum. Indeed, you do not need
this 'ltq_nor_state' name at all, and C enums are not proper types
anyway (no real type-checking), so it is just a tiny bit nicer to do:

enum {
	LTQ_NOR_PROBING,
	LTQ_NOR_NORMAL
};

But this is not important at all, just a side note :-)

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
