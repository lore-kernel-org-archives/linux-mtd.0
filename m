Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xu1xR-0003sP-4r
 for linux-mtd@lists.infradead.org; Thu, 27 Nov 2014 16:30:17 +0000
Message-ID: <1417105793.5858.117.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 3/6] UBI: Fastmap: Ensure that all fastmap work is done
 upon WL shutdown
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Thu, 27 Nov 2014 18:29:53 +0200
In-Reply-To: <54774C71.50807@nod.at>
References: <1416835236-25185-1-git-send-email-richard@nod.at>
 <1416835236-25185-4-git-send-email-richard@nod.at>
 <1417102739.5858.112.camel@sauron.fi.intel.com> <54774C71.50807@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-11-27 at 17:08 +0100, Richard Weinberger wrote:
> > Obviously, there is some misunderstanding. This looks like lack of
> > separation and misuse of layering. I am missing explanations why I am
> > wrong...
> 
> So you want me to use the UBI WL background thread for the scheduled fastmap work?

No. It is more like either use it or do not use it.

> I didn't do it that way because you said more than once that fastmap is fastmap and
> WL is WL. Therefore I've separated it.

And "separated" meaning adding this code to wl.c?

+#ifdef CONFIG_MTD_UBI_FASTMAP
+       flush_work(&ubi->fm_work);
+#endif

Could it be separated some more then?
