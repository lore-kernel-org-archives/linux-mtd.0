Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U8SnB-0003tq-Jc
 for linux-mtd@lists.infradead.org; Thu, 21 Feb 2013 09:50:18 +0000
Message-ID: <5125EDD7.40202@parrot.com>
Date: Thu, 21 Feb 2013 10:50:15 +0100
From: Matthieu CASTET <matthieu.castet@parrot.com>
MIME-Version: 1.0
To: "katsuki.uwatoko@toshiba.co.jp" <katsuki.uwatoko@toshiba.co.jp>
Subject: Re: [PATCH v2] mtd: nand: support BENAND (Built-in ECC NAND)
References: <F3B6523425E7914AA6214ED358D820AF2674E3EA@TGXML341.toshiba.local>
In-Reply-To: <F3B6523425E7914AA6214ED358D820AF2674E3EA@TGXML341.toshiba.local>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit
Cc: "vikram186@gmail.com" <vikram186@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

katsuki.uwatoko@toshiba.co.jp a écrit :
> This enables support for BENAND, which is an SLC NAND flash solution
> with embedded error correction code (ECC), currently supports only
> 128bytes OOB type.
> 
> In the read sequence, "status read command" is executed to check the
> ECC status after read data. If bitflips occur, these are
> automatically corrected by BENAND and the status indicates the result.
> 
> The write sequence is the same as raw write and the ECC data are
> automatically written to OOB by BENAND.
> 
> Signed-off-by: UWATOKO Katsuki <katsuki.uwatoko@toshiba.co.jp>

> +       case NAND_ECC_BENAND:
> +               if (!IS_ENABLED(CONFIG_MTD_NAND_BENAND)) {
> +                       pr_warn("CONFIG_MTD_BENAND not enabled\n");
> +                       BUG();
> +               }
> +
> +               chip->ecc.read_page = nand_read_page_benand;
> +               chip->ecc.write_page = nand_write_page_raw;
> +               chip->ecc.read_page_raw = nand_read_page_raw;
> +               chip->ecc.write_page_raw = nand_write_page_raw;
> +               chip->ecc.read_oob = nand_read_oob_std;
> +               chip->ecc.write_oob = nand_write_oob_std;
> +
Do you have a way to disable internal ecc ?

If not read_page_raw and write_page_raw won't do what is expected :
- read without ecc correction
- write without writing ecc or write custom ecc

I don't know if it could cause some problem.


Matthieu
