Received: from mga04.intel.com ([192.55.52.120])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cdZz1-00035p-UC
 for linux-mtd@lists.infradead.org; Tue, 14 Feb 2017 10:05:17 +0000
Date: Tue, 14 Feb 2017 12:00:27 +0200
From: Mika Westerberg <mika.westerberg@linux.intel.com>
To: Nicholas Mc Guire <der.herr@hofr.at>
Cc: Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Marek Vasut <marek.vasut@gmail.com>, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: spi-nor: intel: use ERR_CAST in return statement
Message-ID: <20170214100027.GE15721@lahna.fi.intel.com>
References: <1486973661-1164-1-git-send-email-der.herr@hofr.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1486973661-1164-1-git-send-email-der.herr@hofr.at>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 13, 2017 at 09:14:21AM +0100, Nicholas Mc Guire wrote:
> This fixes a sparse warning about incorrect type in retrun expression
> 
> Signed-off-by: Nicholas Mc Guire <der.herr@hofr.at>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
