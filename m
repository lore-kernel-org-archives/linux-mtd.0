Received: from mail-ob0-x233.google.com ([2607:f8b0:4003:c01::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VLjiJ-0005v4-KG
 for linux-mtd@lists.infradead.org; Tue, 17 Sep 2013 01:04:24 +0000
Received: by mail-ob0-f179.google.com with SMTP id wn1so4461393obc.24
 for <linux-mtd@lists.infradead.org>; Mon, 16 Sep 2013 18:04:02 -0700 (PDT)
Date: Mon, 16 Sep 2013 18:03:58 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: nand: cleanup ONFI printed errors, warnings
Message-ID: <20130917010358.GK4550@ld-irv-0074.broadcom.com>
References: <1378940894-27598-1-git-send-email-computersforpeace@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1378940894-27598-1-git-send-email-computersforpeace@gmail.com>
Cc: Huang Shijie <b32955@freescale.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Sep 11, 2013 at 04:08:14PM -0700, Brian Norris wrote:
> The ONFI detection routine is too verbose in some cases and not verbose
> enough in others. This patch refactors it to print only when there are
> significant warnings/errors.
> 
> Probing in 16-bit mode:
>   It is unnecessary to print until after the READID (address 20h)
>   command. READID *has* to work properly in whatever bus width
>   configuration we are in, or else no identification mode works. So we
>   can silence some useless warnings on systems which come up in 16-bit
>   mode and do not even respond with an O-N-F-I string.
> 
> Valid parameter page:
>   Nobody needs to see this. Do we inform the user every time other
>   hardware responds properly? Instead, add an error message if *no*
>   uncorrupted parameter pages are found.
> 
> ONFI ECC:
>   Most drivers don't yet use the reported minimum ECC values, so it
>   shouldn't yet be a fatal condition if the extended parameter page is
>   incorrect. But we should at least give a warning for the corner cases
>   that we don't expect.
> 
> ONFI flash detected:
>   Nobody needs to see this. This is the expected case, that we detect
>   ONFI properly, or else it wasn't ONFI-compliant and is detected by
>   some other routine.
> 
> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
> Cc: Huang Shijie <b32955@freescale.com>
> Cc: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

Applied to l2-mtd.git.

Brian
