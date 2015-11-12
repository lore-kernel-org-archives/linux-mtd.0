Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwwW9-00058C-7O
 for linux-mtd@lists.infradead.org; Thu, 12 Nov 2015 18:22:41 +0000
Received: by padhx2 with SMTP id hx2so72176597pad.1
 for <linux-mtd@lists.infradead.org>; Thu, 12 Nov 2015 10:22:20 -0800 (PST)
Date: Thu, 12 Nov 2015 10:22:17 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Daniel Walter <dwalter@sigma-star.at>
Cc: linux-mtd@lists.infradead.org, richard@nod.at
Subject: Re: [PATCH v2] mkfs.ubifs: fix compiler warning for WITHOUT_LZO
Message-ID: <20151112182217.GA130183@google.com>
References: <20151112115209.GA2876@dw-nb.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20151112115209.GA2876@dw-nb.local>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 12, 2015 at 12:52:09PM +0100, Daniel Walter wrote:
> Fix compiler warning about an unused variable.
> 
> ubifs-utils/mkfs.ubifs/compr.c:41:27: warning: ‘c’ defined but not used [-Wunused-variable]
>  static struct ubifs_info *c = &info_;
> 
> 
> Signed-off-by: Daniel Walter <dwalter@sigma-star.at>
> ---
> Changes since v1:
>    * added exact compiler warning to commit message as requested

Applied
