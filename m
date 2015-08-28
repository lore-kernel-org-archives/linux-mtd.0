Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZVNJ9-0007z2-Vm
 for linux-mtd@lists.infradead.org; Fri, 28 Aug 2015 17:19:20 +0000
Received: by pacdd16 with SMTP id dd16so68680232pac.2
 for <linux-mtd@lists.infradead.org>; Fri, 28 Aug 2015 10:18:59 -0700 (PDT)
Date: Fri, 28 Aug 2015 10:18:56 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Roger Quadros <rogerq@ti.com>
Cc: dwmw2@infradead.org, akinobu.mita@gmail.com,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mtd: mtd_oobtest: Fix the address offset with
 vary_offset case
Message-ID: <20150828171856.GA81844@google.com>
References: <1436356219-5085-1-git-send-email-rogerq@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1436356219-5085-1-git-send-email-rogerq@ti.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 08, 2015 at 02:50:19PM +0300, Roger Quadros wrote:
> When vary_offset is set (e.g. test case 3), the offset is not always
> zero so memcmpshow() will show the wrong offset in the print message.
> To fix this we introduce a new function memcmpshowoffset() which takes
> offset as a parameter and displays the right offset and use it in
> the case where offset is non zero.
> 
> The old memcmpshow() functionality is preserved by converting it into
> a macro with offset preset to 0.
> 
> Signed-off-by: Roger Quadros <rogerq@ti.com>

Applied to l2-mtd.git. Thanks!
