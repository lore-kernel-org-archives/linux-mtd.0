Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bPC56-0003Jd-1l
 for linux-mtd@lists.infradead.org; Mon, 18 Jul 2016 17:11:53 +0000
Received: by mail-pf0-x244.google.com with SMTP id h186so3744203pfg.2
 for <linux-mtd@lists.infradead.org>; Mon, 18 Jul 2016 10:11:27 -0700 (PDT)
Date: Mon, 18 Jul 2016 10:11:23 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Ben Hutchings <ben@decadent.org.uk>,
 Jesper Nilsson <jesper.nilsson@axis.com>,
 open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] mtd: update description of MTD_BCM47XXSFLASH symbol
Message-ID: <20160718171123.GI76613@google.com>
References: <1468836426-27688-1-git-send-email-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1468836426-27688-1-git-send-email-zajec5@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jul 18, 2016 at 12:07:03PM +0200, Rafał Miłecki wrote:
> For years now we support writing to BCMA SoC serial flash, so don't
> describe this driver as providing read-only support anymore.
> 
> Signed-off-by: Rafał Miłecki <zajec5@gmail.com>

Applied to l2-mtd.git
