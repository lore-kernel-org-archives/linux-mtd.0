Subject: Re: [RESUBMIT] [PATCH] [MTD] NAND nand_ecc.c: rewrite for improved
	performance
From: David Woodhouse <dwmw2@infradead.org>
To: frans <fransmeulenbroeks@gmail.com>
In-Reply-To: <alpine.DEB.0.99.0807311031390.6774@frans-desktop>
References: <alpine.DEB.0.99.0807311031390.6774@frans-desktop>
Content-Type: text/plain
Date: Mon, 11 Aug 2008 17:30:02 +0100
Message-Id: <1218472202.2977.12.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2008-07-31 at 10:35 +0200, frans wrote:
> Dear all,
> 
> A resubmit of my patch, with all comments from Thomas addressed, and this 
> time wiht the patch inlined and submitted using pine/gmail
> 
> This patch improves the performance of the ecc generation code by a factor
> of 18 on an INTEL D920 CPU, a factor of 7 on MIPS and a factor of 5 on ARM 
> (NSLU2)
> 
> Please let me know if additional changes are neede

Needs a Signed-Off-By, and I can apply it.

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
