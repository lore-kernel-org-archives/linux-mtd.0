Received: from top.free-electrons.com ([176.31.233.9]
 helo=mail.free-electrons.com)
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WR3q6-0006KE-Ms
 for linux-mtd@lists.infradead.org; Fri, 21 Mar 2014 18:06:43 +0000
Date: Fri, 21 Mar 2014 15:05:47 -0300
From: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
To: David Mosberger <davidm@egauge.net>
Subject: Re: [PATCH] mtd: nand: fix byte addressing on 16-bit wide devices
Message-ID: <20140321180547.GA11793@arch.cereza>
References: <CALnQHM3PJCzB86S65TmKE14_HY7DxwVgtXAOcphrGcCJ4t24GQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALnQHM3PJCzB86S65TmKE14_HY7DxwVgtXAOcphrGcCJ4t24GQ@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi David,

On Mar 21, David Mosberger wrote:
> This is a revised version of a patch that I submitted a while ago.
> It's relative to linux-mtd.
> Please apply.
> 
> Thanks!
> 
>   --david
> -- 
> eGauge Systems LLC, http://egauge.net/, 1.877-EGAUGE1, fax 720.545.9768

> mtd: nand: fix byte adressing on 16-bit wide devices
> 
> Some commands (READID, GET_FEATURES, and SET_FEATURES) require
> byte-addresses even when the databus is 16 bits wide.  Without this
> patch, 16-bit wide devices are unable to detect ONFI.
> 

I haven't looked at your patch, but I think this is already fixed.
You can take a look at these commits:

bd9c6e99b58255b9de1982711ac9487c9a2f18be
3dad2344e92c6e1aeae42df1c4824f307c51bcc7

AFAIK, the READID command data is now issued as 8-bit, disregarding of
NAND_BUSWIDTH_16.

Maybe you can re-test this building a kernel from linux-next.git and
report if your issues are now fixed?

Thanks!
-- 
Ezequiel García, Free Electrons
Embedded Linux, Kernel and Android Engineering
http://free-electrons.com
