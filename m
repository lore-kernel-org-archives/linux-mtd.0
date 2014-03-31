Received: from mga01.intel.com ([192.55.52.88])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WUYo6-00039Q-OW
 for linux-mtd@lists.infradead.org; Mon, 31 Mar 2014 09:47:07 +0000
Message-ID: <1396259200.9016.59.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] UBI: Fix potential NULL-pointer dereference
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mats =?ISO-8859-1?Q?K=E4rrman?= <Mats.Karrman@tritech.se>
Date: Mon, 31 Mar 2014 12:46:40 +0300
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B3A869F@post.tritech.se>
References: <1396040689-12419-1-git-send-email-alexanders83@web.de>
 <ED3E0BCACD909541BA94A34C4A164D4C5B3A869F@post.tritech.se>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Alexander Stein <alexanders83@web.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2014-03-31 at 06:18 +0000, Mats Kärrman wrote:
> On Friday, March 28, 2014 10:04 PM, Alexander Stein wrote:
> >
> > It's no use to debug print a string before checking on NULL.
> >
> 
> If the string is NULL, that could be very useful to know when debugging and
> the print function should handle that gracefully, i.e. by not printing anything
> for %s.

%s will just result in (null), I do not see any issue with this.

-- 
Best Regards,
Artem Bityutskiy
