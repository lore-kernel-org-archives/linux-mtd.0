Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1K8BMV-00089A-KC
	for linux-mtd@lists.infradead.org; Mon, 16 Jun 2008 09:50:56 +0000
Date: Mon, 16 Jun 2008 11:50:47 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Robert Jarzmik <rjarzmik@free.fr>
Subject: Re: physmap without MTD partitions
Message-ID: <20080616095047.GA18998@logfs.org>
References: <87y75hz3u2.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y75hz3u2.fsf@free.fr>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 7 June 2008 17:01:41 +0200, Robert Jarzmik wrote:
> @@ -213,8 +214,10 @@ static int physmap_flash_resume(struct platform_device *dev)
>  	struct physmap_flash_info *info = platform_get_drvdata(dev);
>  	int i;
>  
> +	return 0;

Is this bit leftover from debugging?

>  	for (i = 0; i < MAX_RESOURCES && info->mtd[i]; i++)
> -		info->mtd[i]->resume(info->mtd[i]);
> +		if (info->mtd[i]->resume)
> +			info->mtd[i]->resume(info->mtd[i]);
>  
>  	return 0;
>  }

Jörn

-- 
It's just what we asked for, but not what we want!
-- anonymous
