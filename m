Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rt7Dp-00049g-4K
 for linux-mtd@lists.infradead.org; Fri, 03 Feb 2012 00:41:49 +0000
Received: by wico1 with SMTP id o1so2751063wic.36
 for <linux-mtd@lists.infradead.org>; Thu, 02 Feb 2012 16:41:47 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20120203104453.8438182da9f365c24d3c2128@canb.auug.org.au>
References: <20120202144516.11b33e667a7cbb8d85d96226@canb.auug.org.au>
 <4F2AD4DE.7040508@xenotime.net>
 <20120203104453.8438182da9f365c24d3c2128@canb.auug.org.au>
Date: Thu, 2 Feb 2012 16:41:47 -0800
Message-ID: <CAN8TOE9tPypqedF4HUnNPLO9pXbKig3oij6qO6BnytACGTWGwQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Feb 2 (fs/jffs2)
From: Brian Norris <computersforpeace@gmail.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <dedekind1@gmail.com>, LKML <linux-kernel@vger.kernel.org>,
 Randy Dunlap <rdunlap@xenotime.net>, linux-next@vger.kernel.org,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 2, 2012 at 3:44 PM, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> On Thu, 02 Feb 2012 10:24:30 -0800 Randy Dunlap <rdunlap@xenotime.net> wrote:
>>
>> fs/jffs2/*.c still contains uses of ->read etc. instead of using
>> mtd_read() etc.
>>
>> fs/jffs2/read.c:36:8: error: 'struct mtd_info' has no member named 'read'
>> fs/jffs2/read.c:112:8: error: 'struct mtd_info' has no member named 'read'
>> fs/jffs2/nodemgmt.c:669:8: error: 'struct mtd_info' has no member named 'read'
>> fs/jffs2/readinode.c:83:9: error: 'struct mtd_info' has no member named 'read'
>> fs/jffs2/readinode.c:676:9: error: 'struct mtd_info' has no member named 'read'
>> fs/jffs2/readinode.c:954:8: error: 'struct mtd_info' has no member named 'read'
>> fs/jffs2/readinode.c:1040:9: error: 'struct mtd_info' has no member named 'read'
>> fs/jffs2/readinode.c:1216:8: error: 'struct mtd_info' has no member named 'read'
>> fs/jffs2/readinode.c:1275:10: error: 'struct mtd_info' has no member named 'read'
>> fs/jffs2/scan.c:286:8: error: 'struct mtd_info' has no member named 'read'
>> fs/jffs2/gc.c:590:8: error: 'struct mtd_info' has no member named 'read'
>> fs/jffs2/gc.c:894:10: error: 'struct mtd_info' has no member named 'read'
>> fs/jffs2/gc.c:977:9: error: 'struct mtd_info' has no member named 'read'
>
> They were probably missed because they use the jffs2_flash_read() macro
> in fs/jffs2/os-linux.h

I just sent a patch that fixes this, FYI. If Artem and Randy ACK it,
it'll probably go into l2-mtd-2.6.git.

Brian
