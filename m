Received: from mail-pf0-x233.google.com ([2607:f8b0:400e:c00::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aA798-00055A-7g
 for linux-mtd@lists.infradead.org; Sat, 19 Dec 2015 02:21:23 +0000
Received: by mail-pf0-x233.google.com with SMTP id n128so40134814pfn.0
 for <linux-mtd@lists.infradead.org>; Fri, 18 Dec 2015 18:21:01 -0800 (PST)
Date: Fri, 18 Dec 2015 18:20:58 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: denali: make MTD_NAND_DENALI_DT dependent on OF
Message-ID: <20151219022058.GB109450@google.com>
References: <1450242009-24694-1-git-send-email-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1450242009-24694-1-git-send-email-yamada.masahiro@socionext.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Dec 16, 2015 at 02:00:09PM +0900, Masahiro Yamada wrote:
> The build passes even if CONFIG_OF is undefined, but it makes sense
> to let it depend on OF.
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Applied to l2-mtd.git
