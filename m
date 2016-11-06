Subject: Re: [PATCH 13/22] mtd: nand: lpc32xx: return error code of
 nand_scan_ident/tail() on error
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-mtd@lists.infradead.org
References: <1478256190-7452-1-git-send-email-yamada.masahiro@socionext.com>
 <1478256190-7452-14-git-send-email-yamada.masahiro@socionext.com>
Cc: Sylvain Lemieux <slemieux.tyco@gmail.com>, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org
From: Vladimir Zapolskiy <vz@mleia.com>
Message-ID: <fab30f15-231a-f5fa-c547-025ee615b472@mleia.com>
Date: Sun, 6 Nov 2016 03:37:06 +0200
MIME-Version: 1.0
In-Reply-To: <1478256190-7452-14-git-send-email-yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/04/2016 12:43 PM, Masahiro Yamada wrote:
> The nand_scan_ident/tail() returns an appropriate error value when
> it fails.  Use it instead of the fixed error code -ENXIO.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---

Acked-by: Vladimir Zapolskiy <vz@mleia.com>

Thank you for the change.

--
With best wishes,
Vladimir
