Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5udz-00038n-9P
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 07:53:44 +0000
Message-ID: <1331279761.22872.24.camel@sauron.fi.intel.com>
Subject: Re: UBIFS kernel oops
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Nigel Hathaway <nigel.hathaway@node-h.com>
Date: Fri, 09 Mar 2012 09:56:01 +0200
In-Reply-To: <000201ccf2d8$3cb7adb0$b6270910$@node-h.com>
References: <000201ccf2d8$3cb7adb0$b6270910$@node-h.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2012-02-24 at 09:39 +0000, Nigel Hathaway wrote:
> Code: 7c420400  1040000c  00000000 <c0820010> 14400005  00000000  00600821
> e0810010  102000b0
> Disabling lock debugging due to kernel taint
> 
> The kernel version is 3.6.31.12 with real-time extensions (patches) compiled
> with "mips-linux-gnu-gcc (Sourcery G++ Lite 4.4-303) 4.4.1"
> 
> We have seen this posted before here:
> 
> http://lists.infradead.org/pipermail/linux-mtd/2011-December/038852.html
> 
> For us, UBIFS is not read-only. Any ideas what could be causing this and/or
> whether such an issue has been fixed in later kernels?

May be someone corrupting memory, dunno :-( I guess this needs some
hardcore debugging...

-- 
Best Regards,
Artem Bityutskiy
