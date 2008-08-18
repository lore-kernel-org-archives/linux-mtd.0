Received: from mtagate4.de.ibm.com ([195.212.29.153])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KV6Y9-0001Xp-EJ
	for linux-mtd@lists.infradead.org; Mon, 18 Aug 2008 15:21:41 +0000
Received: from d12nrmr1607.megacenter.de.ibm.com
	(d12nrmr1607.megacenter.de.ibm.com [9.149.167.49])
	by mtagate4.de.ibm.com (8.13.8/8.13.8) with ESMTP id m7IFL9YJ216192
	for <linux-mtd@lists.infradead.org>; Mon, 18 Aug 2008 15:21:09 GMT
Received: from d12av04.megacenter.de.ibm.com (d12av04.megacenter.de.ibm.com
	[9.149.165.229])
	by d12nrmr1607.megacenter.de.ibm.com (8.13.8/8.13.8/NCO v9.0) with
	ESMTP id m7IFL8we3817532
	for <linux-mtd@lists.infradead.org>; Mon, 18 Aug 2008 17:21:09 +0200
Received: from d12av04.megacenter.de.ibm.com (loopback [127.0.0.1])
	by d12av04.megacenter.de.ibm.com (8.12.11.20060308/8.13.3) with ESMTP
	id m7IFL8AA002263
	for <linux-mtd@lists.infradead.org>; Mon, 18 Aug 2008 17:21:08 +0200
Date: Mon, 18 Aug 2008 11:21:05 -0400
From: Christof Schmitt <christof.schmitt@de.ibm.com>
To: Hirofumi Nakagawa <hnakagawa@miraclelinux.com>
Subject: Re: [PATCH] Remove duplicated unlikely() in IS_ERR()
Message-ID: <20080818152105.GA8883@schmichrtp.de.ibm.com>
References: <48A52D69.1040501@miraclelinux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <48A52D69.1040501@miraclelinux.com>
Cc: yoshfuji@linux-ipv6.org, netdev@vger.kernel.org,
	linux-mtd@lists.infradead.org, linux-s390@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Aug 15, 2008 at 04:16:57PM +0900, Hirofumi Nakagawa wrote:
> Hi
> Some drivers have duplicated unlikely() macros.
> IS_ERR() already has unlikely() in itself.
> This patch cleans up such pointless codes although there is no real
> effect on the kernel's behaviour.
> 
> Thanks,
> Hirofumi Nakagawa
> 
> Signed-off-by: Hirofumi Nakagawa <hnakagawa@miraclelinux.com>
> ---
>  drivers/s390/scsi/zfcp_fsf.c |   32 ++++++++++++++++----------------
>  fs/ubifs/find.c              |    4 ++--
>  fs/ubifs/gc.c                |    8 ++++----
>  fs/ubifs/tnc.c               |    4 ++--
>  fs/ubifs/xattr.c             |    2 +-
>  net/ipv6/af_inet6.c          |    2 +-
>  6 files changed, 26 insertions(+), 26 deletions(-)

Thanks for spotting and fixing this. Could you split the zfcp changes
in a seperate patch? I will pick up the zfcp patch for a series of
fixes that i have pending here.

Christof
