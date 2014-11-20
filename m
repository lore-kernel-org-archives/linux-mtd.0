Date: Thu, 20 Nov 2014 00:06:27 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Subject: Re: [PATCH v4 1/4] mtd: nand: provide detailed description for raw
 read/write page methods
Message-ID: <20141120080627.GB3212@norris-Latitude-E6410>
References: <1413794777-32220-1-git-send-email-boris.brezillon@free-electrons.com>
 <1413794777-32220-2-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1413794777-32220-2-git-send-email-boris.brezillon@free-electrons.com>
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

On Mon, Oct 20, 2014 at 10:46:14AM +0200, Boris Brezillon wrote:
> read_page_raw and write_page_raw method description is not clear enough.
> It clearly specifies that ECC correction should not be involved but does
> not talk about specific layout (by layout I mean where in-band and
> out-of-band data are stored on the NAND media) used by NAND/ECC
> controllers.
> 
> Those specific layouts might impact MTD users and thus should be hidden (as
> already done in the standard NAND_ECC_HW_SYNDROME implementation).
> 
> Clearly state this constraint in the nand_ecc_ctrl struct documentation.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Pushed this patch to l2-mtd.git. Thanks!

Brian
