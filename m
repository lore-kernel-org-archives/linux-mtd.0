Received: from mail-wg0-x233.google.com ([2a00:1450:400c:c00::233])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Va0ti-0006AT-NL
 for linux-mtd@lists.infradead.org; Sat, 26 Oct 2013 10:15:11 +0000
Received: by mail-wg0-f51.google.com with SMTP id l18so4841190wgh.30
 for <linux-mtd@lists.infradead.org>; Sat, 26 Oct 2013 03:14:48 -0700 (PDT)
Message-ID: <1382782485.5901.22.camel@karhu.quadriga.com>
Subject: Re: [PATCH] UBIFS: fix error return code in ubifs_remount_rw() and
 ubifs_fill_super()
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Sat, 26 Oct 2013 11:14:45 +0100
In-Reply-To: <CAN8TOE96Ax_gyeG5fXHejHE6gCmxNchioy1BrE8a6B83kK7A8g@mail.gmail.com>
References: <CAPgLHd_=Y=YwCWSFjcacJ14yKUidmmJTHnKKibU6haoBUeNacA@mail.gmail.com>
 <CAN8TOE96Ax_gyeG5fXHejHE6gCmxNchioy1BrE8a6B83kK7A8g@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Wei Yongjun <weiyj.lk@gmail.com>, yongjun_wei@trendmicro.com.cn,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Linux Kernel <linux-kernel@vger.kernel.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Wed, 2013-10-02 at 12:59 -0700, Brian Norris wrote:
> Bump, Artem? I'm cleaning out my old email, and this patch looks
> obviously correct.

Picked to linux-ubifs.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
