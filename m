Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1daRl5-0006Am-U8
 for linux-mtd@lists.infradead.org; Wed, 26 Jul 2017 19:14:14 +0000
Subject: Re: [PATCH] ubi: pr_err() strings should end with newlines
To: Ben Dooks <ben.dooks@codethink.co.uk>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
Cc: linux-kernel@lists.codethink.co.uk, linux-kernel@vger.kernel.org
References: <20170726095350.8739-1-ben.dooks@codethink.co.uk>
From: Richard Weinberger <richard@nod.at>
Message-ID: <7371a599-9161-bb4c-9bc1-b82dd8f441cf@nod.at>
Date: Wed, 26 Jul 2017 21:13:40 +0200
MIME-Version: 1.0
In-Reply-To: <20170726095350.8739-1-ben.dooks@codethink.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ben,

Am 26.07.2017 um 11:53 schrieb Ben Dooks:
> In build.c, the following pr_err calls should be terminated with
> a new-line to avoid other messages being concatenated onto the end.
> 
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

Thank you for addressing this problem.
One minor nit, I'll fold all three patches into one since all do the
same and the subject is already the same.

Thanks,
//richard
