Received: from gate.crashing.org ([63.228.1.57])
 by bombadil.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RnEE3-00063A-Pk
 for linux-mtd@lists.infradead.org; Tue, 17 Jan 2012 18:57:45 +0000
Subject: Re: [PATCH 2/2][v2] mtd/nand: Fix IFC driver to support 2K NAND page
Mime-Version: 1.0 (Apple Message framework v1251.1)
Content-Type: text/plain; charset=us-ascii
From: Kumar Gala <galak@kernel.crashing.org>
In-Reply-To: <4F0B901C.6020100@freescale.com>
Date: Tue, 17 Jan 2012 12:57:36 -0600
Content-Transfer-Encoding: quoted-printable
Message-Id: <C8C27406-1682-4316-97D1-00EFB5898805@kernel.crashing.org>
References: <1326111866-13120-1-git-send-email-prabhakar@freescale.com>
 <4F0B901C.6020100@freescale.com>
To: Scott Wood <scottwood@freescale.com>
Cc: Poonam Aggrwal <poonam.aggrwal@freescale.com>,
 linuxppc-dev@lists.ozlabs.org, linux-mtd@lists.infradead.org,
 Prabhakar Kushwaha <prabhakar@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Jan 9, 2012, at 7:10 PM, Scott Wood wrote:

> On 01/09/2012 06:24 AM, Prabhakar Kushwaha wrote:
>> 1) OOB area should be updated irrespective of NAND page size. Earlier =
it was
>> updated only for 512byte NAND page.
>>=20
>> 2) During OOB update fbcr should be equal to OOB size.
>>=20
>> Signed-off-by: Poonam Aggrwal <poonam.aggrwal@freescale.com>
>> Signed-off-by: Prabhakar Kushwaha <prabhakar@freescale.com>
>> ---
>> git://git.kernel.org/pub/scm/linux/kernel/git/galak/powerpc.git =
(branch next)
>>=20
>> This patch is created on top of IFC driver patch (already floated in =
mailing
>> list). Please find their link:
>> http://patchwork.ozlabs.org/patch/133315/
>> http://patchwork.ozlabs.org/patch/133316/
>=20
> Looks good.
>=20
> -Scott

Can we not merge all these into one updated IFC NAND patch?

- k=
