Received: from mailserv.intranet.gr ([146.124.14.106])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1BLMFs-0003rj-Bu
	for linux-mtd@lists.infradead.org; Wed, 05 May 2004 14:16:09 +0100
Received: from mailserv.intranet.gr (localhost [127.0.0.1])
	by mailserv.intranet.gr (8.11.7/8.11.3) with ESMTP id i45DLAc07959
	for <linux-mtd@lists.infradead.org>;
	Wed, 5 May 2004 16:21:10 +0300 (EEST)
Message-ID: <4098E62A.2050702@intracom.gr>
Date: Wed, 05 May 2004 16:03:38 +0300
From: Pantelis Antoniou <panto@intracom.gr>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <4098DF0D.1040703@intracom.gr>
	<1083761869.26125.1382.camel@imladris.demon.co.uk>
In-Reply-To: <1083761869.26125.1382.camel@imladris.demon.co.uk>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
cc: Thomas Gleixner <tglx@linutronix.de>
cc: linux-mtd@lists.infradead.org
cc: David Daney <ddaney@avtrex.com>
Subject: Re: [patch] Allow any filesystem on MTD Nand when Read Only
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

David Woodhouse wrote:

>On Wed, 2004-05-05 at 15:33 +0300, Pantelis Antoniou wrote:
>
>>Hello there.
>>
>>The following patch allows you to have any filesystem over NAND when mounted
>>read only.
>>
>
>Please don't do it like this. Do it as a block device 'translation
>layer' instead. See nftl/ftl/mtdblock for examples.
>
>Can you join irc.freenode.net #mtd ?
>
>
Sorry I'm at work now and IRC is blocked.

I'll try to get into it when I get home in about 2 hours.

I'll take a look at nftl/ftl/mtdblock.

The patch is very small and it works perfectly however.
What are your main objections?

Regards

Pantelis
