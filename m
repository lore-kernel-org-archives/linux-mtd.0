Received: from mail-qa0-x234.google.com ([2607:f8b0:400d:c00::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X2V3B-0000E3-1C
 for linux-mtd@lists.infradead.org; Thu, 03 Jul 2014 00:38:57 +0000
Received: by mail-qa0-f52.google.com with SMTP id w8so9422348qac.25
 for <linux-mtd@lists.infradead.org>; Wed, 02 Jul 2014 17:38:34 -0700 (PDT)
Date: Wed, 2 Jul 2014 17:38:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Fabian Frederick <fabf@skynet.be>
Subject: Re: [PATCH 1/1] fs/jffs2/xattr.c:  remove null test before kfree
Message-ID: <20140703003831.GU3599@ld-irv-0074>
References: <1402941769-4539-1-git-send-email-fabf@skynet.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1402941769-4539-1-git-send-email-fabf@skynet.be>
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

On Mon, Jun 16, 2014 at 08:02:49PM +0200, Fabian Frederick wrote:
> Fix checkpatch warning:
> WARNING: kfree(NULL) is safe this check is probably not required
> 
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Fabian Frederick <fabf@skynet.be>

Pushed to l2-mtd.git. Thanks!

Brian
