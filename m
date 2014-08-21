Received: from mail-vc0-f177.google.com ([209.85.220.177])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XKXq0-0002nX-Kz
 for linux-mtd@lists.infradead.org; Thu, 21 Aug 2014 19:15:57 +0000
Received: by mail-vc0-f177.google.com with SMTP id hy4so11063365vcb.22
 for <linux-mtd@lists.infradead.org>; Thu, 21 Aug 2014 12:15:34 -0700 (PDT)
Date: Thu, 21 Aug 2014 16:14:29 -0300
From: Ezequiel =?iso-8859-1?Q?Garc=EDa?= <ezequiel@vanguardiasur.com.ar>
To: Guido =?iso-8859-1?Q?Mart=EDnez?= <guido@vanguardiasur.com.ar>
Subject: Re: [PATCH] nandtest: fix --reads argument
Message-ID: <20140821191428.GA17199@arch.cereza>
References: <1408033785-20264-1-git-send-email-guido@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1408033785-20264-1-git-send-email-guido@vanguardiasur.com.ar>
Cc: Brian Norris <computersforpeace@gmail.com>, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 14 Aug 01:29 PM, Guido Martínez wrote:
> The --reads option specifies the argument as optional, but doesn't check
> for a null optarg, which means that nandtest segfaults when run as
> "nandtest --reads".
> 
> Fix this by making the argument required, and changing the help text to
> not specify it as optional. Argument -r already specifies the argument
> as required, so we fix this inconsistency too.
> 
> Signed-off-by: Guido Martínez <guido@vanguardiasur.com.ar>

Nice catch!

Acked-by: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
-- 
Ezequiel Garcia, VanguardiaSur
www.vanguardiasur.com.ar
