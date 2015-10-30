Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zs8on-0002lm-FL
 for linux-mtd@lists.infradead.org; Fri, 30 Oct 2015 12:30:06 +0000
Message-ID: <1446208181.6126.79.camel@gmail.com>
Subject: Re: UBI/UBIFS: dealing with MLC's paired pages
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>, Boris Brezillon
 <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>, Andrea Scian
 <rnd4@dave-tech.it>, Iwo Mergler <Iwo.Mergler@netcommwireless.com>, "Jeff
 Lauruhn (jlauruhn)" <jlauruhn@micron.com>, Bean Huo
 =?UTF-8?Q?=E9=9C=8D=E6=96=8C=E6=96=8C?= "\"\"(beanhuo)\"\""
 <beanhuo@micron.com>
Date: Fri, 30 Oct 2015 14:29:41 +0200
In-Reply-To: <56335BB7.1020403@nod.at>
References: <20150917152240.757c9e90@bbrezillon>
 <20151023101406.6d1490e5@bbrezillon> <1446035085.12536.71.camel@gmail.com>
 <20151030091521.439f436b@bbrezillon> <1446196090.6126.48.camel@gmail.com>
 <20151030104537.2196c4a8@bbrezillon> <1446205395.6126.69.camel@gmail.com>
 <56335BB7.1020403@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2015-10-30 at 12:59 +0100, Richard Weinberger wrote:
> That is a valid concern.
> But to me the idea sounds promising and is worth a try.
> We will stress test it and figure how much the actual overhead is.

Well, for me the question of "do we double-write or try to do a better
job" is more of a fundamental question, not a concern.

Right now I personally do not share the opinion that doing a better job
is hard, and double write is easy. I may be wrong though. So for me it
does not look like - "hey, we'll just write twice, it is worth a try"
is a good starting point.

And then "hey, we did not try to do a better job, so we write twice,
let's have this upstream" is a strong position.
