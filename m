Received: from [2002:c1ed:8229::1] (helo=imladris.demon.co.uk)
	by pentafluge.infradead.org with esmtp (Exim 4.22 #5 (Red Hat Linux))
	id 1A7UKz-0006ZN-Dq
	for <linux-mtd@lists.infradead.org>; Thu, 09 Oct 2003 07:31:49 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: Selwyn Tang <selwyn@hectrix.com>
In-Reply-To: <3F84DBE4.6030602@hectrix.com>
References: <Law15-F74mSknvh7wFI000062b3@hotmail.com>
	 <3F7CD9CA.5090805@hectrix.com>
	 <1065160480.16088.0.camel@imladris.demon.co.uk>
	 <3F7D31B7.7020400@hectrix.com>
	 <1065171167.22491.53.camel@hades.cambridge.redhat.com>
	 <3F83DCED.8090206@hectrix.com>
	 <1065607132.22298.88.camel@hades.cambridge.redhat.com>
	 <3F83E3E6.3070308@hectrix.com>
	 <1065608571.22298.92.camel@hades.cambridge.redhat.com>
	 <3F84DBE4.6030602@hectrix.com>
Message-Id: <1065681043.30987.191.camel@imladris.demon.co.uk>
Mime-Version: 1.0
Date: Thu, 09 Oct 2003 07:30:43 +0100
Content-Type: text/plain
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

On Thu, 2003-10-09 at 11:54 +0800, Selwyn Tang wrote:
> Besides, I added a printk to each function in nftlcore.c, printing the
> name of the function when it is called, eg. "mtdcore: init_mtd". Then in
> boot up, I got the followings:

strcmp("nftlcore", "mtdcore");

-- 
dwmw2
