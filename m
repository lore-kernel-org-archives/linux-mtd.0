Received: from mail-pd0-x22f.google.com ([2607:f8b0:400e:c02::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YqFZo-0003Jj-62
 for linux-mtd@lists.infradead.org; Thu, 07 May 2015 06:46:33 +0000
Received: by pdbnk13 with SMTP id nk13so32815134pdb.0
 for <linux-mtd@lists.infradead.org>; Wed, 06 May 2015 23:46:10 -0700 (PDT)
Date: Wed, 6 May 2015 23:45:59 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] mtd: nand: Remove in vain memset() in
 nand_onfi_get_features()
Message-ID: <20150507064559.GD6055@norris-Latitude-E6410>
References: <1427290389-14495-1-git-send-email-richard@nod.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1427290389-14495-1-git-send-email-richard@nod.at>
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

On Wed, Mar 25, 2015 at 02:33:09PM +0100, Richard Weinberger wrote:
> As all four bytes are written in any case the memset() is in vain.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>

Applied to l2-mtd.git.
