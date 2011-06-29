Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1Qbo9F-0004Zi-Ff
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2011 06:21:18 +0000
Received: by pvg20 with SMTP id 20so668093pvg.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 28 Jun 2011 23:21:14 -0700 (PDT)
Subject: Re: [PATCH 2/2] mtd/nand : workaround for Freescale FCM to support
	large-page Nand chip
From: Artem Bityutskiy <dedekind1@gmail.com>
To: b35362@freescale.com
Date: Wed, 29 Jun 2011 09:22:04 +0300
In-Reply-To: <1309225852-1664-2-git-send-email-b35362@freescale.com>
References: <1309225852-1664-1-git-send-email-b35362@freescale.com>
	<1309225852-1664-2-git-send-email-b35362@freescale.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1309328529.23597.106.camel@sauron>
Mime-Version: 1.0
Cc: linuxppc-dev@ozlabs.org, Li Yang <leoli@freescale.com>, dwmw2@infradead.org,
	linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-06-28 at 09:50 +0800, b35362@freescale.com wrote:
> +	/* Hack for supporting the flash chip whose writesize is
> +	 * larger than 2K bytes.
> +	 */

Please, use proper kernel multi-line comments. Please, make sure
checkpatch.pl does not generate 13 errors with this patch.

-- 
Best Regards,
Artem Bityutskiy
