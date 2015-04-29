Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YnZp7-0008OC-Gs
 for linux-mtd@lists.infradead.org; Wed, 29 Apr 2015 21:47:18 +0000
Received: by pdbqd1 with SMTP id qd1so39993674pdb.2
 for <linux-mtd@lists.infradead.org>; Wed, 29 Apr 2015 14:46:55 -0700 (PDT)
Date: Wed, 29 Apr 2015 14:46:48 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Ben Shelton <ben.shelton@ni.com>
Subject: Re: [PATCH] mtd: Introduce CONFIG_MTD_RESERVE_END
Message-ID: <20150429214648.GF32500@ld-irv-0074>
References: <1430335682-6174-1-git-send-email-ben.shelton@ni.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1430335682-6174-1-git-send-email-ben.shelton@ni.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, Jeff Westfahl <jeff.westfahl@ni.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> +	  This can be useful if, for example, the BBT is stored at the end
> +	  of the flash, and you don't want those blocks counted as part of
> +	  the last MTD partition.

And why is that a problem? We don't add Kconfig options just because you
"don't want" something.

Brian
