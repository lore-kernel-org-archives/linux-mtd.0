Received: from mail-ob0-x236.google.com ([2607:f8b0:4003:c01::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vq70Y-0000VN-8t
 for linux-mtd@lists.infradead.org; Mon, 09 Dec 2013 20:00:46 +0000
Received: by mail-ob0-f182.google.com with SMTP id wp4so4329515obc.27
 for <linux-mtd@lists.infradead.org>; Mon, 09 Dec 2013 12:00:25 -0800 (PST)
Date: Mon, 9 Dec 2013 12:00:20 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Axel Lin <axel.lin@ingics.com>
Subject: Re: [PATCH 1/2] mtd: Make deregister_mtd_parser return void
Message-ID: <20131209200020.GT27149@ld-irv-0074.broadcom.com>
References: <1385895555.3994.4.camel@phoenix>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1385895555.3994.4.camel@phoenix>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Dec 01, 2013 at 06:59:15PM +0800, Axel Lin wrote:
> deregister_mtd_parser never fails, hence make it return void.
> 
> Signed-off-by: Axel Lin <axel.lin@ingics.com>

Pushed both to l2-mtd.git.

Brian
