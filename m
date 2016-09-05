Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgu1Y-00073w-QT
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 13:33:32 +0000
Subject: Re: [PATCH v2] ubifs: compress lines for immediate return
To: hs@denx.de, Masahiro Yamada <yamada.masahiro@socionext.com>
References: <1473058466-10831-1-git-send-email-hs@denx.de>
 <CAK7LNARnJVjwDaLGpSUUwvMWSXdXvkaF0H5yV2Dtr=pgpZZwOw@mail.gmail.com>
 <57CD6D9F.20502@denx.de>
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From: Richard Weinberger <richard@nod.at>
Message-ID: <0af5ebac-22d6-9a12-5cff-09f5f53d9b77@nod.at>
Date: Mon, 5 Sep 2016 15:32:27 +0200
MIME-Version: 1.0
In-Reply-To: <57CD6D9F.20502@denx.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05.09.2016 15:05, Heiko Schocher wrote:
> @Richard: Should we just forget this patch?

Let's drop it for now.
It caused already a way more churn than a trivial style cleanup
patch should...

Thanks,
//richard
