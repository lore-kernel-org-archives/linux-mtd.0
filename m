Received: from mail-pa0-x229.google.com ([2607:f8b0:400e:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y8xL8-0005FQ-OO
 for linux-mtd@lists.infradead.org; Wed, 07 Jan 2015 20:36:27 +0000
Received: by mail-pa0-f41.google.com with SMTP id rd3so7121497pab.0
 for <linux-mtd@lists.infradead.org>; Wed, 07 Jan 2015 12:36:05 -0800 (PST)
Date: Wed, 7 Jan 2015 12:36:02 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Subject: Re: [PATCH V2] mtd: bcm47xxpart: support SquashFS with an original
 magic
Message-ID: <20150107203602.GN9759@ld-irv-0074>
References: <1418715606-18949-1-git-send-email-zajec5@gmail.com>
 <1418719825-21314-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1418719825-21314-1-git-send-email-zajec5@gmail.com>
Cc: Hauke Mehrtens <hauke@hauke-m.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <David.Woodhouse@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Dec 16, 2014 at 09:50:25AM +0100, Rafał Miłecki wrote:
> SquashFS is supposed to use magic defined as SQUASHFS_MAGIC. What we
> were supporting so far (SQSH_MAGIC) is something ZTE specific.
> This patch adds support for Xiaomi R1D.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>
> ---
> V2: s/SQSH/SHSQ/ to emphase this weird endianness

Applied to l2-mtd.git. Thanks.

Brian
