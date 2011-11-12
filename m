Received: from smtp.newsguy.com ([74.209.136.69])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RPIVl-00048v-H7
 for linux-mtd@lists.infradead.org; Sat, 12 Nov 2011 18:41:06 +0000
Message-ID: <4EBECB89.2020102@newsguy.com>
Date: Sat, 12 Nov 2011 11:39:53 -0800
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Robert Jarzmik <robert.jarzmik@free.fr>
Subject: Re: [PATCH v2 07/16] mtd/docg3: add OOB layout to mtdinfo
References: <1320912342-30147-1-git-send-email-robert.jarzmik@free.fr>
 <1320912342-30147-8-git-send-email-robert.jarzmik@free.fr>
In-Reply-To: <1320912342-30147-8-git-send-email-robert.jarzmik@free.fr>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/10/2011 12:05 AM, Robert Jarzmik wrote:
> +static struct nand_ecclayout docg3_oobinfo = {
> +	.eccbytes = 8,
> +	.eccpos = {7, 8, 9, 10, 11, 12, 13, 14},
> +	.oobfree = {{0, 7}, {15, 1} },
> +	.oobavail = 8,
> +};
> +

Just FYI, per Ivan's suggestion, I changed this to use the last oob byte as a
"page programmed" flag for the purpose of detecting bit flips when reading a
blank page.  Maybe something to keep in mind.  You can have a look at the latest
G4 driver patch to see exactly how I use it.

Mike
