Received: from mail-iy0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1RkMtC-0007Bm-OA
 for linux-mtd@lists.infradead.org; Mon, 09 Jan 2012 21:36:23 +0000
Received: by iadk27 with SMTP id k27so8498953iad.36
 for <linux-mtd@lists.infradead.org>; Mon, 09 Jan 2012 13:36:20 -0800 (PST)
Subject: Re: [PATCH] pmc551: fix signedness bug in init_pmc551()
Mime-Version: 1.0 (Apple Message framework v1084)
Content-Type: text/plain; charset=us-ascii
From: Xi Wang <xi.wang@gmail.com>
In-Reply-To: <1326143161.4463.2.camel@koala>
Date: Mon, 9 Jan 2012 16:36:16 -0500
Content-Transfer-Encoding: 7bit
Message-Id: <92F55019-7C72-4024-A377-3583230E47DA@gmail.com>
References: <1325019256-5171-1-git-send-email-xi.wang@gmail.com>
 <1326143161.4463.2.camel@koala>
To: dedekind1@gmail.com
Cc: Lucas De Marchi <lucas.demarchi@profusion.mobi>,
 linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Jan 9, 2012, at 4:05 PM, Artem Bityutskiy wrote:
> You can just change the type to int without introducing a separate
> argument. I think the length cannot be too large anyway. E.g., because
> it is compared to "asize" which is int.

That would work too.  Will do a v2.  Thanks.

- xi
