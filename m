Received: from mail-oa0-f42.google.com ([209.85.219.42])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VoOPj-0007DW-8T
 for linux-mtd@lists.infradead.org; Thu, 05 Dec 2013 02:11:39 +0000
Received: by mail-oa0-f42.google.com with SMTP id i4so17757709oah.15
 for <linux-mtd@lists.infradead.org>; Wed, 04 Dec 2013 18:11:15 -0800 (PST)
Date: Wed, 4 Dec 2013 18:11:11 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] mtd: tests: mtd_nandecctest: Use IS_ENABLED() macro
Message-ID: <20131205021111.GJ27149@ld-irv-0074.broadcom.com>
References: <1385951427-18909-1-git-send-email-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1385951427-18909-1-git-send-email-festevam@gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 02, 2013 at 12:30:27AM -0200, Fabio Estevam wrote:
> From: Fabio Estevam <fabio.estevam@freescale.com>
> 
> Using the IS_ENABLED() macro can make the code shorter and simpler.
> 
> Signed-off-by: Fabio Estevam <fabio.estevam@freescale.com>

Pushed to l2-mtd.git. Thanks!

Brian
