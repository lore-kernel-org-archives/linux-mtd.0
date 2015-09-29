Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zh1WU-0001O4-R4
 for linux-mtd@lists.infradead.org; Tue, 29 Sep 2015 20:29:15 +0000
Received: by pablk4 with SMTP id lk4so15350034pab.3
 for <linux-mtd@lists.infradead.org>; Tue, 29 Sep 2015 13:28:54 -0700 (PDT)
Date: Tue, 29 Sep 2015 13:28:52 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Josh Cartwright <joshc@ni.com>
Cc: Cai Zhiyong <caizhiyong@huawei.com>, dwmw2@infradead.org,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mtd: cmdlinepart: allow fill-up partition at any point
Message-ID: <20150929202852.GM31505@google.com>
References: <1431053861-32284-1-git-send-email-ben.shelton@ni.com>
 <20150929195539.GF31505@google.com>
 <20150929200045.GH31505@google.com>
 <20150929201835.GN26335@jcartwri.amer.corp.natinst.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20150929201835.GN26335@jcartwri.amer.corp.natinst.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Sep 29, 2015 at 03:18:35PM -0500, Josh Cartwright wrote:
> On Tue, Sep 29, 2015 at 01:00:45PM -0700, Brian Norris wrote:
> > On Tue, Sep 29, 2015 at 12:55:39PM -0700, Brian Norris wrote:
> > 
> > ...
> > 
> > Seems Ben Shelton has moved on to other things...
> 
> He has, but there are others paying attention who want this feature :).

Ok, great. Let me know if you have any questions/comments about my
review then.
