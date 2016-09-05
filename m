Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bgnZM-0004LR-LT
 for linux-mtd@lists.infradead.org; Mon, 05 Sep 2016 06:39:50 +0000
Subject: Re: [PATCH] ubifs: compress lines for immediate return
To: hs@denx.de
References: <1473051597-30078-1-git-send-email-hs@denx.de>
 <94271caf-4852-1d08-c6a0-102aac22ab65@nod.at> <57CD1239.6060105@denx.de>
Cc: linux-mtd@lists.infradead.org, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <2b52dcfe-97a9-efd7-c48a-b560a4fac954@nod.at>
Date: Mon, 5 Sep 2016 08:38:58 +0200
MIME-Version: 1.0
In-Reply-To: <57CD1239.6060105@denx.de>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Heiko,

On 05.09.2016 08:35, Heiko Schocher wrote:
> I think yes ...
> 
>> Is this part of a tree-wide cleanup?
> 
> Yes, and I thought it is worth to change this part in linux too.

Agreed. Can you please resend with a proper change log and (more important)
a correct sob-chain? From: and first Signed-of-by: should be Masahiro Yamada <yamada.masahiro@socionext.com>
followed by a Signed-of-by: you.

Thanks,
//richard
