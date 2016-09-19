Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bm3rv-0000bP-CF
 for linux-mtd@lists.infradead.org; Mon, 19 Sep 2016 19:04:44 +0000
Subject: Re: [PATCH] UBI: add debugfs file for tracking PEB state
To: Zach Brown <zach.brown@ni.com>, dwmw2@infradead.org
References: <1474310864-1743-1-git-send-email-zach.brown@ni.com>
Cc: computersforpeace@gmail.com, dedekind1@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <4bf1146a-2c57-5003-6b57-5fc1052cb6ac@nod.at>
Date: Mon, 19 Sep 2016 21:03:30 +0200
MIME-Version: 1.0
In-Reply-To: <1474310864-1743-1-git-send-email-zach.brown@ni.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Zach,

On 19.09.2016 20:47, Zach Brown wrote:
> +	} else {
> +		struct ubi_ec_hdr erase_count_header;
> +
> +		err = ubi_io_read_ec_hdr(ubi, *block_number,
> +					 &erase_count_header, 0);
> +		if (err && err != UBI_IO_BITFLIPS)
> +			r_sts = READ_STATUS_ERR_READING_ERASE_COUNT;
> +		else {
> +			erase_count = be64_to_cpu(erase_count_header.ec);
> +			if (erase_count > UBI_MAX_ERASECOUNTER)
> +				b_sts = BLOCK_STATUS_ERASE_COUNT_BEYOND_MAX;

Hmm, why don't you use ubi->lookuptbl[] to get a ubi_wl_entry object, it knows
the erase counter. That way you don't have to read from the flash. If you read
you have to deal with all kind of read errors, including bitflips.

Thanks,
//richard
