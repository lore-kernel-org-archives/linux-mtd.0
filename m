Received: from mga09.intel.com ([134.134.136.24])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V5H0x-0005ae-0t
 for linux-mtd@lists.infradead.org; Fri, 02 Aug 2013 15:11:35 +0000
Message-ID: <1375456553.14869.340.camel@sauron.fi.intel.com>
Subject: Re: [PATCH] mtd: remove obsolete JEDEC mapping drivers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Paul Bolle <pebolle@tiscali.nl>
Date: Fri, 02 Aug 2013 18:15:53 +0300
In-Reply-To: <1374749192.29835.48.camel@x61.thuisdomein>
References: <1368456039.1350.53.camel@x61.thuisdomein>
 <1374749192.29835.48.camel@x61.thuisdomein>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2013-07-25 at 12:46 +0200, Paul Bolle wrote:
> On Mon, 2013-05-13 at 16:40 +0200, Paul Bolle wrote:
> > JEDEC device support was removed in v2.6.22. (It had been marked as
> > BROKEN (indirectly) since at least v2.6.12.)
> > 
> > When it was removed the two JEDEC mapping drivers that depended on it
> > should have been removed too. Do so now.
> > 
> > Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
> > ---
> > 0) Untested.
> > 
> > 1) These two [seem] to have been missed in Artem's recent cleaning up
> > effort. Or is a comparable patch queued somewhere?
> 
> Did anyone had a chance to look at this patch? Or has this code already
> been removed?

Pushed to l2-mtd.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
