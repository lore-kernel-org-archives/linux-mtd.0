Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vei8f-0006Xq-Fz
 for linux-mtd@lists.infradead.org; Fri, 08 Nov 2013 09:14:02 +0000
Date: Fri, 8 Nov 2013 06:13:47 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Caizhiyong <caizhiyong@hisilicon.com>
Subject: Re: [PATCH 2/2]  mtd: cmdlinepart: use cmdline partition parser lib
Message-ID: <20131108091216.GA2365@localhost>
References: <C3050A4DBA34F345975765E43127F10F1C0643B8@szxeml512-mbx.china.huawei.com>
 <20131020120603.GA18678@localhost>
 <C3050A4DBA34F345975765E43127F10F1C084C81@szxeml512-mbs.china.huawei.com>
 <20131105144328.fb5a6a1d423776b324771706@linux-foundation.org>
 <C3050A4DBA34F345975765E43127F10F1C08B274@szxeml512-mbs.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <C3050A4DBA34F345975765E43127F10F1C08B274@szxeml512-mbs.china.huawei.com>
Cc: Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Karel Zak <kzak@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Wanglin \(Albert\)" <albert.wanglin@hisilicon.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Nov 08, 2013 at 06:53:29AM +0000, Caizhiyong wrote:
> >> For further information, see "https://lkml.org/lkml/2013/8/6/550"
> > 
> > Thanks for doing this.  Could we please get some acked-by's or,
> > preferably, tested-by's from the MTD people?
> 
> Acked-by: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>

I don't remember acking this patch! Instead, I do remember asking
for the test results, prooving the this change has _no_ change of
behavior compared to the MTD parsing code:

https://lkml.org/lkml/2013/10/25/164

Such results was never posted and unless we see those, I think
I'd rather NACK this patch instead. I like the cleanup, but only
if it's guaranteed to _not_ brake things, specially when dealing
with a kernel parameter.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
