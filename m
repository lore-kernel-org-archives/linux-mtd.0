Received: from [202.177.17.107] (helo=donut.udomain.com.hk)
	by pentafluge.infradead.org with smtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A7BNd-0003eK-LQ
	for <linux-mtd@lists.infradead.org>; Wed, 08 Oct 2003 11:17:18 +0100
Message-ID: <3F83E3E6.3070308@hectrix.com>
Date: Wed, 08 Oct 2003 18:16:06 +0800
From: Selwyn Tang <selwyn@hectrix.com>
MIME-Version: 1.0
To: David Woodhouse <dwmw2@infradead.org>
References: <Law15-F74mSknvh7wFI000062b3@hotmail.com>
	<3F7CD9CA.5090805@hectrix.com>
	<1065160480.16088.0.camel@imladris.demon.co.uk>
	<3F7D31B7.7020400@hectrix.com>
	<1065171167.22491.53.camel@hades.cambridge.redhat.com>
	<3F83DCED.8090206@hectrix.com>
	<1065607132.22298.88.camel@hades.cambridge.redhat.com>
In-Reply-To: <1065607132.22298.88.camel@hades.cambridge.redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: high cpu usage using nftl for DOC2000
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/08/2003 05:58 PM, David Woodhouse wrote:
> Can you throw printk statements into various routines in nftlcore.c so
> we can it actually thinks it's doing?

I will try my best to do that later.

> You _are_ mounting your file system with -onoatime, aren't you?

I compiled in the driver to the kernel and set fstab with the line:

  /dev/nftla1	/mnt/doc	auto	defaults	0 0

What do you mean by -onoatime? Should I change "defaults" to "noatime"?

Selwyn
