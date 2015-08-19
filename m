Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRrGk-00006H-L2
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 00:30:18 +0000
Received: by paccq16 with SMTP id cq16so100056897pac.1
 for <linux-mtd@lists.infradead.org>; Tue, 18 Aug 2015 17:29:57 -0700 (PDT)
Date: Tue, 18 Aug 2015 17:29:54 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Rajat Jain <rajatja@google.com>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rajat Jain <rajatxjain@gmail.com>
Subject: Re: [PATCH] mtd: denali: Use module_pci_driver()
Message-ID: <20150819002954.GP60523@google.com>
References: <1436334843-27480-1-git-send-email-rajatja@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1436334843-27480-1-git-send-email-rajatja@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jul 07, 2015 at 10:54:03PM -0700, Rajat Jain wrote:
> Use module_pci_driver, since init and exit functions only register
> and unregister the pci driver, respectively.
> 
> Signed-off-by: Rajat Jain <rajatja@google.com>
> Signed-off-by: Rajat Jain <rajatxjain@gmail.com>

I pushed an identical patch to l2-mtd.git from another author. Didn't
notice yours until now. Thanks anyway!

Brian
