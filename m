Subject: Re: [PATCH] [MTD] mtdchar.c: Fix regression in
	MEMGETREGIONINFO	ioctl()
From: David Woodhouse <dwmw2@infradead.org>
To: Zev Weiss <zevweiss@gmail.com>
In-Reply-To: <48BBDDC9.9020003@gmail.com>
References: <48ABCC0B.40607@gmail.com>
	<20080822153451.bb79bd1f.akpm@linux-foundation.org>
	<48AFC5ED.50005@gmail.com>
	<20080823222707.2fb972b5.akpm@linux-foundation.org>
	<48B13F88.3080306@gmail.com>  <48B4D884.5040204@gmail.com>
	<1220266884.2982.62.camel@pmac.infradead.org>
	<48BBDDC9.9020003@gmail.com>
Content-Type: text/plain
Date: Mon, 01 Sep 2008 18:25:03 +0100
Message-Id: <1220289903.2982.92.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Rodolfo Giometti <giometti@enneenne.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2008-09-01 at 05:19 -0700, Zev Weiss wrote:
> From: Zev Weiss <zevweiss@gmail.com>
> Date: Mon, 1 Sep 2008 05:02:12 -0700
> Subject: [PATCH] [MTD] mtdchar.c: Fix regression in MEMGETREGIONINFO ioctl()
> 
> The MEMGETREGIONINFO ioctl() in mtdchar.c was clobbering user memory by
> overwriting more than intended, due the size of struct mtd_erase_region_info
> changing in commit 0ecbc81adfcb9f15f86b05ff576b342ce81bbef8.
> 
> Fix avoids this by copying struct members one by one with put_user(), as there
> is no longer a convenient struct to use the size of as the length argument to
> copy_to_user().
> 
> Signed-off-by: Zev Weiss <zevweiss@gmail.com>

Thanks. Your patch was whitespace-damaged, but I managed to apply it
anyway. Please check for future patches though -- try sending patches to
yourself and then see if they get mangled. I believe gmail is known to
be broken unless you submit mail with SMTP.

I also try to avoid the pointless types like 'u32' in MTD code -- the C
language has perfectly good explicitly sized types; let's use them.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
