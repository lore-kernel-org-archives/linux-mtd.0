Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WkAG2-0001X0-IC
 for linux-mtd@lists.infradead.org; Tue, 13 May 2014 10:48:26 +0000
Message-ID: <1399978082.1797.30.camel@sauron.fi.intel.com>
Subject: Re: [RFC PATCH] UBI: fix rb_tree node comparison in add_map
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Snitzer <snitzer@redhat.com>
Date: Tue, 13 May 2014 13:48:02 +0300
In-Reply-To: <20140321195403.GA32529@redhat.com>
References: <20140321195403.GA32529@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
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

On Fri, 2014-03-21 at 15:54 -0400, Mike Snitzer wrote:
> The comparisons used in add_vol() shouldn't be identical.  Pretty sure
> the following is correct but it is completely untested.
> 
> Signed-off-by: Mike Snitzer <snitzer@redhat.com>

Pushed to linux-ubifs.git, thanks!

-- 
Best Regards,
Artem Bityutskiy
