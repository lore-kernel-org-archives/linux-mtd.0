Received: from tx2ehsobe005.messaging.microsoft.com ([65.55.88.15]
 helo=tx2outboundpool.messaging.microsoft.com)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vdsz2-00038O-7v
 for linux-mtd@lists.infradead.org; Wed, 06 Nov 2013 02:36:40 +0000
Message-ID: <5279ABDF.7070709@freescale.com>
Date: Wed, 6 Nov 2013 10:39:27 +0800
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH v2] mtd: gpmi: add a new DT property to use the datasheet's
 minimum required ECC
References: <1382929517-22606-1-git-send-email-b32955@freescale.com>
 <20131105200729.GT20061@ld-irv-0074.broadcom.com>
In-Reply-To: <20131105200729.GT20061@ld-irv-0074.broadcom.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

=E4=BA=8E 2013=E5=B9=B411=E6=9C=8806=E6=97=A5 04:07, Brian Norris =E5=86=99=
=E9=81=93:
> This description still uses Linux-isms/MTD-isms (ecc_strength_ds,
> ecc_step_ds, nand_chip{}, JFFS2). I would personally write this as
> something like the following:
>
>    - fsl,use-minimum-ecc: Protect this NAND flash with the minimum ECC
> 			 strength required. The required ECC strength is
> 			 automatically discoverable for some flash
> 			 (e.g., according to the ONFI standard).
> 			 However, note that if this strength is not
> 			 discoverable, the software may choose an
> 			 implementation-defined ECC scheme.
this description is better then mine.

thanks
Huang Shijie
