Received: from 213-239-205-147.clients.your-server.de ([213.239.205.147]
	helo=mail.tglx.de)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FB8ll-0005lH-IY
	for linux-mtd@lists.infradead.org; Mon, 20 Feb 2006 06:00:12 -0500
From: Thomas Gleixner <tglx@linutronix.de>
To: "Alexey, Korolev" <alexey.korolev@intel.com>
In-Reply-To: <43F99FBA.8060704@intel.com>
References: <43EC3824.2040805@ru.mvista.com>  <43F99FBA.8060704@intel.com>
Content-Type: text/plain
Date: Mon, 20 Feb 2006 12:00:44 +0100
Message-Id: <1140433245.2480.699.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] Fixup in NAND bad block management + fix of misspring
	.(nand_base.c)
Reply-To: tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2006-02-20 at 13:53 +0300, Alexey, Korolev wrote:
> +	/* If pattern is given use offset from badblock_pattern structure
> +	   else use badblockpos which take default values */
> +	if (this->badblock_pattern)
> +		badblockpos=this->badblock_pattern->offs;
> +	else
> +		badblockpos=this->badblockpos;

I still do not get why you need all this magic instead of fixing up
this->badblockpos in the first place.

	tglx
