Received: from mail-qa0-x22a.google.com ([2607:f8b0:400d:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y92Mp-00038i-8S
 for linux-mtd@lists.infradead.org; Thu, 08 Jan 2015 01:58:31 +0000
Received: by mail-qa0-f42.google.com with SMTP id n8so5525620qaq.1
 for <linux-mtd@lists.infradead.org>; Wed, 07 Jan 2015 17:58:08 -0800 (PST)
Date: Wed, 7 Jan 2015 17:58:03 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH 1/3] mtd: implement common reboot notifier boilerplate
Message-ID: <20150108015803.GR9759@ld-irv-0074>
References: <1417746968-28747-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1417746968-28747-1-git-send-email-computersforpeace@gmail.com>
Cc: cdoban@broadcom.com, rjui@broadcom.com, sbranden@broadcom.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 04, 2014 at 06:36:06PM -0800, Brian Norris wrote:
> cfi_cmdset_000{1,2}.c already implement their own reboot notifiers, and
> we're going to add one for NAND. Let's put the boilerplate in one place.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed the first 2 (with a whitespace fixup) to l2-mtd.git. The third
patch could use some testing, but I don't have an applicable system on
me at the moment.

Brian
