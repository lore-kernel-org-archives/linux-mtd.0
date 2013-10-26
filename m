Received: from mail-wi0-x230.google.com ([2a00:1450:400c:c05::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Va1DQ-0006Qb-Kz
 for linux-mtd@lists.infradead.org; Sat, 26 Oct 2013 10:35:33 +0000
Received: by mail-wi0-f176.google.com with SMTP id l12so2062170wiv.9
 for <linux-mtd@lists.infradead.org>; Sat, 26 Oct 2013 03:35:09 -0700 (PDT)
Message-ID: <1382783707.5901.27.camel@karhu.quadriga.com>
Subject: Re: [PATCH] ubifs: Correct data corruption range
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mats =?ISO-8859-1?Q?K=E4rrman?= <Mats.Karrman@tritech.se>
Date: Sat, 26 Oct 2013 11:35:07 +0100
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C4FCDE5DF@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C4FCDE5DF@post.tritech.se>
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

On Wed, 2013-08-21 at 13:24 +0000, Mats Kärrman wrote:
> With power-cut emulation, it is possible that sometimes no data at all is
> corrupted and that confusing messages are printed due to errors in the
> computation of data corruption range.
> 
> [1] The start of the range should be [0..len-1], not [0..len].
> [2] The end of the range should always be at least 1 greater than the start.
> 
> Signed-off-by: Mats Karrman <mats.karrman@tritech.se>

Picked to linux-ubifs.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
