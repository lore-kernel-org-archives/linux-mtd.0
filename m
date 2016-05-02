Received: from mail-oi0-x244.google.com ([2607:f8b0:4003:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1axK5R-0007TD-5a
 for linux-mtd@lists.infradead.org; Mon, 02 May 2016 20:04:57 +0000
Received: by mail-oi0-x244.google.com with SMTP id w198so24223554oiw.2
 for <linux-mtd@lists.infradead.org>; Mon, 02 May 2016 13:04:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1393262993-22040-1-git-send-email-b.brezillon.dev@gmail.com>
References: <1393262993-22040-1-git-send-email-b.brezillon.dev@gmail.com>
Date: Mon, 2 May 2016 22:04:35 +0200
Message-ID: <CAFLxGvxYP7Jvz58EZRXsnF7aBTu8wkFG+3ieVGJAG99L5Nq-DA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] mtd: nand: add manafacturer specific handling
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Boris BREZILLON <b.brezillon.dev@gmail.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Feb 24, 2014 at 6:29 PM, Boris BREZILLON
<b.brezillon.dev@gmail.com> wrote:
> Hello,
>
> This is a proposal to add support for manufacturer specific handling of
> NAND chips.
>
> Currently the only ones allowed to modify how NAND chips are accessed are
> NAND controllers (by modifying the nand_chip callbacks) and NAND core code
> (by setting default callbacks when these are not specified by the NAND
> controller).
>
> This series adds support for manufacturer/vendor specific handling, which is
> particularly useful for read retry implementation that are (at least for
> the moment) manufacturer specific.
>
> I know there was a debate on how we should support all these READ RETRY
> implementations (see http://permalink.gmane.org/gmane.linux.drivers.mtd/50603),
> so please tell if I'm wrong.

Just realized that this got no feedback at all.
Brian?

-- 
Thanks,
//richard
