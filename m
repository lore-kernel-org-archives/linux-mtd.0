Received: from mail-ig0-x232.google.com ([2607:f8b0:4001:c05::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0d27-0006f5-8f
 for linux-mtd@lists.infradead.org; Mon, 15 Dec 2014 21:18:23 +0000
Received: by mail-ig0-f178.google.com with SMTP id hl2so5881111igb.5
 for <linux-mtd@lists.infradead.org>; Mon, 15 Dec 2014 13:18:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1417525136-25731-5-git-send-email-ezequiel.garcia@imgtec.com>
References: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>
 <1417525136-25731-5-git-send-email-ezequiel.garcia@imgtec.com>
Date: Mon, 15 Dec 2014 13:18:01 -0800
Message-ID: <CAAK6Zt0q=uFMzYtdu-G1mk8Ao4KTaBuYU74hy3x8bBy39BD1TA@mail.gmail.com>
Subject: Re: [PATCH 4/6] mtd: Introduce SPI NAND framework
From: Daniel Ehrenberg <dehrenberg@google.com>
To: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
Content-Type: text/plain; charset=UTF-8
Cc: bpqw@micron.com, Ionela Voinescu <ionela.voinescu@imgtec.com>,
 frankliu@micron.com, Andrew Bresticker <abrestic@chromium.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 arnaud.mouiche@invoxia.com, Brian Norris <computersforpeace@gmail.com>,
 James Hartley <james.hartley@imgtec.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 2, 2014 at 4:58 AM, Ezequiel Garcia
<ezequiel.garcia@imgtec.com> wrote:
> +static int spi_nand_read_page(struct spi_nand *snand, unsigned int page_addr,
> +                             unsigned int page_offset, size_t length)
> +{
> +       unsigned int corrected = 0, ecc_error = 0;
> +       int ret;
> +
> +       /* Load a page into the cache register */
> +       ret = snand->load_page(snand, page_addr);
> +       if (ret < 0) {
> +               dev_err(snand->dev, "error %d loading page 0x%x to cache\n",
> +                       ret, page_addr);
> +               return ret;
> +       }
> +
> +       ret = spi_nand_wait_till_ready(snand);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (snand->ecc) {
> +               snand->get_ecc_status(ret, &corrected, &ecc_error);
> +               snand->bitflips = corrected;
> +
> +               /*
> +                * If there's an ECC error, print a message and notify MTD
> +                * about it. Then complete the read, to load actual data on
> +                * the buffer (instead of the status result).
> +                */
> +               if (ecc_error) {
> +                       dev_err(snand->dev,
> +                               "internal ECC error reading page 0x%x\n",
> +                               page_addr);
> +                       snand->mtd.ecc_stats.failed++;
> +               }
> +       }
> +
> +       /* Get page from the device cache into our internal buffer */
> +       ret = snand->read_cache(snand, page_offset, length, snand->data_buf);
> +       if (ret < 0) {
> +               dev_err(snand->dev, "error %d reading page 0x%x from cache\n",
> +                       ret, page_addr);
> +               return ret;
> +       }
> +       return 0;
> +}

Should you increment snand->mtd.corrected by corrected in this function?

Dan
