Message-ID: <4F5DB541.3000107@freescale.com>
Date: Mon, 12 Mar 2012 16:35:13 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [PATCH] mtd/gpmi : fix the wrong DMA command.
References: <1331518938-24047-1-git-send-email-b32955@freescale.com>
 <20120312075107.GB3928@pengutronix.de>
In-Reply-To: <20120312075107.GB3928@pengutronix.de>
Content-Type: text/plain; charset="GB2312"
Content-Transfer-Encoding: quoted-printable
Cc: artem.bityutskiy@intel.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=D3=DA 2012=C4=EA03=D4=C212=C8=D5 15:51, Wolfram Sang =D0=B4=B5=C0:
> On Mon, Mar 12, 2012 at 10:22:18AM +0800, Huang Shijie wrote:
>> The last DMA command of ECC read page is used to disable the BCH modul=
e.
>> But the original code missed to set the pio[2] which is used to set th=
e
>> GPMI_HW_GPMI_ECCCTRL register. fix it now.
>>
>> Signed-off-by: Huang Shijie <b32955@freescale.com>
> Thanks! What does happen because of this bug? Additional checksum error=
s? I
> haven't seen many on MX28 IIRC, so I wonder.
>
The MX28 runs well without this patch. I guess the speed of mx28 is too
slow.

The bug only observed in mx6q. A DMA timeout occurs.

But if you apply this patch to mx28's code. A dma timeout occurs too.
This is why i sent the patch
"mxs-dma : rewrite the last parameter of mxs_dma_prep_slave_sg()"

IC guy told me to add a WAIT4END in the middle one of the ECC read page
chain, and disable the BCH in the last
DMA command of the chain. After this patch, the code follows this rule.


BR
Huang Shijie
