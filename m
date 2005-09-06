Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1ECf3c-0005vN-UU
	for linux-mtd@lists.infradead.org; Tue, 06 Sep 2005 11:08:22 -0400
Date: Tue, 6 Sep 2005 17:08:19 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: rpurdie@infradead.org
Message-ID: <20050906150819.GA14661@wohnheim.fh-wedel.de>
References: <E1ECeiI-0000H1-91@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E1ECeiI-0000H1-91@phoenix.infradead.org>
Cc: linux-mtd@lists.infradead.org
Subject: Re: mtd/drivers/mtd/nand sharpsl.c,1.4,1.5
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 6 September 2005 15:46:18 +0100, rpurdie@infradead.org wrote:
> 
> -	if (machine_is_husky()) {
> +	if (machine_is_husky() || machine_is_borzoi()) {
>  		/* Need to use small eraseblock size for backward compatibility */
>  		sharpsl_mtd->flags |= MTD_NO_VIRTBLOCKS;
>  	}

With Ferenc's patch in, MTD_NO_VIRTBLOCKS has lost its effect.  I
guess we will remove that flag sometime in the near future.

Jörn

-- 
Why do musicians compose symphonies and poets write poems?
They do it because life wouldn't have any meaning for them if they didn't.
That's why I draw cartoons.  It's my life.
-- Charles Shultz
