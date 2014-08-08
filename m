Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XFofJ-0002p1-3q
 for linux-mtd@lists.infradead.org; Fri, 08 Aug 2014 18:13:21 +0000
Date: Fri, 8 Aug 2014 15:11:57 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH 09/27] mtd: nand: pxa3xx: show device structure in sysfs
Message-ID: <20140808181157.GA16575@arch.cereza>
References: <1401142372-14148-1-git-send-email-holler@ahsoftware.de>
 <1401142372-14148-10-git-send-email-holler@ahsoftware.de>
 <1401160341.192042842@f271.i.mail.ru>
 <20140808170428.GA6094@arch.cereza>
 <20140808171650.GS3711@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20140808171650.GS3711@ld-irv-0074>
Cc: Alexander Holler <holler@ahsoftware.de>, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Alexander Shiyan <shc_work@mail.ru>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08 Aug 10:16 AM, Brian Norris wrote:
> On Fri, Aug 08, 2014 at 02:04:28PM -0300, Ezequiel Garcia wrote:

> > If there's anything left to fix for this driver, please let me know.
> 
> pxa3xx_nand is still missing a parent for its MTD's (mtd->dev.parent). I
> have a follow-up patch queued up locally that I need to send out
> sometime.
> 

Maybe we can trade... you provide the reason for such parent, and I'll cook
a patch in exchange :)

-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
