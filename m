Received: from mail-pd0-x236.google.com ([2607:f8b0:400e:c02::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm7ld-00048M-1U
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 21:05:26 +0000
Received: by mail-pd0-f182.google.com with SMTP id fp1so1455076pdb.41
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 13:05:02 -0800 (PST)
Date: Wed, 5 Nov 2014 13:04:59 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Rostislav Lisovy <lisovy@gmail.com>
Subject: Re: [PATCH v2] mtd: spi-nor: Add support for Fujitsu MB85RS1MT FRAM
Message-ID: <20141105210459.GT23619@ld-irv-0074>
References: <1414573847-15897-1-git-send-email-lisovy@merica.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1414573847-15897-1-git-send-email-lisovy@merica.cz>
Cc: Marek Vasut <marex@denx.de>, Rostislav Lisovy <lisovy@merica.cz>,
 Ben Hutchings <ben@decadent.org.uk>, Rafal Milecki <zajec5@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org,
 michal.vokac@comap.cz, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 29, 2014 at 10:10:47AM +0100, Rostislav Lisovy wrote:
> Tested with this particular FRAM chip
> 
> Signed-off-by: Rostislav Lisovy <lisovy@merica.cz>
> Acked-by: Marek Vasut <marex@denx.de>
> ---
> Changes since v1:
> * Rebased to the newest linux-next

Pushed to l2-mtd.git.

Brian
