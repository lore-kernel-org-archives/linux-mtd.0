Subject: Re: [PATCH] mtd: nand: mpc5121_nfc.c: Fix build failures
From: David Woodhouse <dwmw2@infradead.org>
To: Anatolij Gustschin <agust@denx.de>
In-Reply-To: <1275323836-15711-1-git-send-email-agust@denx.de>
References: <1275323836-15711-1-git-send-email-agust@denx.de>
Content-Type: text/plain; charset="UTF-8"
Date: Sun, 06 Jun 2010 11:15:08 +0100
Message-ID: <1275819308.17903.3099.camel@macbook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Grant Likely <grant.likely@secretlab.ca>, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-05-31 at 18:37 +0200, Anatolij Gustschin wrote:
> Fixes build errors caused by the:
>  - OF device_node pointer being moved into struct device
>  - removal of the match_table field from struct of_platform_driver
> 
> Signed-off-by: Anatolij Gustschin <agust@denx.de>
> Cc: Grant Likely <grant.likely@secretlab.ca>

Um, this isn't applicable to 2.6.35, is it?

-- 
David Woodhouse                            Open Source Technology Centre
David.Woodhouse@intel.com                              Intel Corporation
