Received: from phoenix.mvhi.com ([195.224.96.167] helo=phoenix.infradead.org)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 184IAu-0000I9-00
	for <linux-mtd@lists.infradead.org>; Wed, 23 Oct 2002 10:51:40 +0100
Received: from buserror-extern.convergence.de ([212.84.236.66] helo=jupiter)
	by phoenix.infradead.org with esmtp (Exim 4.10)
	id 184IEq-0000CS-00
	for linux-mtd@lists.infradead.org; Wed, 23 Oct 2002 10:55:44 +0100
Date: Wed, 23 Oct 2002 11:49:28 +0200
From: Frank Neuber <neuber@convergence.de>
To: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
Subject: Re: parse_cmdline_partitions equivalent for map_info
Message-ID: <20021023094928.GA27905@jupiter>
References: <20021018104910.GA11807@jupiter> <26791.1034943288@passion.cambridge.redhat.com> <20021019164445.GA9364@wohnheim.fh-wedel.de> <20021022103936.GA24369@jupiter> <20021022170803.GA9161@wohnheim.fh-wedel.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20021022170803.GA9161@wohnheim.fh-wedel.de>
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

On Tue, Oct 22, 2002 at 07:08:03PM +0200, Jörn Engel wrote:
Hi Jörn,
thanks for your patch ....
> 
> Ok, enough rambling. Try this patch:
> http://wh.fh-wedel.de/~joern/software/kernel/mtd.patch.mphysmap.2.4.19-untested
But this is not what I need :-(
I would like to pass the physical specification through the kernel
command line.

I think the best place to do this is to add such function to cmdline.c

David, since yesterday I got no mail from the mtd-mailinglist. Maybe it
is my mistake?

Regards,
 Frank

-- 
Dipl.-Ing. Elektrotechnik           convergence / HW
Frank Neuber                        Rosenthalerstr.51 / 10178 Berlin
Email:  neuber@convergence.de           Phone:  +49(0)30-72 62 06 76
WWW:    www.convergence.de              Fax:    +49(0)30-72 62 06 55
