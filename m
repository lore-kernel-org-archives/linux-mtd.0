Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 161nrl-0003BG-00
	for <linux-mtd@lists.infradead.org>; Thu, 08 Nov 2001 12:01:05 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <01110811501001.09516@uk-proclin2> 
References: <01110811501001.09516@uk-proclin2> 
To: Clive Davies <cdavies@altera.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Intel protection register read 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Thu, 08 Nov 2001 12:10:10 +0000
Message-ID: <6720.1005221410@redhat.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>


cdavies@altera.com said:
> I sent the patch below to this list a few days ago but had no
> response. Has  anyone had a chance to look at it? If its ok, could
> someone apply it?

Sorry. Thanks for retrying :)

> +	unsigned char *ProtRegData;  /* Protection register data bytes */
> 	struct flchip chips[0];  /* per-chip data structure for each chip */

The ProtRegData are per-chip, but you've only left space for one pointer. 
What happens when people have arrays of multiple chips side-by-side and/or
consecutively mapped?

Also, isn't it possible to _write_ to the user areas of the chips?

Is this present in all versions of the Intel command sets, or do you need 
to check the version number?


--
dwmw2
