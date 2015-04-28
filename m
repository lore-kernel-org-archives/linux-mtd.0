Received: from mail-vn0-x22b.google.com ([2607:f8b0:400c:c0f::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YnCj4-00066W-Gn
 for linux-mtd@lists.infradead.org; Tue, 28 Apr 2015 21:07:31 +0000
Received: by vnbg1 with SMTP id g1so1095659vnb.2
 for <linux-mtd@lists.infradead.org>; Tue, 28 Apr 2015 14:07:08 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1430254445-32676-1-git-send-email-andrej.skvortzov@gmail.com>
References: <1430254445-32676-1-git-send-email-andrej.skvortzov@gmail.com>
Date: Tue, 28 Apr 2015 23:07:08 +0200
Message-ID: <CAFLxGvyivqeiJ_DWANg96p24cWiJGUEXgzvWDCn2e_s0+yusXg@mail.gmail.com>
Subject: Re: [PATCH] jffs2: fix UTF-8 character in pr_info
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, LKML <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Apr 28, 2015 at 10:54 PM, Andrey Skvortsov
<andrej.skvortzov@gmail.com> wrote:
> Boot log contained string:
> jffs2: version 2.2. \xffffffc2\xffffffa9 2001-2006 Red Hat, Inc.
>
> non-ASCII characters are printed in HEX. 0xC2A9 is copyright sign in UTF-8.
> This patch replace it with '(c)' to make boot log readable.
>
> Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>

FYI
http://lists.infradead.org/pipermail/linux-mtd/2013-April/046591.html

-- 
Thanks,
//richard
