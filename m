Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XgDOz-0003Yk-RS
 for linux-mtd@lists.infradead.org; Mon, 20 Oct 2014 13:53:38 +0000
Message-ID: <1413813193.7906.295.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v4] mtd: ubi: Extend UBI layer debug/messaging capabilities
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Joe Perches <joe@perches.com>
Date: Mon, 20 Oct 2014 16:53:13 +0300
In-Reply-To: <1413315062.10221.1.camel@joe-AO725>
References: <1413296037-22346-1-git-send-email-tlinder@codeaurora.org>
 <20141014143902.GA9768@arch.hh.imgtec.org>
 <1413299343.7906.103.camel@sauron.fi.intel.com>
 <20141014184702.GA12662@arch.hh.imgtec.org>
 <1413314020.26864.7.camel@joe-AO725>
 <20141014191815.GB12662@arch.hh.imgtec.org>
 <1413315062.10221.1.camel@joe-AO725>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Tanya Brokhman <tlinder@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Richard Weinberger <richard@nod.at>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2014-10-14 at 12:31 -0700, Joe Perches wrote:
> On Tue, 2014-10-14 at 16:18 -0300, Ezequiel Garcia wrote:
> > On 14 Oct 12:13 PM, Joe Perches wrote:
> > > On Tue, 2014-10-14 at 15:47 -0300, Ezequiel Garcia wrote:
> []
> > > > When the gendisk is not available, a simple pr_{} would work.
> > > 
> > > Or maybe combine these in the ubi_<level> calls passing
> > > NULL when there is no struct ubi_device *
> []
> > Isn't this excessive obfuscation? What's the benefit of it?
> 
> Single error message type.

Well, these are 2 separate drivers just living in the same folder, so
they do not have to have to share message functions.

Artem.
