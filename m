Subject: Re: [PATCH][MIPS][2/7] AR7: mtd
From: David Woodhouse <dwmw2@infradead.org>
To: Matteo Croce <technoboy85@gmail.com>
In-Reply-To: <200709061723.21091.technoboy85@gmail.com>
References: <200708201704.11529.technoboy85@gmail.com>
	<200709061723.21091.technoboy85@gmail.com>
Content-Type: text/plain
Date: Thu, 06 Sep 2007 16:41:22 +0100
Message-Id: <1189093282.2745.147.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mips@linux-mips.org, Felix Fietkau <nbd@openwrt.org>,
	linux-mtd@lists.infradead.org, Eugene Konev <ejka@imfi.kspu.ru>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2007-09-06 at 17:23 +0200, Matteo Croce wrote:
> +	unsigned int pre_size = master->erasesize, post_size = 0,
> +		root_offset = 0xe0000;

Separate lines for those, please.

> +	int retries = 10;
> +
> +	printk("Parsing AR7 partition map...\n");

Needs priority. (As do one or two other printks).

> +	do {
> +		offset = pre_size;
> +		master->read(master, offset, sizeof(header), &len, (u_char
> *)&header);
> +		if (!strncmp((char *)&header, "TIENV0.8", 8))
> +			ar7_parts[1].offset = pre_size;
> +		if (header.checksum == 0xfeedfa42)
> +			break;
> +		if (header.checksum == 0xfeed1281)
> +			break;
> +		pre_size += master->erasesize;
> +	} while (retries--);

Needs some comments. What are the magic numbers? What is this retry
thing all about?

Endianness?

> +MODULE_LICENSE("GPL");
> +MODULE_AUTHOR("Felix Fietkau, Eugene Konev");

Normally I prefer to see email addresses in MODULE_AUTHOR(). You missed
them from the comments at the top of the file too.

-- 
dwmw2
