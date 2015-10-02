Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zi4IY-0003Vr-LA
 for linux-mtd@lists.infradead.org; Fri, 02 Oct 2015 17:39:11 +0000
Received: by pacfv12 with SMTP id fv12so114300898pac.2
 for <linux-mtd@lists.infradead.org>; Fri, 02 Oct 2015 10:38:49 -0700 (PDT)
Date: Fri, 2 Oct 2015 10:38:47 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Cc: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH] mtd: mtdram: check offs and len in mtdram->erase
Message-ID: <20151002173847.GG107187@google.com>
References: <1443631303-22057-1-git-send-email-sudipm.mukherjee@gmail.com>
 <560E50B6.5060103@cn.fujitsu.com> <20151002100133.GC9346@sudip-pc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151002100133.GC9346@sudip-pc>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 02, 2015 at 03:31:33PM +0530, Sudip Mukherjee wrote:
> On Fri, Oct 02, 2015 at 05:39:02PM +0800, Dongsheng Yang wrote:
> > On 10/01/2015 12:41 AM, Sudip Mukherjee wrote:
> > >We should prevent user to erasing mtd device with an unaligned offset
> > >or length.
> > >
> > >Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
> > >---
> > >
> > >I am not sure if I should add the Signed-off-by of
> > >Dongsheng Yang <yangds.fnst@cn.fujitsu.com> . He is the original author
> > >and he should get the credit for that.
> > 
> > But I had sent a a patch out to fix this problem before your v1.
> > 
> > http://lists.infradead.org/pipermail/linux-mtd/2015-September/062234.html
> I didn't know that. I think your v1 was applied.

Sorry if I left any confusion. Dongsheng's v1 was applied and reverted.
v2 is still under review (and was sent slightly before (?) your v1).
Feel free to comment there.

Brian
