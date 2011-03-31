Received: from mail-qw0-f49.google.com ([209.85.216.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1Q5Joa-0004bl-QS
	for linux-mtd@lists.infradead.org; Thu, 31 Mar 2011 15:29:41 +0000
Received: by qwi2 with SMTP id 2so1772814qwi.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 31 Mar 2011 08:29:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1301585080-6318-1-git-send-email-bgat@billgatliff.com>
References: <1301585080-6318-1-git-send-email-bgat@billgatliff.com>
Date: Thu, 31 Mar 2011 10:29:39 -0500
Message-ID: <BANLkTi=cdhFD97TmarH+32jrFkdFp_8rSw@mail.gmail.com>
Subject: Re: [PATCH] nand_bbt: convert printks to pr_*
From: Bill Gatliff <bgat@billgatliff.com>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
Cc: Bill Gatliff <bgat@billgatliff.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Guys:

On Thu, Mar 31, 2011 at 10:24 AM, Bill Gatliff <bgat@billgatliff.com> wrote:
> Converts "printk(KERN_*" to "pr_*(" and cleans up associated
> indentation changes.

It turns out that commit message isn't entirely correct.

I "cleaned up associated indentation" by merely asking my emacs to do
an indent-region.  As I just noticed, the results also include
indentation changes that aren't related to the printk-to-pr
conversion.  This is because my dotemacs file is pretty
linux-conforming, and some of the indentation in nand_bbt.c wasn't
quite, ah, correct (per my dotemacs, anyway).

If that's a problem for anyone, I can redo the patch with stricter
limits on indentation changes.


b.g.
-- 
Bill Gatliff
bgat@billgatliff.com
