Subject: Re: [PATCH 00/22] mtd: nand: return error code of nand_scan(_ident,
 _tail) on error
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org
References: <1478256190-7452-1-git-send-email-yamada.masahiro@socionext.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, Kamal Dasu <kdasu.kdev@gmail.com>,
 Josh Wu <rainyfeeling@outlook.com>, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, Stefan Agner <stefan@agner.ch>,
 Vladimir Zapolskiy <vz@mleia.com>, Wenyou Yang <wenyou.yang@atmel.com>,
 linux-mediatek@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Sylvain Lemieux <slemieux.tyco@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
From: Marek Vasut <marek.vasut@gmail.com>
Message-ID: <7970b05b-a5d4-4149-ba80-f6d19a145c6d@gmail.com>
Date: Sat, 5 Nov 2016 08:34:26 +0100
MIME-Version: 1.0
In-Reply-To: <1478256190-7452-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/04/2016 11:42 AM, Masahiro Yamada wrote:
> 
> nand_scan(), nand_scan_ident(), nand_scan_tail() return
> an appropriate negative value on error.
> 
> Most of drivers return the value from them on error,
> but some of them return the fixed error code -ENXIO
> (and a few return -ENODEV).
> 
> This series make those drivers return more precise error code.
> 

Reviewed-by: Marek Vasut <marek.vasut@gmail.com>

Nice cleanup, thanks!

-- 
Best regards,
Marek Vasut
