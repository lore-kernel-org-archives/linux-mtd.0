Received: from mail-pd0-f179.google.com ([209.85.192.179])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YJa7c-0004Wy-8j
 for linux-mtd@lists.infradead.org; Fri, 06 Feb 2015 04:02:24 +0000
Received: by pdbfl12 with SMTP id fl12so12042873pdb.6
 for <linux-mtd@lists.infradead.org>; Thu, 05 Feb 2015 20:02:02 -0800 (PST)
Date: Thu, 5 Feb 2015 20:01:58 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Nicholas Mc Guire <hofrat@osadl.org>
Subject: Re: [PATCH v2] mtd: nand: omap: drop condition with no effect
Message-ID: <20150206040158.GC18140@ld-irv-0074>
References: <1423070646-12906-1-git-send-email-hofrat@osadl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1423070646-12906-1-git-send-email-hofrat@osadl.org>
Cc: Tony Lindgren <tony@atomide.com>, linux-kernel@vger.kernel.org,
 Rostislav Lisovy <lisovy@gmail.com>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, Roger Quadros <rogerq@ti.com>,
 David Woodhouse <dwmw2@infradead.org>, pekon gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Feb 04, 2015 at 12:24:06PM -0500, Nicholas Mc Guire wrote:
> The if and the else branch code are identical - so the condition has no
> effect on the effective code. This patch removes the condition and the
> duplicated code and updates the documentation as suggested by 
> Roger Quadros <rogerq@ti.com>.
> 
> Acked-by: Roger Quadros <rogerq@ti.com>
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>

Applied to l2-mtd.git.

Thanks,
Brian
