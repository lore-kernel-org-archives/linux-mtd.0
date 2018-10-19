Received: from mail.bootlin.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gDQ8L-0008OC-7e
 for linux-mtd@lists.infradead.org; Fri, 19 Oct 2018 08:27:56 +0000
Date: Fri, 19 Oct 2018 10:27:36 +0200
From: Boris Brezillon <boris.brezillon@bootlin.com>
To: Tokunori Ikegami <ikegami@allied-telesis.co.jp>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Fabio
 Bettoni <fbettoni@gmail.com>, Chris Packham
 <chris.packham@alliedtelesis.co.nz>, Joakim Tjernlund
 <Joakim.Tjernlund@infinera.com>
Subject: Re: [PATCH 0/3] mtd: cfi_cmdset_0002: Fix flash write issue for
 OpenWrt Project
Message-ID: <20181019102736.2a65c66a@bbrezillon>
In-Reply-To: <20181019081320.12843-1-ikegami@allied-telesis.co.jp>
References: <20181019081320.12843-1-ikegami@allied-telesis.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+mtd ML and all people CC-ed on other patches

On Fri, 19 Oct 2018 17:13:17 +0900
Tokunori Ikegami <ikegami@allied-telesis.co.jp> wrote:

> The change is based on the fix for flash erase to use chip_good() done in the past.
> And it is fixed as same way in the OpenWrt Project as below.
>   <https://git.openwrt.org/?p=openwrt/openwrt.git;a=commitdiff;h=ddc11c3932c7b7b7df7d5fbd48f207e77619eaa7>
> Also includes some refactoring changes.
> 
> Tokunori Ikegami (3):
>   mtd: cfi_cmdset_0002: Change do_write_oneword() to use chip_good()
>   mtd: cfi_cmdset_0002: Remove chip_ready() from do_write_buffer()
>   mtd: cfi_cmdset_0002: Remove goto statemnet from do_write_buffer()

I see that Fabio was the original author of the OpenWRT patch. We
usually keep authorship when porting patching from one project to
another, so I just want to check with Fabio if he's okay to handover
this authorship to you.

> 
>  drivers/mtd/chips/cfi_cmdset_0002.c | 68 ++++++++++++++++-------------
>  1 file changed, 38 insertions(+), 30 deletions(-)
> 
