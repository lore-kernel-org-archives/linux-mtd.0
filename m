Received: from devils.ext.ti.com ([198.47.26.153])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VOWye-0008Ga-Sr
 for linux-mtd@lists.infradead.org; Tue, 24 Sep 2013 18:04:49 +0000
From: "Gupta, Pekon" <pekon@ti.com>
To: "olof@lixom.net" <olof@lixom.net>, "benoit.cousson@linaro.org"
 <benoit.cousson@linaro.org>, "devicetree@vger.kernel.org"
 <devicetree@vger.kernel.org>, "arnd@arndb.de" <arnd@arndb.de>
Subject: RE: [PATCH v6 1/4] ARM: OMAP2+: cleaned-up DT support of various
 ECC schemes
Date: Tue, 24 Sep 2013 18:04:05 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EA15ED7@DBDE04.ent.ti.com>
References: <1378986619-26765-1-git-send-email-pekon@ti.com>
 <1378986619-26765-2-git-send-email-pekon@ti.com>
In-Reply-To: <1378986619-26765-2-git-send-email-pekon@ti.com>
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "tony@atomide.com" <tony@atomide.com>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>, "Balbi,
 Felipe" <balbi@ti.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


>=20
> This patch
> - updates DT binding for selection of ecc-scheme
> - updates DT binding for detection of ELM h/w engine
> - removes following obselete ECC schemes
> 	OMAP_ECC_HAMMING_CODE_DEFAULT (S/W based 1-bit Hamming
> ECC)
> 	OMAP_ECC_HAMMING_CODE_HW_ROMCODE (H/W based 1-bit
> Hamming ECC scheme)
> - updates DT binding documentation for mtd/gpmc-nand
>=20
> Signed-off-by: Pekon Gupta <pekon@ti.com>
> ---

Dear Olof and other DT Maintainers,

This patch series has missed multiple merge windows, and
much of the other development work on mtd/nand/omap
driver is gated due to this.
So, request you to please review this patch set and Ack it
if all your mentioned concerns are resolved.


With regards, pekon
