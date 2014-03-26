From: "Gupta, Pekon" <pekon@ti.com>
To: Lee Jones <lee.jones@linaro.org>, "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Subject: RE: [RFC 43/47] mtd: nand: stm_nand_bch: read and write functions
 (BCH)
Date: Wed, 26 Mar 2014 10:31:14 +0000
Message-ID: <20980858CB6D3A4BAE95CA194937D5E73EAB5CC7@DBDE04.ent.ti.com>
References: <1395735604-26706-1-git-send-email-lee.jones@linaro.org>
 <1395735604-26706-44-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1395735604-26706-44-git-send-email-lee.jones@linaro.org>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: "angus.clark@st.com" <angus.clark@st.com>,
 "kernel@stlinux.com" <kernel@stlinux.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "Ezequiel Garcia
 \(ezequiel.garcia@free-electrons.com\)" <ezequiel.garcia@free-electrons.com>,
 "computersforpeace@gmail.com" <computersforpeace@gmail.com>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Lee,

>From: Lee Jones [mailto:lee.jones@linaro.org]
>
>Helper function for bch_mtd_read() and bch_mtd_write() to handle
>multi-page or non-aligned reads and writes respectively.
>
>Signed-off-by: Lee Jones <lee.jones@linaro.org>
>---

I think below code is duplicate of nand_do_read_ops() and nand_do_write_ops=
()
in nand_base.c. If you could just populate chip->ecc.read_page and
chip->ecc.write_page much of this could be avoided.
Also, you need to break your bch_read_page() into given generic NAND
driver interfaces chip->ecc.calculate(), chip->ecc.correct() ...

This would make your driver much more simpler, and easy to maintain.


> drivers/mtd/nand/stm_nand_bch.c | 143 +++++++++++++++++++++++++++++++++++=
+++++
> 1 file changed, 143 insertions(+)
>
>diff --git a/drivers/mtd/nand/stm_nand_bch.c b/drivers/mtd/nand/stm_nand_b=
ch.c
>index 389ccee..bcaed32 100644
>--- a/drivers/mtd/nand/stm_nand_bch.c
>+++ b/drivers/mtd/nand/stm_nand_bch.c
>@@ -507,6 +507,149 @@ static uint8_t bch_write_page(struct nandi_controlle=
r *nandi,
> 	return status;
> }
>
>+/* Helper function for bch_mtd_read to handle multi-page or non-aligned r=
eads */
>+static int bch_read(struct nandi_controller *nandi,
>+		    loff_t from, size_t len,
>+		    size_t *retlen, u_char *buf)
>+{
>+	struct mtd_ecc_stats stats;
>+	uint32_t page_size =3D nandi->info.mtd.writesize;
>+	uint32_t col_offs;
>+	loff_t page_mask;
>+	loff_t page_offs;
>+	int ecc_errs, max_ecc_errs =3D 0;
>+	int page_num;
>+	size_t bytes;
>+	uint8_t *p;
>+	bool bounce =3D false;
>+
>+	dev_dbg(nandi->dev, "%s: %llu @ 0x%012llx\n", __func__,
>+		(unsigned long long)len, from);
>+
>+	stats =3D nandi->info.mtd.ecc_stats;
>+	page_mask =3D (loff_t)page_size - 1;
>+	col_offs  =3D (uint32_t)(from & page_mask);
>+	page_offs =3D from & ~page_mask;
>+	page_num  =3D (int)(page_offs >> nandi->page_shift);
>+
>+	while (len > 0) {
>+		bytes =3D min((page_size - col_offs), len);
>+
>+		if ((bytes !=3D page_size) ||
>+		    ((unsigned int)buf & (NANDI_BCH_DMA_ALIGNMENT - 1)) ||
>+		    (!virt_addr_valid(buf))) /* vmalloc'd buffer! */
>+			bounce =3D true;
>+
>+		if (page_num =3D=3D nandi->cached_page) {
>+			memcpy(buf, nandi->page_buf + col_offs, bytes);
>+			goto done;
>+		}
>+
>+		p =3D bounce ? nandi->page_buf : buf;
>+
>+		ecc_errs =3D bch_read_page(nandi, page_offs, p);
>+		if (bounce)
>+			memcpy(buf, p + col_offs, bytes);
>+
>+		if (ecc_errs < 0) {
>+			dev_err(nandi->dev,
>+				"%s: uncorrectable error at 0x%012llx\n",
>+				__func__, page_offs);
>+			nandi->info.mtd.ecc_stats.failed++;
>+
>+			/* Do not cache uncorrectable pages */
>+			if (bounce)
>+				nandi->cached_page =3D -1;
>+
>+			goto done;
>+		}
>+
>+		if (ecc_errs) {
>+			dev_info(nandi->dev,
>+				 "%s: corrected %u error(s) at 0x%012llx\n",
>+				 __func__, ecc_errs, page_offs);
>+
>+			nandi->info.mtd.ecc_stats.corrected +=3D ecc_errs;
>+
>+			if (ecc_errs > max_ecc_errs)
>+				max_ecc_errs =3D ecc_errs;
>+		}
>+
>+		if (bounce)
>+			nandi->cached_page =3D page_num;
>+
>+done:
>+		buf +=3D bytes;
>+		len -=3D bytes;
>+
>+		if (retlen)
>+			*retlen +=3D bytes;
>+
>+		/* We are now page-aligned */
>+		page_offs +=3D page_size;
>+		page_num++;
>+		col_offs =3D 0;
>+	}
>+
>+	/* Return '-EBADMSG' on uncorrectable errors */
>+	if (nandi->info.mtd.ecc_stats.failed - stats.failed)
>+		return -EBADMSG;
>+
>+	return max_ecc_errs;
>+}
>+
>+/* Helper function for mtd_write, to handle multi-page and non-aligned wr=
ites */
>+static int bch_write(struct nandi_controller *nandi,
>+		     loff_t to, size_t len,
>+		     size_t *retlen, const uint8_t *buf)
>+{
>+	uint32_t page_size =3D nandi->info.mtd.writesize;
>+	int page_num;
>+	bool bounce =3D false;
>+	const uint8_t *p =3D NULL;
>+	uint8_t ret;
>+
>+	dev_dbg(nandi->dev, "%s: %llu @ 0x%012llx\n", __func__,
>+		(unsigned long long)len, to);
>+
>+	BUG_ON(len & (page_size - 1));
>+	BUG_ON(to & (page_size - 1));
>+
>+	if (((unsigned long)buf & (NANDI_BCH_DMA_ALIGNMENT - 1)) ||
>+	    !virt_addr_valid(buf)) { /* vmalloc'd buffer! */
>+		bounce =3D true;
>+	}
>+
>+	page_num =3D (int)(to >> nandi->page_shift);
>+
>+	while (len > 0) {
>+		if (bounce) {
>+			memcpy(nandi->page_buf, buf, page_size);
>+			p =3D nandi->page_buf;
>+			nandi->cached_page =3D -1;
>+		} else {
>+			p =3D buf;
>+		}
>+
>+		if (nandi->cached_page =3D=3D page_num)
>+			nandi->cached_page =3D -1;
>+
>+		ret =3D bch_write_page(nandi, to, p);
>+		if (ret & NAND_STATUS_FAIL)
>+			return -EIO;
>+
>+		to +=3D page_size;
>+		page_num++;
>+		buf +=3D page_size;
>+		len -=3D page_size;
>+
>+		if (retlen)
>+			*retlen +=3D page_size;
>+	}
>+
>+	return 0;
>+}
>+
> /*
>  * Hamming-FLEX operations
>  */
>--
>1.8.3.2


with regards, pekon
