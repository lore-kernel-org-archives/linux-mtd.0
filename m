Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1c8OeK-00049C-6P
 for linux-mtd@lists.infradead.org; Sun, 20 Nov 2016 09:43:01 +0000
Date: Sun, 20 Nov 2016 10:42:35 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org, Marek Vasut
 <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>
Subject: Re: [PATCH 0/3] mtd: some minor cleanups for ooblayout APIs
Message-ID: <20161120104235.7f823f8b@bbrezillon>
In-Reply-To: <1478657290-9430-1-git-send-email-yamada.masahiro@socionext.com>
References: <1478657290-9430-1-git-send-email-yamada.masahiro@socionext.com>
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

On Wed,  9 Nov 2016 11:08:07 +0900
Masahiro Yamada <yamada.masahiro@socionext.com> wrote:

>  - Remove unnecessary initializers
>  - Use min_t() helper

Applied.

Thanks,

Boris

> 
> Masahiro Yamada (3):
>   mtd: remove unneeded initializer in mtd_ooblayout_{get,set}_bytes()
>   mtd: use min_t() to refactor mtd_ooblayout_{get,set}_bytes()
>   mtd: remove unneeded initializer in mtd_ooblayout_count_bytes()
> 
>  drivers/mtd/mtdcore.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
