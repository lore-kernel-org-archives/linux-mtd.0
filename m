Received: from mail-wg0-f42.google.com ([74.125.82.42])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9hIZ-0002f6-5A
 for linux-mtd@lists.infradead.org; Fri, 09 Jan 2015 21:40:52 +0000
Received: by mail-wg0-f42.google.com with SMTP id k14so10335955wgh.1
 for <linux-mtd@lists.infradead.org>; Fri, 09 Jan 2015 13:40:29 -0800 (PST)
Message-ID: <54B04A50.8040307@vanguardiasur.com.ar>
Date: Fri, 09 Jan 2015 18:38:24 -0300
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, dedekind1@gmail.com
Subject: Re: Fastmap update v2 (pile 1)
References: <1416835236-25185-1-git-send-email-richard@nod.at>
In-Reply-To: <1416835236-25185-1-git-send-email-richard@nod.at>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On 11/24/2014 10:20 AM, Richard Weinberger wrote:
> Artem,
> 
> as requested I'm resending my fastmap work in smaller pieces.
> This is pile 1 of 7.
> Rebasing my patches to ubifs.git was a massive PITA because the
> logging style changes touched a lot of code and almost every patch
> failed to apply and needed inspection by hand.
> The first patches are bug fixes, the latter introduce cleanups
> and new features.
> After all bugfixes are mainline I'll make sure that all needed
> fixes go into -stable.
> 

Maybe it would be clearer if you could point out exactly which of these
are considered bugfixes.

For bugfixes, having a detailed explanation of the problem the commit is
meant to fix would be better as well.

This patchset seems to have stalled, so perhaps having this information
would help Artem to pick the ones that you point as fixes, before we
miss another cycle.

Would it help if we test the whole series? (any specific test in mind?)

Thanks a lot for the work, it is really appreciated.
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
