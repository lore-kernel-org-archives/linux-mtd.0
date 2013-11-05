Received: from mail.linuxfoundation.org ([140.211.169.12])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VdpLi-0007GB-1t
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2013 22:43:51 +0000
Date: Tue, 5 Nov 2013 14:43:28 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: Caizhiyong <caizhiyong@hisilicon.com>
Subject: Re: [PATCH 2/2]  mtd: cmdlinepart: use cmdline partition parser lib
Message-Id: <20131105144328.fb5a6a1d423776b324771706@linux-foundation.org>
In-Reply-To: <C3050A4DBA34F345975765E43127F10F1C084C81@szxeml512-mbs.china.huawei.com>
References: <C3050A4DBA34F345975765E43127F10F1C0643B8@szxeml512-mbx.china.huawei.com>
 <20131020120603.GA18678@localhost>
 <C3050A4DBA34F345975765E43127F10F1C084C81@szxeml512-mbs.china.huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Brian Norris <computersforpeace@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Karel Zak <kzak@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 "Wanglin \(Albert\)" <albert.wanglin@hisilicon.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 22 Oct 2013 13:14:17 +0000 Caizhiyong <caizhiyong@hisilicon.com> wrote:

> In the previous version, adjust the cmdline parser code to library-style
> code, and move it to a separate file "block/cmdline-parser.c", we can use
> it in some client code. there is no any functionality change in the adjusting.
> 
> this patch use cmdline parser lib.
> 
> For further information, see "https://lkml.org/lkml/2013/8/6/550"

Thanks for doing this.  Could we please get some acked-by's or,
preferably, tested-by's from the MTD people?
