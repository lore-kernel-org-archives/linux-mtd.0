Received: from mail-pa0-x22d.google.com ([2607:f8b0:400e:c03::22d])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zzpw6-0002xU-Sw
 for linux-mtd@lists.infradead.org; Fri, 20 Nov 2015 17:57:27 +0000
Received: by pacdm15 with SMTP id dm15so122928295pac.3
 for <linux-mtd@lists.infradead.org>; Fri, 20 Nov 2015 09:57:06 -0800 (PST)
Date: Fri, 20 Nov 2015 09:57:03 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Wu <josh.wu@atmel.com>
Cc: LABBE Corentin <clabbe.montjoie@gmail.com>, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org
Subject: Re: [PATCH v2 1/2] mtd: nand: atmel_nand: constify atmel_nand_caps
 structures
Message-ID: <20151120175703.GU64635@google.com>
References: <1448005517-26004-1-git-send-email-clabbe.montjoie@gmail.com>
 <1448005517-26004-2-git-send-email-clabbe.montjoie@gmail.com>
 <564ED99A.2050502@atmel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <564ED99A.2050502@atmel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 20, 2015 at 04:28:10PM +0800, Josh Wu wrote:
> Hi, Corentin
> 
> Thanks for the patch.
> 
> On 11/20/2015 3:45 PM, LABBE Corentin wrote:
> >All atmel_nand_caps are never modified, consitify them.
> >
> >Signed-off-by: LABBE Corentin <clabbe.montjoie@gmail.com>
> 
> Acked-by: Josh Wu <josh.wu@atmel.com>

Pushed patch 1 to l2-mtd.git
