Received: from mailapp01.imgtec.com ([195.59.15.196])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y0fj4-00034h-Sx
 for linux-mtd@lists.infradead.org; Tue, 16 Dec 2014 00:10:55 +0000
Message-ID: <548F7805.3020708@imgtec.com>
Date: Mon, 15 Dec 2014 21:08:37 -0300
From: Ezequiel Garcia <ezequiel.garcia@imgtec.com>
MIME-Version: 1.0
To: Daniel Ehrenberg <dehrenberg@google.com>
Subject: Re: [PATCH 4/6] mtd: Introduce SPI NAND framework
References: <1417525136-25731-1-git-send-email-ezequiel.garcia@imgtec.com>	<1417525136-25731-5-git-send-email-ezequiel.garcia@imgtec.com>
 <CAAK6Zt0q=uFMzYtdu-G1mk8Ao4KTaBuYU74hy3x8bBy39BD1TA@mail.gmail.com>
In-Reply-To: <CAAK6Zt0q=uFMzYtdu-G1mk8Ao4KTaBuYU74hy3x8bBy39BD1TA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
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



On 12/15/2014 06:18 PM, Daniel Ehrenberg wrote:
> On Tue, Dec 2, 2014 at 4:58 AM, Ezequiel Garcia
> <ezequiel.garcia@imgtec.com> wrote:
>> +static int spi_nand_read_page(struct spi_nand *snand, unsigned int page_addr,
>> +                             unsigned int page_offset, size_t length)
>> +{
>> +       unsigned int corrected = 0, ecc_error = 0;
>> +       int ret;
>> +
>> +       /* Load a page into the cache register */
>> +       ret = snand->load_page(snand, page_addr);
>> +       if (ret < 0) {
>> +               dev_err(snand->dev, "error %d loading page 0x%x to cache\n",
>> +                       ret, page_addr);
>> +               return ret;
>> +       }
>> +
>> +       ret = spi_nand_wait_till_ready(snand);
>> +       if (ret < 0)
>> +               return ret;
>> +
>> +       if (snand->ecc) {
>> +               snand->get_ecc_status(ret, &corrected, &ecc_error);
>> +               snand->bitflips = corrected;
>> +
>> +               /*
>> +                * If there's an ECC error, print a message and notify MTD
>> +                * about it. Then complete the read, to load actual data on
>> +                * the buffer (instead of the status result).
>> +                */
>> +               if (ecc_error) {
>> +                       dev_err(snand->dev,
>> +                               "internal ECC error reading page 0x%x\n",
>> +                               page_addr);
>> +                       snand->mtd.ecc_stats.failed++;
>> +               }
>> +       }
>> +
>> +       /* Get page from the device cache into our internal buffer */
>> +       ret = snand->read_cache(snand, page_offset, length, snand->data_buf);
>> +       if (ret < 0) {
>> +               dev_err(snand->dev, "error %d reading page 0x%x from cache\n",
>> +                       ret, page_addr);
>> +               return ret;
>> +       }
>> +       return 0;
>> +}
> 
> Should you increment snand->mtd.corrected by corrected in this function?
> 

Yes, it looks like I missed that.

Thanks for the feedback,
-- 
Ezequiel
