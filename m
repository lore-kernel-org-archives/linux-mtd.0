Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFi2f-0003ND-VD
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2013 09:32:14 +0000
Message-ID: <1363167184.9457.22.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mtd/nand: don't use {read,write}_buf for 8-bit
 transfers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Wed, 13 Mar 2013 11:33:04 +0200
In-Reply-To: <1362415655-13073-1-git-send-email-u.kleine-koenig@pengutronix.de>
References: <1362414924-27506-1-git-send-email-u.kleine-koenig@pengutronix.de>
 <1362415655-13073-1-git-send-email-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, kernel@pengutronix.de
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-03-04 at 17:47 +0100, Uwe Kleine-König wrote:
> diff --git a/include/linux/mtd/nand.h b/include/linux/mtd/nand.h
> index 7ccb3c5..8ee4ed1 100644
> --- a/include/linux/mtd/nand.h
> +++ b/include/linux/mtd/nand.h
> @@ -419,6 +419,8 @@ struct nand_buffers {
>   *                     flash device.
>   * @read_byte:         [REPLACEABLE] read one byte from the chip
>   * @read_word:         [REPLACEABLE] read one word from the chip
> + * @write_byte         [REPLACEABLE] write a single byte to the chip on the
> + *                     low 8 I/O lines
>   * @write_buf:         [REPLACEABLE] write data from the buffer to the chip
>   * @read_buf:          [REPLACEABLE] read data from the chip into the buffer
>   * @select_chip:       [REPLACEABLE] select chip nr
> @@ -503,6 +505,7 @@ struct nand_chip {
>  
>         uint8_t (*read_byte)(struct mtd_info *mtd);
>         u16 (*read_word)(struct mtd_info *mtd);
> +       void (*write_byte)(struct mtd_info *mtd, uint8_t byte);
>         void (*write_buf)(struct mtd_info *mtd, const uint8_t *buf, int len);
>         void (*read_buf)(struct mtd_info *mtd, uint8_t *buf, int len);
>         void (*select_chip)(struct mtd_info *mtd, int chip);

I would like to make the interface symmetric for read and write. I do
not have any 16 bit flashes, so need to somehow encouredge someone who
has one to do this. Namely, I'd like to kill 'read_word()', if possible.
What's your take on this?

-- 
Best Regards,
Artem Bityutskiy
