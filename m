Received: from mail-pb0-x22d.google.com ([2607:f8b0:400e:c01::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeKjJ-0000A1-W0
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2013 08:14:20 +0000
Received: by mail-pb0-f45.google.com with SMTP id ma3so247450pbc.18
 for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2013 00:13:56 -0800 (PST)
Date: Thu, 7 Nov 2013 00:13:52 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Michael Opdenacker <michael.opdenacker@free-electrons.com>
Subject: Re: [PATCH] mtd: nand: remove deprecated IRQF_DISABLED
Message-ID: <20131107081352.GG3805@norris.computersforpeace.net>
References: <1381645292-9499-1-git-send-email-michael.opdenacker@free-electrons.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1381645292-9499-1-git-send-email-michael.opdenacker@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Oct 13, 2013 at 08:21:32AM +0200, Michael Opdenacker wrote:
> This patch proposes to remove the use of the IRQF_DISABLED flag
> 
> It's a NOOP since 2.6.35 and it will be removed one day.
> 
> Signed-off-by: Michael Opdenacker <michael.opdenacker@free-electrons.com>

Pushed to l2-mtd.git. Thanks!

Brian
