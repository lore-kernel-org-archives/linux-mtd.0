Received: from mail.linuxfoundation.org ([140.211.169.12])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V9k0u-0000oM-MC
 for linux-mtd@lists.infradead.org; Wed, 14 Aug 2013 22:58:01 +0000
Date: Wed, 14 Aug 2013 15:57:42 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Caizhiyong <caizhiyong@huawei.com>
Subject: Re: [PATCH] block: add command line partition parser
Message-Id: <20130814155742.d3cd651e40e552696667e4f2@linux-foundation.org>
In-Reply-To: <C3050A4DBA34F345975765E43127F10F1C06237C@szxeml512-mbs.china.huawei.com>
References: <C3050A4DBA34F345975765E43127F10F1C061D75@szxeml512-mbs.china.huawei.com>
 <20130805152206.76462cc4a42e51b16a0532f1@linux-foundation.org>
 <C3050A4DBA34F345975765E43127F10F1C06237C@szxeml512-mbs.china.huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Karel Zak <kzak@redhat.com>, linux-mtd@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Wanglin \(Albert\)" <albert.wanglin@huawei.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 13 Aug 2013 06:02:17 +0000 Caizhiyong <caizhiyong@huawei.com> wrote:

> move the command line parser to a separate module, and change it into
> library-style code.
> 
> reference: https://lkml.org/lkml/2013/8/6/550

Well OK.  But to prove the library's usefulness and to generally clean
up the kernel, someone needs to sign up to the task of converting
drivers/mtd/cmdlinepart.c to use this code.

I've been hopefully cc'ing various MTD people but am not being
overwhelmed with waves of enthusiasm ;)
