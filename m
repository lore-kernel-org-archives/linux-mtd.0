Received: from eu-smtp-delivery-143.mimecast.com ([207.82.80.143])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRapi-0004sO-31
 for linux-mtd@lists.infradead.org; Tue, 18 Aug 2015 06:57:18 +0000
Date: Tue, 18 Aug 2015 14:56:49 +0800
From: Huang Shijie <shijie.huang@arm.com>
To: Han Xu <b45815@freescale.com>
Cc: dwmw2@infradead.org, computersforpeace@gmail.com,
 boris.brezillon@free-electrons.com, fabio.estevam@freescale.com,
 hofrat@osadl.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, vinod.koul@intel.com,
 dan.j.williams@intel.com, dmaengine@vger.kernel.org
Subject: Re: [PATCH v2 5/6] mtd: nand: gpmi: correct bitflip for erased NAND
 page
Message-ID: <20150818065649.GC10641@free64-pc.asiapac.arm.com>
References: <1439868301-24937-1-git-send-email-b45815@freescale.com>
MIME-Version: 1.0
In-Reply-To: <1439868301-24937-1-git-send-email-b45815@freescale.com>
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 17, 2015 at 10:25:01PM -0500, Han Xu wrote:
> i.MX6QP and i.MX7D BCH module integrated a new feature to detect the
> bitflip number for erased NAND page. So for these two platform, set the
> erase threshold to gf/2 and if bitflip detected, GPMI driver will
> correct the data to all 0xFF.
>=20
> Signed-off-by: Han Xu <b45815@freescale.com>
Thanks to the hardware guys! They makes the code much clear and simple.

Acked-by: Huang Shijie <shijie.huang@arm.com>
