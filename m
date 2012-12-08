Received: from co202.xi-lite.net ([149.6.83.202])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1ThFn0-0005pl-CG
 for linux-mtd@lists.infradead.org; Sat, 08 Dec 2012 08:29:39 +0000
Date: Sat, 8 Dec 2012 09:29:35 +0100
From: Ivan Djelic <ivan.djelic@parrot.com>
To: jean-philippe francois <jp.francois@cynove.com>
Subject: Re: U-boot bch4_sw vs omap bch4_hw
Message-ID: <20121208082935.GA17392@parrot.com>
References: <CAGGh5h23djGTUynnoVUaGAQCuWVCDAW=PLQsvnyBVKGDfwERAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAGGh5h23djGTUynnoVUaGAQCuWVCDAW=PLQsvnyBVKGDfwERAQ@mail.gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 07, 2012 at 03:26:06PM +0000, jean-philippe francois wrote:
> Hi Ivan,
> 
> I have applied your patches for hardware bch ecc support on
> OMAP. On the linux side, everything is fine. However I have some trouble
> when it comes to u-boot and kernel interoperability.
> 
> A nand page written with bch4_sw ecc by U-boot fails the ecc step when
> read by the kernel. Looking at a nanddump, OOB placement and size of
> the ecc data are the same.
> 
> Do you know of any patch for u-boot that would make the  bch4_sw ecc
> identical to the kernel one ?

Hi Jean-Philippe,

If you point me to a git repo with the exact u-boot version you are using,
I can probably provide a patch (or at least understand the problem).
BR,
--
Ivan
