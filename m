Subject: Re: [PATCH 4/7] mtd: Blackfin NFC: wait for the ECC reset to finish
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <1281020864-26842-4-git-send-email-vapier@gentoo.org>
References: <1281020864-26842-1-git-send-email-vapier@gentoo.org>
	<1281020864-26842-4-git-send-email-vapier@gentoo.org>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 05 Aug 2010 16:16:02 +0100
Message-ID: <1281021362.8720.6.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: uclinux-dist-devel@blackfin.uclinux.org, linux-mtd@lists.infradead.org,
	Barry Song <barry.song@analog.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-08-05 at 11:07 -0400, Mike Frysinger wrote:
> 
> +       while (bfin_read_NFC_RST() & ECC_RST)
> +               cpu_relax(); 

All applied, but I'd be happier if this one had some kind of timeout and
didn't have the potential to loop forever if the hardware misbehaves.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
