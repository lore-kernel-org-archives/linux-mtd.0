Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZaXIK-0002Zp-3E
 for linux-mtd@lists.infradead.org; Fri, 11 Sep 2015 22:59:48 +0000
Received: by padhy16 with SMTP id hy16so86646664pad.1
 for <linux-mtd@lists.infradead.org>; Fri, 11 Sep 2015 15:59:27 -0700 (PDT)
Date: Fri, 11 Sep 2015 15:59:25 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Jagan Teki <jteki@openedev.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH 1/3] mtd: spi-nor: Use write_sr for write status
Message-ID: <20150911225925.GJ11487@google.com>
References: <1439978205-6092-1-git-send-email-jteki@openedev.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1439978205-6092-1-git-send-email-jteki@openedev.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Aug 19, 2015 at 03:26:43PM +0530, Jagan Teki wrote:
> Use existing write_sr() call instead of decoding and
> calling nor->write_reg separately.
> 
> Signed-off-by: Jagan Teki <jteki@openedev.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: Brian Norris <computersforpeace@gmail.com>

Pushed this one to l2-mtd.git/next
