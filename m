Date: Mon, 1 Dec 2014 00:47:09 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v6 0/3] mtd: nand: gpmi: add proper raw access support
Message-ID: <20141201084709.GI29070@brian-ubuntu>
References: <1417371030-24015-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1417371030-24015-1-git-send-email-boris.brezillon@free-electrons.com>
Cc: Huang Shijie <shijie8@gmail.com>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Roy Lee <roylee@paypal.com>,
 Mike Voytovich <mvoytovich@paypal.com>, David Woodhouse <dwmw2@infradead.org>,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Nov 30, 2014 at 07:10:27PM +0100, Boris Brezillon wrote:
> Hello,
> 
> This series provides an implementation for raw accesses taking care of
> hidding the specific layout used by the GPMI controller.
> 
> Best Regards,
> 
> Boris
> 
> Changes since v5:
>  - rename gpmi_move_bits into gpmi_copy_bits
> 
> Changes since v4:
>  - fixed a few corner cases in gpmi_move_bits (tested it with:
>    https://github.com/bbrezillon/gpmi-move-bits-test/blob/master/gpmi-move-bits-test.c)
>  - add documentation and comments for the new gpmi functions
> 
> Changes since v3:
>  - add comments to the gpmi_move_bits function
>  - extend raw read/write documentation
>  - move last part of the raw_page_read function into a conditional block
> 
> Changes since v2:
>  - fixed a bug in gpmi_move_bits
>  - add a raw_buffer field to be used when using raw access methods
>    (experienced memory corruptions when directly using page_buffer_virt
>    buffer)
>  - add raw OOB access functions

Applied the series. Thanks!

Out of curiosity, what tests does gpmi-nand.c now pass/fail?

Also, is it time to yank / fixup some of these comments from
gpmi-nand.c?

 ...
 * FIXME: The following paragraph is incorrect, now that there exist
 * ecc.read_oob_raw and ecc.write_oob_raw functions.
 *
 * Since MTD assumes the OOB is not covered by ECC, there is no pair of
 * ECC-based/raw functions for reading or or writing the OOB. The fact that the
 * caller wants an ECC-based or raw view of the page is not propagated down to
 * this driver.
 */

Brian
