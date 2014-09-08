Received: from mail-qg0-f53.google.com ([209.85.192.53])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XQx9P-0006ja-8L
 for linux-mtd@lists.infradead.org; Mon, 08 Sep 2014 11:30:31 +0000
Received: by mail-qg0-f53.google.com with SMTP id z107so15108411qgd.12
 for <linux-mtd@lists.infradead.org>; Mon, 08 Sep 2014 04:30:05 -0700 (PDT)
Date: Mon, 8 Sep 2014 08:28:52 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Roger Quadros <rogerq@ti.com>
Subject: Re: [PATCH 2/3] nand: omap2: Remove horrible ifdefs to fix module
 probe
Message-ID: <20140908112852.GB1676@arch.hh.imgtec.org>
References: <1410033389-32357-1-git-send-email-ezequiel@vanguardiasur.com.ar>
 <1410033389-32357-3-git-send-email-ezequiel@vanguardiasur.com.ar>
 <540D6CAB.7020501@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <540D6CAB.7020501@ti.com>
Cc: Tony Lindgren <tony@atomide.com>,
 Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08 Sep 11:45 AM, Roger Quadros wrote:
> On 09/06/2014 10:56 PM, Ezequiel Garcia wrote:
> > The current code abuses ifdefs to determine if the selected ECC scheme
> > is supported by the running kernel. As a result the code is hard to read,
> > and it also fails to load as a module.
> > 
> > This commit removes all the ifdefs and instead introduces a function
> > omap2_nand_ecc_check() to check if the ECC is supported by using
> > IS_ENABLED(CONFIG_xxx).
> > 
> > Since IS_ENABLED() is true when a config is =y or =m, this change fixes the
> > module so it can be loaded with no issues.
> > 
> > Signed-off-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
> 
> Didn't apply cleanly on 3.17-rc4. Needs a rebase?
> 

Just sent a new version rebased on v3.17-rc4.

Thanks a lot for the test!
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
