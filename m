MIME-Version: 1.0
In-Reply-To: <CAMiH66H8GwK+5Zf8RLukC9O35eyQ6rVPYQhV2GarczFYmdpjMA@mail.gmail.com>
References: <1343215100-24005-1-git-send-email-festevam@gmail.com>
 <1343215100-24005-2-git-send-email-festevam@gmail.com>
 <CAMiH66H8GwK+5Zf8RLukC9O35eyQ6rVPYQhV2GarczFYmdpjMA@mail.gmail.com>
Date: Thu, 26 Jul 2012 07:35:51 -0300
Message-ID: <CAOMZO5Be+t46U=ffA31H=r7f_yLEEOcN+c1UvnFPPYb8hAnYvw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] mtd: nand: Let MTD_NAND_GPMI_NAND depend on MXS_DMA
From: Fabio Estevam <festevam@gmail.com>
To: Huang Shijie <shijie8@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 Artem.Bityutskiy@linux.intel.com, b32955@freescale.com,
 linux-mtd@lists.infradead.org, kernel@pengutronix.de, shawn.guo@linaro.org,
 dwmw2@infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 25, 2012 at 11:27 PM, Huang Shijie <shijie8@gmail.com> wrote:
> I think  we can merget the patch 1 and patch 2 to one patch.

I am not sure on this, as they have clearly different purposes.

Patch 1 fixes the text file and include mx6.

Patch 2 fixes a build issue for mx6.

I prefer to keep them as seperate patches.

Regards,

Fabio Estevam
