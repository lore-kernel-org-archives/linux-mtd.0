Received: from mail-ob0-x22b.google.com ([2607:f8b0:4003:c01::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbwQE-0007Hd-FS
 for linux-mtd@lists.infradead.org; Thu, 31 Oct 2013 17:52:43 +0000
Received: by mail-ob0-f171.google.com with SMTP id wn1so3436283obc.30
 for <linux-mtd@lists.infradead.org>; Thu, 31 Oct 2013 10:52:18 -0700 (PDT)
Date: Thu, 31 Oct 2013 13:52:00 -0400
From: Brian Norris <computersforpeace@gmail.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
Subject: Re: [PATCH] mtd: nand_bbt: kill NAND_BBT_SCANALLPAGES
Message-ID: <20131031175200.GA7401@norris.computersforpeace.net>
References: <1383186575-31328-1-git-send-email-computersforpeace@gmail.com>
 <20131031102038.GA2391@localhost>
 <20131031152245.GB4700@norris.computersforpeace.net>
 <20131031153242.GB1092@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131031153242.GB1092@localhost>
Cc: linux-mtd@lists.infradead.org, Pekon Gupta <pekon@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 31, 2013 at 12:32:43PM -0300, Ezequiel Garcia wrote:
> But do we have any mechanism to scan a *particular*
> page?

No. But if we need it, we can develop a proper one. For instance, I
think a properly flexible approach could involve some kind of bitmap,
where each bit represents a particular page (e.g., a 32-bit bitmap where
the first 16 bits represent the first 16 pages and the last 16 represent
the last 16 pages).

I think, though, that modern NAND are converging to only a few types of
bad block marker locations, and our currently available flags (without
SCANALLPAGES) are sufficient.

Brian
