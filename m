Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VAmDh-0001ZN-6A
 for linux-mtd@lists.infradead.org; Sat, 17 Aug 2013 19:31:30 +0000
Received: by mail-pd0-f182.google.com with SMTP id r10so3463562pdi.41
 for <linux-mtd@lists.infradead.org>; Sat, 17 Aug 2013 12:31:07 -0700 (PDT)
Date: Sat, 17 Aug 2013 12:31:03 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: m25p80: Micron SPI uses Macronix-style 4-byte
 addressing
Message-ID: <20130817193103.GC11210@norris.computersforpeace.net>
References: <1376072646-26089-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1376072646-26089-1-git-send-email-computersforpeace@gmail.com>
Cc: Marek Vasut <marex@denx.de>,
 Vivien Didelot <vivien.didelot@savoirfairelinux.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 09, 2013 at 11:24:06AM -0700, Brian Norris wrote:
> For SPI NOR flash that are larger than 128Mbit (16MiB), we need 4 bytes
> of address space to reach the entire flash; however, the original SPI
> flash protocol used only 3 bytes for the address. So far, the practice
> for handling this has been either to use new command opcodes that are
> defined to use 4 bytes for their address, or to use special
> mode-switching command to configure all traditionally-3-byte-address
> commands to take 4 bytes instead.
> 
> Macronix and Spansion developed two incompatible methods for
> entering/exiting "4-byte address mode." Micron flash uses the Macronix
> method (OPCODE_{EN4B,EX4B}), not the Spansion method.
> 
> This patch solves addressing issues on Micron n25q256a and provides the
> ability to support other future Micron SPI flash >16MiB.
> 
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

Just as a final clarification: Micron corrected themselves back to this
original statement. So some parts will come up in 4-byte mode and will
ignore the EN4B/EX4B commands.

With that, I just pushed this patch to l2-mtd.git with the original
comment, as that was the correct one.

Thanks,
Brian
