Received: from mail-vc0-x235.google.com ([2607:f8b0:400c:c03::235])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WDOC0-0001SD-DV
 for linux-mtd@lists.infradead.org; Wed, 12 Feb 2014 01:00:49 +0000
Received: by mail-vc0-f181.google.com with SMTP id ie18so6600728vcb.12
 for <linux-mtd@lists.infradead.org>; Tue, 11 Feb 2014 17:00:27 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20140211155440.62c5e90eb498ec2964258969@linux-foundation.org>
References: <52F592F2.6010008@huawei.com> <52F5934B.4000101@huawei.com>
 <20140211155440.62c5e90eb498ec2964258969@linux-foundation.org>
Date: Tue, 11 Feb 2014 17:00:27 -0800
Message-ID: <CAN8TOE-fCLM4_7rez=jdVBmav0D2dnqO56mPCNQoG4AGgSiwbw@mail.gmail.com>
Subject: Re: [PATCH 2/3] jffs2: avoid soft-lockup in jffs2_reserve_space_gc()
From: Brian Norris <computersforpeace@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, Li Zefan <lizefan@huawei.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Andrew,

On Tue, Feb 11, 2014 at 3:54 PM, Andrew Morton
<akpm@linux-foundation.org> wrote:
> On Sat, 8 Feb 2014 10:15:39 +0800 Li Zefan <lizefan@huawei.com> wrote:
> I now have four jffs2 bugfixes but cannot unload them on anyone.
> Waddup?

Well, at best we have 3 "maintainers" involved in MTD (David, Artem,
and me), but David is often quite unresponsive unless you yell, and
Artem has more or less left non-UBI/UBIFS stuff to me. I personally
have little knowledge of JFFS2, and I have seen a fair number of
dubious JFFS2 patches from people with automated tools and no testing.
So I'm understandably cautious to merge them. But if you have properly
tested (or at least reviewed) patches sitting around, I can take a
look at them and merge them. Are you referring to the top 4 here?

http://www.spinics.net/linux/lists/mm-commits/

Brian
