Received: from mail-qg0-x230.google.com ([2607:f8b0:400d:c04::230])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X2V2s-0000Af-2Y
 for linux-mtd@lists.infradead.org; Thu, 03 Jul 2014 00:38:38 +0000
Received: by mail-qg0-f48.google.com with SMTP id q108so5602035qgd.35
 for <linux-mtd@lists.infradead.org>; Wed, 02 Jul 2014 17:38:16 -0700 (PDT)
Date: Wed, 2 Jul 2014 17:38:13 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Fabian Frederick <fabf@skynet.be>
Subject: Re: [PATCH 1/1] fs/jffs2/acl.c: remove null test before kfree
Message-ID: <20140703003813.GT3599@ld-irv-0074>
References: <1402941487-3941-1-git-send-email-fabf@skynet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1402941487-3941-1-git-send-email-fabf@skynet.be>
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Jun 16, 2014 at 07:58:07PM +0200, Fabian Frederick wrote:
> Fix checkpatch warning:
> WARNING: kfree(NULL) is safe this check is probably not required
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Fabian Frederick <fabf@skynet.be>

Pushed to l2-mtd.git. Thanks!

Brian
