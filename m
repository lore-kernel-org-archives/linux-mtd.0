Received: from mail-lf0-x22f.google.com ([2a00:1450:4010:c07::22f])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1e5H7U-0006jS-MY
 for linux-mtd@lists.infradead.org; Thu, 19 Oct 2017 20:08:46 +0000
Received: by mail-lf0-x22f.google.com with SMTP id 75so10922269lfx.1
 for <linux-mtd@lists.infradead.org>; Thu, 19 Oct 2017 13:08:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20171019153759.GA26590@infradead.org>
References: <20171017205642.1791-1-roy.franz@cavium.com>
 <20171019153759.GA26590@infradead.org>
From: Roy Franz <rfranz@cavium.com>
Date: Thu, 19 Oct 2017 13:08:19 -0700
Message-ID: <CAKWsp+y87m6N5a1NKasqnny9uOrwDANhgm4bcP6g1ca6yyaDqQ@mail.gmail.com>
Subject: Re: [PATCH] mdt: slram: use memremap() instead of ioremap()
To: Christoph Hellwig <hch@infradead.org>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 boris.brezillon@free-electrons.com,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marek.vasut@gmail.com>,
 richard@nod.at, cyrille.pitchen@wedev4u.fr,
 "Roy Franz (roy.franz@cavium.com) (roy.franz@cavium.com)"
 <roy.franz@cavium.com>, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 David Daney <ddaney@cavium.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 19, 2017 at 8:37 AM, Christoph Hellwig <hch@infradead.org> wrote:
> s/mdt/mtd/ in the subject?

Yup, I'll repost a fixed version.
