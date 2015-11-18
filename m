Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZzBFR-0007fp-Fl
 for linux-mtd@lists.infradead.org; Wed, 18 Nov 2015 22:30:42 +0000
Received: by pacdm15 with SMTP id dm15so58153795pac.3
 for <linux-mtd@lists.infradead.org>; Wed, 18 Nov 2015 14:30:20 -0800 (PST)
Date: Wed, 18 Nov 2015 14:30:18 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com
Cc: Kamal Dasu <kdasu.kdev@gmail.com>, Ray Jui <rjui@broadcom.com>
Subject: Re: [PATCH] mtd: brcmnand: drop unused subpage_read() support
Message-ID: <20151118223018.GB64635@google.com>
References: <1447722248-135635-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1447722248-135635-1-git-send-email-computersforpeace@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Nov 16, 2015 at 05:04:08PM -0800, Brian Norris wrote:
> AFAIR this driver was never tested with subpage read support, and this
> code is currently unused because we don't set the NAND_SUBPAGE_READ
> flag. It can be resurrected if someone tests it properly.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>

Pushed to l2-mtd.git
