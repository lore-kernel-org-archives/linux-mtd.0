Received: from mail-ve0-f172.google.com ([209.85.128.172])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V7uJB-0001Gx-DF
 for linux-mtd@lists.infradead.org; Fri, 09 Aug 2013 21:33:17 +0000
Received: by mail-ve0-f172.google.com with SMTP id oz10so4341300veb.17
 for <linux-mtd@lists.infradead.org>; Fri, 09 Aug 2013 14:32:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1376072646-26089-1-git-send-email-computersforpeace@gmail.com>
References: <1376072646-26089-1-git-send-email-computersforpeace@gmail.com>
Date: Fri, 9 Aug 2013 14:32:51 -0700
Message-ID: <CAN8TOE_3i7WSi1XrO0OWa=EggacMOU+vGcHw26EEn84CN=f_KA@mail.gmail.com>
Subject: Re: [PATCH] mtd: m25p80: Micron SPI uses Macronix-style 4-byte
 addressing
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: Marek Vasut <marex@denx.de>, Brian Norris <computersforpeace@gmail.com>,
 Vivien Didelot <vivien.didelot@savoirfairelinux.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 9, 2013 at 11:24 AM, Brian Norris
<computersforpeace@gmail.com> wrote:
> Quoting a Micron representative:
>
>   "Majority of our NOR that needs 4-byte addressing (256Mb or 32MB and
>    higher) enter and exit 4byte through B7h and E9h commands. The
>    N25Q256A7xxx and N25Q512A7xxx parts do not support 4-byte addressing
>    mode via B7h or E9h command."
>
> They further clarified that those that don't support the enter/exit
> opcodes (B7h/E9h) are manufactured specifically to come up by default in
> 4-byte mode. We don't need to treat those parts any diffently, as they
> will discard the EN4B opcode as a no-op.

A clarification: it seems that *all* large Micron SPI flash support
the B7h and E9h opcodes, just that some default to 4-byte addressing.
The patch stands as-is, but I'd replace this part of the changelog
with:

"Micron confirmed that all large (>16MiB) Micron SPI support the B7h
and E9h opcodes."

Thanks,
Brian
