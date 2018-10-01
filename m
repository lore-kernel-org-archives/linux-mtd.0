Received: from gate2.alliedtelesis.co.nz ([2001:df5:b000:5::4])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g76GC-0007zv-Gu
 for linux-mtd@lists.infradead.org; Mon, 01 Oct 2018 22:01:56 +0000
From: Chris Packham <Chris.Packham@alliedtelesis.co.nz>
To: Boris Brezillon <boris.brezillon@bootlin.com>
CC: Daniel Mack <daniel@zonque.org>, Miquel Raynal
 <miquel.raynal@bootlin.com>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>, "stable@vger.kernel.org"
 <stable@vger.kernel.org>
Subject: Re: [PATCH v2] mtd: rawnand: marvell: check for RDY bits after
 enabling the IRQ
Date: Mon, 1 Oct 2018 22:01:27 +0000
Message-ID: <c8de62fb56fd493baa8b1f6343bb8bfe@svr-chch-ex1.atlnz.lc>
References: <20181001234120.425ae1f5@bbrezillon>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 02/10/18 10:41, Boris Brezillon wrote:=0A=
> On Mon, 1 Oct 2018 22:34:38 +0200=0A=
> Boris Brezillon <boris.brezillon@bootlin.com> wrote:=0A=
>    =0A=
>>>=0A=
>>> I'd previously tried readl() based on the same hunch. No change.=0A=
>>>=0A=
>>> I think my snippet above might be misleading. While a delay between=0A=
>>> readl_relaxed() and the if should not change the outcome, this is also =
a=0A=
>>> delay between marvell_nfc_enable_int() and marvell_nfc_disable_int()=0A=
>>> which is probably more significant. Sure enough if I move the delay to=
=0A=
>>> just before the marvell_nfc_disable_int() the error is not seen.=0A=
>>=0A=
>> AFAICT, your timeout always happens when waiting for RDREQ, not RDYM.=0A=
>> So maybe disabling MRDY too early has a side-effect on the RDREQ event.=
=0A=
> =0A=
> Can you try with this patch [1]? It should ensure that NDSR_RDY bits=0A=
> are cleared before starting an operation.=0A=
> =0A=
> [1]http://code.bulix.org/lgs30c-468205=0A=
> =0A=
=0A=
No luck. I applied that on top of Daniel's and got the same result.=0A=
=0A=
One thing that does look promising is the following modification of =0A=
Daniel's patch[1]. Which moves the RDY check to before where the =0A=
interrupts are enabled.=0A=
=0A=
[1] - http://code.bulix.org/gc7a6d-468226=0A=
