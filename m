Received: from lazybastard.de ([212.112.238.170] helo=longford.logfs.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1Jy3OS-0003hf-VH
	for linux-mtd@lists.infradead.org; Mon, 19 May 2008 11:19:05 +0000
Date: Mon, 19 May 2008 13:18:51 +0200
From: =?utf-8?B?SsO2cm4=?= Engel <joern@logfs.org>
To: Bryan Wu <cooloney@kernel.org>
Subject: Re: [PATCH 1/1] mtd maps - Blackfin Async Flash Maps (try #4): Handle
	the case where flash memory and ethernet mac/phy are mapped
	onto the same async bank
Message-ID: <20080519111851.GA32679@logfs.org>
References: <1211193144-7731-1-git-send-email-cooloney@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1211193144-7731-1-git-send-email-cooloney@kernel.org>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, Mike Frysinger <vapier.adi@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 19 May 2008 18:32:24 +0800, Bryan Wu wrote:
> 
> [try #4]
>  - drop superfluous casts
>  - drop SSYNC() when reading from the flash and rewrite
>    bfin_copy_from() to be like bfin_copy_to() so that
>    we dont have to handle all the aligned/unaligned cases
> 
> [try #3] rename bf5xx-flash to bfin-async-flash
>  - move all kconfig board settings into board resources
>  - fixup casting style according to lkml feedback
>  - rewrite driver so that it can handle arbitrary of
>    instances according to the declared platform resources
> 
> [try #2]
> Remove useless SSYNC() as Will said
> 
> [try #1]
> The BF533-STAMP does this for example.
> All board-specific configuration goes in your board resources file.
> 
> Signed-off-by: Mike Frysinger <vapier.adi@gmail.com>
> Cc: Joern Engel <joern@logfs.org>
> Signed-off-by: Bryan Wu <cooloney@kernel.org>

Looks good to me.  If dwmw2 doesn't mind adding another mapping driver,
this can go in.  Not that I had any idea how physmap could sanely cover
this driver too.

Acked-By: Joern Engel <joern@logfs.org>

Jörn

-- 
Ninety percent of everything is crap.
-- Sturgeon's Law
