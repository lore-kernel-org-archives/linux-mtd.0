MIME-Version: 1.0
In-Reply-To: <1349837086-21844-1-git-send-email-b32955@freescale.com>
References: <1349837086-21844-1-git-send-email-b32955@freescale.com>
Date: Wed, 10 Oct 2012 01:54:56 -0300
Message-ID: <CAOMZO5A0UX6y3MtHdzZ8V2Z52qsH8Yy-BVtOYEN_OpBezEsvQw@mail.gmail.com>
Subject: Re: [PATCH] ARM: dts: imx28: add the `clock-names` for gpmi-nand
From: Fabio Estevam <festevam@gmail.com>
To: Huang Shijie <b32955@freescale.com>
Content-Type: text/plain; charset=UTF-8
Cc: marex@denx.de, shawn.guo@linaro.org, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,

On Tue, Oct 9, 2012 at 11:44 PM, Huang Shijie <b32955@freescale.com> wrote:
> The current DT node misses the `clocks-names` item for gpmi-nand.
> So the gpmi-nand driver could not find the proper clock.
>
> This patch fixes this issue.
>
> Signed-off-by: Huang Shijie <b32955@freescale.com>

Thanks for the fix.

Could you please also fix mx23 in the same patch?

Regards,

Fabio Estevam
