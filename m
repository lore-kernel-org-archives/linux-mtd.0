Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OWVLu-0000Oe-Ld
	for linux-mtd@lists.infradead.org; Wed, 07 Jul 2010 14:11:55 +0000
Subject: Re: [PATCH] mtd-utils: formatting of odd-sized OOB in nanddump
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <norris@broadcom.com>
In-Reply-To: <1276706527-4563-1-git-send-email-norris@broadcom.com>
References: <1276706527-4563-1-git-send-email-norris@broadcom.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 07 Jul 2010 17:07:54 +0300
Message-ID: <1278511674.12733.18.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2010-06-16 at 09:42 -0700, Brian Norris wrote:
> +				if (i+15 < meminfo.oobsize) {
> +					/* Print 16 bytes */
> +					sprintf(pretty_buf, "  OOB Data: %02x %02x %02x %02x %02x %02x "
> +							"%02x %02x %02x %02x %02x %02x %02x %02x %02x %02x\n",
> +							oobbuf[i], oobbuf[i+1], oobbuf[i+2],
> +							oobbuf[i+3], oobbuf[i+4], oobbuf[i+5],
> +							oobbuf[i+6], oobbuf[i+7], oobbuf[i+8],
> +							oobbuf[i+9], oobbuf[i+10], oobbuf[i+11],
> +							oobbuf[i+12], oobbuf[i+13], oobbuf[i+14],
> +							oobbuf[i+15]);
> +					write(ofd, pretty_buf, 60);
> +				} else {
> +					/* Print 10 bytes */
> +					sprintf(pretty_buf, "  OOB Data: %02x %02x %02x %02x %02x %02x "
> +							"%02x %02x %02x %02x\n",
> +							oobbuf[i], oobbuf[i+1], oobbuf[i+2],
> +							oobbuf[i+3], oobbuf[i+4], oobbuf[i+5],
> +							oobbuf[i+6], oobbuf[i+7], oobbuf[i+8],
> +							oobbuf[i+9]);
> +					write(ofd, pretty_buf, 42);
> +				}

Why 10 bytes, why not 12 or 14?

I think it is better to just copy-paste-modify the kernel
print_hex_dump() and utilize it, instead of this ugly crocodile code ...

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
