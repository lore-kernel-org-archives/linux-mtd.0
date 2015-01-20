Date: Tue, 20 Jan 2015 12:44:42 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH] mtd: atmel_nand: return max bitflips in all sectors in
 pmecc_correction()
Message-ID: <20150120204442.GQ9759@ld-irv-0074>
References: <1421207446-16973-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1421207446-16973-1-git-send-email-josh.wu@atmel.com>
Cc: derosier@gmail.com, linux-mtd@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jan 14, 2015 at 11:50:46AM +0800, Josh Wu wrote:
> atmel_nand_pmecc_read_page() will return the total bitflips in this
> page. This is incorrect.
> 
> As one nand page includes multiple ecc sectors, that will cause the
> returned total bitflips exceed ecc capablity.
> 
> So this patch will make pmecc_correct() return the max bitflips of all
> sectors in the page. That also makes atmel_nand_pmecc_read_page() return
> the max bitflips.
> 
> Signed-off-by: Josh Wu <josh.wu@atmel.com>

Pushed to l2-mtd.git. Thanks.

Brian
