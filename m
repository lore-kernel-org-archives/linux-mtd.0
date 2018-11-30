Received: from shards.monkeyblade.net ([2620:137:e000::1:9])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gSqd4-0002Lx-Bg
 for linux-mtd@lists.infradead.org; Fri, 30 Nov 2018 21:47:19 +0000
Date: Fri, 30 Nov 2018 13:47:03 -0800 (PST)
Message-Id: <20181130.134703.1703684498402097596.davem@davemloft.net>
To: jarkko.sakkinen@linux.intel.com
Cc: axboe@kernel.dk, dave@stgolabs.net, keescook@chromium.org,
 linux-kernel@vger.kernel.org, amir73il@gmail.com,
 akpm@linux-foundation.org, andriy.shevchenko@linux.intel.com,
 dja@axtens.net, linux@dominikbrodowski.net,
 dri-devel@lists.freedesktop.org, edumazet@google.com,
 federico.vaga@vaga.pv.it, geert+renesas@glider.be, deller@gmx.de,
 corbet@lwn.net, kumba@gentoo.org, linux-doc@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ide@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-media@vger.kernel.org,
 linux-mips@linux-mips.org, linux-mtd@lists.infradead.org,
 linux-parisc@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-scsi@vger.kernel.org, matthias.bgg@gmail.com,
 netdev@vger.kernel.org, nouveau@lists.freedesktop.org, pabeni@redhat.com,
 paul.burton@mips.com, pmladek@suse.com, robh@kernel.org,
 sean.wang@mediatek.com, sergey.senozhatsky@gmail.com,
 shannon.nelson@oracle.com, sbrivio@redhat.com, rostedt@goodmis.org,
 me@tobin.cc, makita.toshiaki@lab.ntt.co.jp, willemb@google.com,
 yhs@fb.com, yanjun.zhu@oracle.com
Subject: Re: [PATCH RFC 00/15] Zero ****s, hugload of hugs <3
From: David Miller <davem@davemloft.net>
In-Reply-To: <20181130214233.GF23772@linux.intel.com>
References: <d7c34289-f03a-b641-cc9c-00395306511d@kernel.dk>
 <20181130.123507.1940310466680455876.davem@davemloft.net>
 <20181130214233.GF23772@linux.intel.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

From: Jarkko Sakkinen <jarkko.sakkinen@linux.intel.com>
Date: Fri, 30 Nov 2018 13:42:33 -0800

> Can you tell how the CoC should be interpreted then?

Regardless of what I think, as others have showen the CoC explicitly
does not apply to existing code.
