Received: from mail-vb0-x233.google.com ([2607:f8b0:400c:c02::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V8i7p-0004ho-Qd
 for linux-mtd@lists.infradead.org; Mon, 12 Aug 2013 02:44:54 +0000
Received: by mail-vb0-f51.google.com with SMTP id x16so5341675vbf.24
 for <linux-mtd@lists.infradead.org>; Sun, 11 Aug 2013 19:44:32 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <201308092046.53352.marex@denx.de>
References: <1376072646-26089-1-git-send-email-computersforpeace@gmail.com>
 <201308092046.53352.marex@denx.de>
Date: Sun, 11 Aug 2013 19:44:31 -0700
Message-ID: <CAN8TOE8Gc=ftDxZFXD8g+tJDOP+hi74NX2NMNLtnzEdUuAut-A@mail.gmail.com>
Subject: Re: [PATCH] mtd: m25p80: Micron SPI uses Macronix-style 4-byte
 addressing
From: Brian Norris <computersforpeace@gmail.com>
To: Marek Vasut <marex@denx.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, stable@vger.kernel.org,
 Vivien Didelot <vivien.didelot@savoirfairelinux.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 9, 2013 at 11:46 AM, Marek Vasut <marex@denx.de> wrote:
> Dear Brian Norris,
>
>> For SPI NOR flash that are larger than 128Mbit (16MiB), we need 4 bytes
>> of address space to reach the entire flash; however, the original SPI
>> flash protocol used only 3 bytes for the address. So far, the practice
>> for handling this has been either to use new command opcodes that are
>> defined to use 4 bytes for their address, or to use special
>> mode-switching command to configure all traditionally-3-byte-address
>> commands to take 4 bytes instead.

[snip long description of a mess]

> The situation with the 4b addressing is a horrible mess :(

Agreed. It took me a while to figure out that this was the root of my
problems last week.

> Acked-by: Marek Vasut <marex@denx.de>

Thanks.

Brian
