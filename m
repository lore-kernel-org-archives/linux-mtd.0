Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RSy80-0008NI-3S
 for linux-mtd@lists.infradead.org; Tue, 22 Nov 2011 21:43:44 +0000
Received: by ghbf1 with SMTP id f1so799924ghb.36
 for <linux-mtd@lists.infradead.org>; Tue, 22 Nov 2011 13:43:43 -0800 (PST)
Subject: Re: [PATCH 1/2] MTD: NAND: ndfc: fix compilation error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Tanmay Inamdar <tinamdar@apm.com>
Date: Tue, 22 Nov 2011 23:43:38 +0200
In-Reply-To: <1321942850-20012-1-git-send-email-tinamdar@apm.com>
References: <1321942850-20012-1-git-send-email-tinamdar@apm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1321998220.2222.22.camel@koala>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-11-22 at 11:50 +0530, Tanmay Inamdar wrote:
> This patch fixes compilation error in ndfc flash driver
> ---
>  drivers/mtd/nand/ndfc.c |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Tony Breeds <tony@bakeyournoodle.com> sent a fix for this a bit earlier.

Artem.
