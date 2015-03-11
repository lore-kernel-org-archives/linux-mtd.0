Date: Wed, 11 Mar 2015 10:10:17 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Subject: Re: [PATCH v2] mtd: atmel_nand: check NFC busy flag by HSMC_SR
 instead of NFC cmd regs
Message-ID: <20150311171017.GG4124@norris-Latitude-E6410>
References: <1421922090-8803-1-git-send-email-josh.wu@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1421922090-8803-1-git-send-email-josh.wu@atmel.com>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 22, 2015 at 06:21:30PM +0800, Josh Wu wrote:
> From: Boris Brezillon <boris.brezillon@free-electrons.com>
> 
> Currently the driver read NFC command registers to get NFC busy flag.
> Actually this flag also can be get by reading HSMC_SR register.
> 
> Use the read NFC command registers need mapping a huge memory region.
> To save the mapped memory region, we change to check NFC busy flag by
> reading HSMC_SR register.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Signed-off-by: Josh Wu <josh.wu@atmel.com>
> ---
> 
> Changes in v2:
> - Change me to signed-off-by.
> - modify the error log.

Pushed to l2-mtd.git.

Brian
