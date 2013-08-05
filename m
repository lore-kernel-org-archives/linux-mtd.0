Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V6Hg2-0000mI-Uu
 for linux-mtd@lists.infradead.org; Mon, 05 Aug 2013 10:06:11 +0000
Message-ID: <1375697471.14869.424.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: jedec_probe: fix LH28F640BF definition
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Andrea Adami <andrea.adami@gmail.com>
Date: Mon, 05 Aug 2013 13:11:11 +0300
In-Reply-To: <1374361653-3004-1-git-send-email-andrea.adami@gmail.com>
References: <1374361653-3004-1-git-send-email-andrea.adami@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Russell King <linux@arm.linux.org.uk>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2013-07-21 at 01:07 +0200, Andrea Adami wrote:
> Zaurus 5500 contains 2 LH28F640BFHE-PTTL90 (64M 4Mx16) and
> the LH28F640BFHE-PTTL90.pdf datasheet available on the net shows
> the exact erasesize and the OTP support.
> At the moment only jedec_probe can discover the chip and
> the NOR is mounted read only probably because of wrong vpp.
> 
> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
