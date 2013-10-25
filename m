Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VZgCn-0002w4-HU
 for linux-mtd@lists.infradead.org; Fri, 25 Oct 2013 12:09:30 +0000
Date: Fri, 25 Oct 2013 09:09:01 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: Caizhiyong <caizhiyong@hisilicon.com>
Subject: Re: [PATCH] mtd: cmdlinepart: use cmdline partition parser lib
Message-ID: <20131025120900.GF2489@localhost>
References: <C3050A4DBA34F345975765E43127F10F1C0643B8@szxeml512-mbx.china.huawei.com>
 <20131020120603.GA18678@localhost>
 <C3050A4DBA34F345975765E43127F10F1C084F26@szxeml512-mbs.china.huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <C3050A4DBA34F345975765E43127F10F1C084F26@szxeml512-mbs.china.huawei.com>
Cc: Brian Norris <computersforpeace@gmail.com>, Quyaxin <quyaxin@hisilicon.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
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

Hi,

On Fri, Oct 25, 2013 at 11:52:14AM +0000, Caizhiyong wrote:
> > 
> > I'd like to review the patch in detail and test it, but being a bit old,
> > the patch doesn't apply as it is on v3.12-rc5. Care to resend an update?
> >
>   I have sent you a 2 patch base on v3.12-rc6. Are there any problems? I tested it for a long time and found no problems.
> 

I haven't had time to look at that yet, thanks for re-sending them!

If you already did testing using those, then I think we would all appreciate
that you post the results.

In particular, we're interested in **seeing** this change parses correctly
all possible combinations of partitions configured by the 'mtdparts' parameter.

This is a big change you're proposing and we need to be sure there won't
be any users experiencing any unexpected result while using 'mtdparts'.
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
