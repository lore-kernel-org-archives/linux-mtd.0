Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VBR7K-0000w9-I0
 for linux-mtd@lists.infradead.org; Mon, 19 Aug 2013 15:11:39 +0000
Message-ID: <1376925394.2089.491.camel@sauron.fi.intel.com>
Subject: Re: [RFC] mtd-utils: integck: add support for volume specific
 power-cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mats =?ISO-8859-1?Q?K=E4rrman?= <Mats.Karrman@tritech.se>
Date: Mon, 19 Aug 2013 18:16:34 +0300
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4FCDC729@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4FCDC571@post.tritech.se>
 ,<1376919409.2089.463.camel@sauron.fi.intel.com>
 <ED3E0BCACD909541BA94A34C4A164D4C4FCDC6D3@post.tritech.se>
 <1376923842.2089.480.camel@sauron.fi.intel.com>
 ,<1376924118.2089.482.camel@sauron.fi.intel.com>
 <ED3E0BCACD909541BA94A34C4A164D4C4FCDC729@post.tritech.se>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2013-08-19 at 15:01 +0000, Mats Kärrman wrote:
> Actually this was what I first had in mind, but I stopped for the -P solution
> for two reasons:
> 1) It saved me a lot of time ;)
> 2) Integck seem to be written with the aim of being a general purpose test
> program (even if some comments in the code hint in another direction). If
> so, it would not be safe to assume there is any ubifs/ubi folder or that the
> knob file is called tst_recovery.

OK, but there is also an "fstype" field, could you use and do the trick
only for UBIFS?

>  Also it is possible to mount the debugfs
> anywhere (but i guess that could also be parsed from /proc/mounts).

I would not worry about this and I'd assume "/sys/kernel/debug" now, I
think this is more than good enough.

-- 
Best Regards,
Artem Bityutskiy
