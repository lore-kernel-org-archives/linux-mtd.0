Received: from comal.ext.ti.com ([198.47.26.152])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UtYez-0001en-Kx
 for linux-mtd@lists.infradead.org; Mon, 01 Jul 2013 07:36:30 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "Artem Bityutskiy (artem.bityutskiy@linux.intel.com)"
 <artem.bityutskiy@linux.intel.com>
Subject: RE: [PATCH v5 3/3] mtd: devices: elm: Low power transition support
Date: Mon, 1 Jul 2013 07:35:57 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73E9E0CEC@DBDE04.ent.ti.com>
References: <1371494799-11876-1-git-send-email-pekon@ti.com>
 <1371494799-11876-4-git-send-email-pekon@ti.com>
In-Reply-To: <1371494799-11876-4-git-send-email-pekon@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "khilman@linaro.org" <khilman@linaro.org>,
 "tony@atomide.com" <tony@atomide.com>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>=20
> From: avinash philip <avinashphilip@ti.com>
>=20
> ELM is used for locating bit-flip errors in when using BCH ECC scheme.
> This patch adds suspend/resume support for leaf level ELM driver,
> And also provides ELM register context save & restore support, so that
> configurations are preserved across hardware power-off/on transitions.
>=20
> Signed-off-by: Philip Avinash <avinashphilip@ti.com>
> Signed-off-by: Pekon Gupta <pekon@ti.com>
> ---

Hi Artem,

In following series [Patch 1/3] and [Patch 2/3] were picked up by  Tony (fo=
r GPMC). But this last one is awaits your approval, as it touches ELM drive=
r in driver/*mtd*/devices. If everything clean then please pull this one fo=
r v3.11 merge.

Also, request you to please look into=20
"[PATCH v3 0/4] mtd:nand:omap2: clean-up of supported ECC schemes" series, =
if it can be taken for 3.11 merge, as lot of further omap2-nand driver enha=
ncements are based on this series.

Thanks ...
with regards, pekon
