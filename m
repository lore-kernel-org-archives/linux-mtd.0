Date: Wed, 2 Sep 2015 13:47:10 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 Maxime Ripard <maxime.ripard@free-electrons.com>,
 linux-sunxi@googlegroups.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] nand: sunxi: fix write to USER_DATA reg
Message-ID: <20150902204710.GU81844@google.com>
References: <1441180621-29708-1-git-send-email-boris.brezillon@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1441180621-29708-1-git-send-email-boris.brezillon@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 02, 2015 at 09:57:01AM +0200, Boris Brezillon wrote:
> Also drop the oob_required contidion, since ->oob_pio already contains
> FFs when oob_required is false.

I was pointing out this issues not just because you didn't note it in
the commit message, but because the previous behavior actually
potentially has user-visible effects. Particularly, because you had the
conditions backwards, you were programming 0xff to the spare area, no
matter what the user asked for. Normally, this isn't a big issue, since
most users aren't storing data in the OOB region. But there may be cases
where your driver was subtly broken (marking bad blocks, perhaps?), and
this patch is subtly fixing them. Especially since this will get
backported to -stable, it'd be nice to have this noted completely.

Did this driver pass mtd_oobtest previously?

Brian
