From: "Gupta, Pekon" <pekon@ti.com>
To: Huang Shijie <b32955@freescale.com>
Subject: RE: [PATCH] mtd: gpmi: add gpmi_devdata{} to simplify the code
Date: Fri, 21 Mar 2014 10:29:36 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB4ECF@DBDE04.ent.ti.com>
References: <1395397179-17449-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1395397179-17449-1-git-send-email-b32955@freescale.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "dwmw2@infradead.org" <dwmw2@infradead.org>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>From: Huang Shijie
>
>More and more chips use the GPMI controller, but these chips may use diffe=
rent
>version of the IPs for GPMI and BCH. Different IPs have
> different features, such as the BCH's maximum ECC strength:
>
>     imx23/imx28 -- the BCH's maximum ECC strength is 20
>     imx6q       -- the BCH's maximum ECC strength is 40
>     imx6sx      -- the BCH's maximum ECC strength is 62
>
>This patch does the following things:
>
>  [1] add a new data structure, gpmi_devdata{}, to store the information f=
or
>      each IP.
Please see if you can use existing DT binding and framework for all these.


> Besides the IP version, we store the following information:
>         <1> BCH's maximum ECC strength.
>         <2> the maximum chain delay in ns used by the EDO mode.
>
>      but we may add more information in future.
>
Ezequiel has got approval for 2 new generic MTD bindings (refer l2-mtd.git)
	commit 8dd49165ef5f46b5ad9ba296c559ccff315f9421
	mtd: nand: Add a devicetree binding for ECC strength and ECC step size
So, I think <1> can be replaced by "nand-ecc-strength".


>
>  [2] add the gpmi_devdata_imx{23|28|6q} to replace the gpmi_ids.
>
Can you use "compatible" string in DT for this ?


>  [3] simplify the code by using the ECC strength from gpmi_devdata, such =
as
>      gpmi_check_ecc() and legacy_set_geometry();
>
>  [4] use the maximum chain delay to initialize the EDO mode,
>      see gpmi_compute_edo_timing().
>
>  [5] rewrite the macros, such GPMI_IS_MX{23|28|6Q}.
>
>Signed-off-by: Huang Shijie <b32955@freescale.com>
>---

with regards, pekon
