Received: from mail-pd0-x22a.google.com ([2607:f8b0:400e:c02::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XwigK-0002eI-Db
 for linux-mtd@lists.infradead.org; Fri, 05 Dec 2014 02:31:45 +0000
Received: by mail-pd0-f170.google.com with SMTP id v10so3772070pde.15
 for <linux-mtd@lists.infradead.org>; Thu, 04 Dec 2014 18:31:22 -0800 (PST)
Date: Thu, 4 Dec 2014 18:31:19 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Scott Branden <sbranden@broadcom.com>
Subject: Re: [PATCH] mtd: add reboot notifier to mtdcore and register
 nand_shutdown with notifier
Message-ID: <20141205023119.GM21347@ld-irv-0074>
References: <sbranden@broadcom.com>
 <1417732658-4563-1-git-send-email-sbranden@broadcom.com>
 <5480F88D.4090707@broadcom.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5480F88D.4090707@broadcom.com>
Cc: Corneliu Doban <cdoban@broadcom.com>, Ray Jui <rjui@broadcom.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 04, 2014 at 04:13:01PM -0800, Scott Branden wrote:
> Apologies:  patch fails checkpatch due to spaces instead of tabs
> during cut and paste.
> 
> But, please comment on this patch before I create a new version.

I'd prefer the separation to be as I sent in the first place; one patch
to add a generic hook for all MTD's, and one to implement the hook in
NAND.

I can just resend my patch (fixed up to compile correctly; I had an
error previously), then you can just add your Tested-by.

Brian
