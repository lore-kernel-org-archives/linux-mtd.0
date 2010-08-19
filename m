Received: from mms2.broadcom.com ([216.31.210.18])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OmDb9-0005bK-9C
	for linux-mtd@lists.infradead.org; Thu, 19 Aug 2010 22:28:35 +0000
Message-ID: <4C6DAFFD.4040602@broadcom.com>
Date: Thu, 19 Aug 2010 15:28:13 -0700
From: "Brian Norris" <norris@broadcom.com>
MIME-Version: 1.0
To: "Kevin Cernekee" <cernekee@gmail.com>
Subject: Re: Bad assumption about ID field definition for Samsung NAND?
References: <20100818180538.GA12238@code-monkey.de>
	<4C6C6BFC.9020408@broadcom.com> <20100819171558.GA8536@code-monkey.de>
	<AANLkTikiTX6US09pVu+uYm_U5=70WVbF+eH9wBtDeWKM@mail.gmail.com>
In-Reply-To: <AANLkTikiTX6US09pVu+uYm_U5=70WVbF+eH9wBtDeWKM@mail.gmail.com>
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Tilman Sauerbeck <tilman@code-monkey.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/19/2010 12:46 PM, Kevin Cernekee wrote:
> The code is right; the comment is wrong.

In that case, should we fix the comment and add the
check that Tilman mentioned previously? (below)
This looks safe and will at least eliminate a few weird
cases where Samsung SLC happen to have 6-byte ID strings
(such as the K9F4G08U0B in question).

I have another fix I will tack on in series to this; should
I include you as a "Signed-off-by", Tilman?

Brian

> @@ -2852,6 +2852,7 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>                  */
>                 if (id_data[0] == id_data[6] && id_data[1] == id_data[7] &&
>                                 id_data[0] == NAND_MFR_SAMSUNG &&
> +                               (chip->cellinfo & NAND_CI_CELLTYPE_MSK) &&
>                                 id_data[5] != 0x00) {
>                         /* Calc pagesize */
>                         mtd->writesize = 2048 << (extid & 0x03);
