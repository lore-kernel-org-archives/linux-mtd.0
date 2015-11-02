Date: Mon, 2 Nov 2015 12:55:15 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] mtd: nand: sunxi: fix
 sunxi_nfc_hw_ecc_read/write_chunk()
Message-ID: <20151102205515.GA7274@google.com>
References: <1445372161-6529-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1445372161-6529-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 20, 2015 at 10:16:00PM +0200, Boris Brezillon wrote:
> The sunxi_nfc_hw_ecc_read/write_chunk() functions try to avoid changing
> the column address if unnecessary, but the logic to determine whether it's
> necessary or not is currently wrong: it adds the ecc->bytes value to the
> current offset where it should actually add ecc->size.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
> Fixes 913821bdd211 "mtd: nand: sunxi: introduce sunxi_nfc_hw_ecc_read/write_chunk()"

Pushed both to l2-mtd.git
