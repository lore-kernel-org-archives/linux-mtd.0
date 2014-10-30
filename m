Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XjlWf-0004Ch-Bb
 for linux-mtd@lists.infradead.org; Thu, 30 Oct 2014 08:56:14 +0000
Message-ID: <1414659349.23185.27.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: vtbl: Use ubi_eba_atomic_leb_change()
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Thu, 30 Oct 2014 10:55:49 +0200
In-Reply-To: <1414259021-5691-1-git-send-email-richard@nod.at>
References: <1414259021-5691-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2014-10-25 at 19:43 +0200, Richard Weinberger wrote:
> This is more a cosmetic change than a fix.
> By using ubi_eba_atomic_leb_change()
> we can guarantee that the first VTBL record is always
> correct and we don't really need the second one anymore.
> But we have to keep the second one to not break anything.
> 
> Signed-off-by: Richard Weinberger <richard@nod.at>

Yeah, this atomic change stuff was added later, and we had not
envisioned originally. Your patch adds robustness, but makes volume
creation slower, which is probably not a problem.

I've added a small comment and pushed it, thanks!

Artem
