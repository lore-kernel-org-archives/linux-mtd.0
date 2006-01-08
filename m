From: David Woodhouse <dwmw2@infradead.org>
To: Adrian Bunk <bunk@stusta.de>
In-Reply-To: <20060108125700.GI3774@stusta.de>
References: <20060107220702.GZ3774@stusta.de>
	<1136678409.30348.26.camel@pmac.infradead.org>
	<20060108002457.GE3774@stusta.de>
	<1136680734.30348.34.camel@pmac.infradead.org>
	<20060107174523.460f1849.akpm@osdl.org>
	<1136724072.30348.66.camel@pmac.infradead.org>
	<20060108125700.GI3774@stusta.de>
Content-Type: text/plain
Date: Sun, 08 Jan 2006 13:06:20 +0000
Message-Id: <1136725580.30348.69.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Andrew Morton <akpm@osdl.org>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [2.6 patch] no longer mark MTD_OBSOLETE_CHIPS as BROKEN and
	remove broken MTD_OBSOLETE_CHIPS drivers
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2006-01-08 at 13:57 +0100, Adrian Bunk wrote:
> What I want for 2.6.16 is to remove the wrong dependency of MTD_SHARP on 
> BROKEN and the non-compiling drivers either still hidden under BROKEN or 
> removed.
> 
> If there is any way I can submit a patch achieving this that would be 
> acceptable for you simply tell how exactly you want this patch.

Remove the incorrect BROKEN dependency from MTD_OBSOLETE_CHIPS.

If you then want to add it again to any chip driver which really doesn't
compile, feel free. But leave the map drivers alone. Those can be
switched to use different chip back-ends. 

-- 
dwmw2
