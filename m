Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.89 #1 (Red Hat Linux))
 id 1eoz94-0003oP-1h
 for linux-mtd@lists.infradead.org; Thu, 22 Feb 2018 22:15:19 +0000
Date: Thu, 22 Feb 2018 23:14:56 +0100
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Stefan Agner <stefan@agner.ch>
Cc: miquel.raynal@free-electrons.com, boris.brezillon@free-electrons.com,
 computersforpeace@gmail.com, dwmw2@infradead.org, marek.vasut@gmail.com,
 cyrille.pitchen@wedev4u.fr, richard@nod.at, bpringle@sympatico.ca,
 marcel.ziswiler@toradex.com, linux-mtd@lists.infradead.org
Subject: Re: [RFC PATCH v4 2/2] mtd: nand: vf610_nfc: remove old hooks
Message-ID: <20180222231456.102ec0da@bbrezillon>
In-Reply-To: <20180222202918.8708-3-stefan@agner.ch>
References: <20180222202918.8708-1-stefan@agner.ch>
 <20180222202918.8708-3-stefan@agner.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 22 Feb 2018 21:29:18 +0100
Stefan Agner <stefan@agner.ch> wrote:

> @@ -1087,12 +838,6 @@ static int vf610_nfc_probe(struct platform_device *pdev)
>  		goto err_disable_clk;
>  	}
>  
> -	chip->dev_ready = vf610_nfc_dev_ready;
> -	chip->cmdfunc = vf610_nfc_command;
> -	chip->read_byte = vf610_nfc_read_byte;
> -	chip->read_word = vf610_nfc_read_word;
> -	chip->read_buf = vf610_nfc_read_buf;
> -	chip->write_buf = vf610_nfc_write_buf;
>  	chip->exec_op = vf610_nfc_exec_op;
>  	chip->select_chip = vf610_nfc_select_chip;
>  	chip->onfi_set_features = nand_onfi_get_set_features_notsupp;

Your NAND controller should now support the SET/GET_FEATURES commands,
so you can remove the ->onfi_set/get_features assignment too (in a
separate patch, of course).

-- 
Boris Brezillon, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
