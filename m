Received: from mga09.intel.com ([134.134.136.24])
 by casper.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1S5uSD-0005p7-7k
 for linux-mtd@lists.infradead.org; Fri, 09 Mar 2012 07:41:34 +0000
Message-ID: <1331279023.22872.20.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] UBI: fix documentation and improve readability
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Date: Fri, 09 Mar 2012 09:43:43 +0200
In-Reply-To: <20120308175722.19211186@halley>
References: <1331216491-6728-1-git-send-email-dedekind1@gmail.com>
 <20120308175722.19211186@halley>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: MTD Maling List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2012-03-08 at 17:57 +0200, Shmulik Ladkani wrote:
> On Thu,  8 Mar 2012 16:21:30 +0200 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> > From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> > 
> > The "max" parameter of 'find_wl_entry()' was documented incorrectly and
> > it actually means the maximum possible difference from th smallest erase
> 
> s/ th / the /

Fixed, thanks!

-- 
Best Regards,
Artem Bityutskiy
