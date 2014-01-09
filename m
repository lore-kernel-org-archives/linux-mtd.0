Received: from mail-we0-x22e.google.com ([2a00:1450:400c:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W1Itv-0003Ec-W4
 for linux-mtd@lists.infradead.org; Thu, 09 Jan 2014 16:56:13 +0000
Received: by mail-we0-f174.google.com with SMTP id q58so3001072wes.19
 for <linux-mtd@lists.infradead.org>; Thu, 09 Jan 2014 08:55:49 -0800 (PST)
Date: Thu, 9 Jan 2014 08:55:41 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Jingoo Han <jg1.han@samsung.com>
Subject: Re: [PATCH 1/7] mtd: denali: Drop print of build date/time
Message-ID: <20140109165541.GD28655@norris-Latitude-E6410>
References: <cover.1387833347.git.josh@joshtriplett.org>
 <21175198efaf34a67e5108c1dae384656012b7a0.1387833347.git.josh@joshtriplett.org>
 <000801cf0213$f40bec50$dc23c4f0$%han@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <000801cf0213$f40bec50$dc23c4f0$%han@samsung.com>
Cc: linux-mtd@lists.infradead.org, 'David Woodhouse' <dwmw2@infradead.org>,
 'Josh Triplett' <josh@joshtriplett.org>, 'Dinh Nguyen' <dinguyen@altera.com>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Dec 26, 2013 at 05:24:53PM +0900, Jingoo Han wrote:
> On Tuesday, December 24, 2013 6:55 AM, Josh Triplett wrote:
> > 
> > The kernel already has this information, and individual drivers
> > shouldn't duplicate that.

BTW, it is possible for modules to be built at a different time than the
kernel, and this code could show that. But it's not very useful anyway,
so I agree.

> > This also eliminates the use of __DATE__ and
> > __TIME__, which make the build non-deterministic.
> > 
> > Signed-off-by: Josh Triplett <josh@joshtriplett.org>
> 
> (+cc Dinh Nguyen)
> 
> It looks good. :-)
> Reviewed-by: Jingoo Han <jg1.han@samsung.com>

Thanks. Pushed to l2-mtd.git.

Brian
