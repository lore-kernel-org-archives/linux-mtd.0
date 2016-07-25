Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bRdBB-0006Rz-KJ
 for linux-mtd@lists.infradead.org; Mon, 25 Jul 2016 10:32:10 +0000
Subject: Re: [PATCH 1/2] MTD: UBI: speed up init by moving status messages to
 debugfs
To: Rajeev Kumar <rajeev_kumar@mentor.com>, dwmw2@infradead.org,
 computersforpeace@gmail.com
References: <1469440019-29358-1-git-send-email-rajeev_kumar@mentor.com>
Cc: dedekind1@gmail.com, linux-mtd@lists.infradead.org, stable@vger.kernel.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <5795EA91.2030304@nod.at>
Date: Mon, 25 Jul 2016 12:31:45 +0200
MIME-Version: 1.0
In-Reply-To: <1469440019-29358-1-git-send-email-rajeev_kumar@mentor.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Rajeev,

Am 25.07.2016 um 11:46 schrieb Rajeev Kumar:
> This patch simply moves the verbose status messages associated with
> UBI's fastmap feature to debugfs, thereby decreasing UBI
> initialization time from 97 mS to 16 mS. Note that the first time
> fastmap is invoked, building the fastmap took 146 mS. In order to
> reproduce the test conditions, build with CONFIG_MTD_UBI_FASTMAP=y and
> CONFIG_DYNAMIC_DEBUG=y and append the following to bootargs:
> 
> initcall_debug ubi.mtd=0 ubi.fm_autoconvert=1
> 
> ubi.mtd=0 is needed at every boot if you want ubi to be
> autoloaded. ubi.fm_autoconvert switch is needed only once, when
> fastmap is created.

So, you're working on a system which has to boot as fast as possible
and writing kernel logs hurts the performance. (Slow UART?)
Why do you change logging only in UBI (Fastmap)? Many other subsystems
print during boot and would also hurt the performance.
In such a situation I'd assume that changing the kernel log level or
using the quiet kernel parameter would help more.

Thanks,
//richard
