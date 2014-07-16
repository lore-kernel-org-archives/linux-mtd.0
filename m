Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7N5I-0000bc-6g
 for linux-mtd@lists.infradead.org; Wed, 16 Jul 2014 11:09:16 +0000
Message-ID: <1405508933.1906.29.camel@sauron.fi.intel.com>
Subject: Re: ubifs issue about xattr node when replay journal
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: =?UTF-8?Q?=E7=8E=8B=E4=B8=81?= <walklook@gmail.com>
Date: Wed, 16 Jul 2014 14:08:53 +0300
In-Reply-To: <CAEGnBBSC=k5kkQYkLn37Q8KLLC+n43KiNr9ZZ-8NPJaGkGf0Qg@mail.gmail.com>
References: <CAEGnBBSC=k5kkQYkLn37Q8KLLC+n43KiNr9ZZ-8NPJaGkGf0Qg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2014-07-12 at 21:36 +0800, 王丁 wrote:
> -------- kernel 3.10 log --------
> [   64.916532] UBIFS: background thread "ubifs_bgt0_16" started, PID 92
> [   64.926411] UBIFS: recovery needed
> [   65.013786] UBIFS error (pid 91): ubifs_read_node: bad node type
> (255 but expected 3)
> [   65.021595] UBIFS error (pid 91): ubifs_read_node: bad node at LEB
> 88:39680, LEB mapping status 1
> [   65.030431] Not a node, first 24 bytes:
> [   65.034073] 00000000: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
> ff ff ff ff ff ff ff ff ff

There was a similar report recently (but not about xattr) and I suspect
"fastmap". Please, check if you use it - it is new and I did not see any
report that it was extensively tested WRT power cuts.

-- 
Best Regards,
Artem Bityutskiy
