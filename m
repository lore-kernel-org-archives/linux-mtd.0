Received: from smtprelay0015.hostedemail.com ([216.40.44.15]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xe7rQ-0006o1-AC
 for linux-mtd@lists.infradead.org; Tue, 14 Oct 2014 19:34:20 +0000
Message-ID: <1413315062.10221.1.camel@joe-AO725>
Subject: Re: [PATCH v4] mtd: ubi: Extend UBI layer debug/messaging capabilities
From: Joe Perches <joe@perches.com>
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
In-Reply-To: <20141014191815.GB12662@arch.hh.imgtec.org>
References: <1413296037-22346-1-git-send-email-tlinder@codeaurora.org>
 <20141014143902.GA9768@arch.hh.imgtec.org>
 <1413299343.7906.103.camel@sauron.fi.intel.com>
 <20141014184702.GA12662@arch.hh.imgtec.org>
 <1413314020.26864.7.camel@joe-AO725>
 <20141014191815.GB12662@arch.hh.imgtec.org>
Content-Type: text/plain; charset="ISO-8859-1"
Date: Tue, 14 Oct 2014 12:31:02 -0700
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Tanya Brokhman <tlinder@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 Artem Bityutskiy <dedekind1@gmail.com>,
 open list <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
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

On Tue, 2014-10-14 at 16:18 -0300, Ezequiel Garcia wrote:
> On 14 Oct 12:13 PM, Joe Perches wrote:
> > On Tue, 2014-10-14 at 15:47 -0300, Ezequiel Garcia wrote:
[]
> > > When the gendisk is not available, a simple pr_{} would work.
> > 
> > Or maybe combine these in the ubi_<level> calls passing
> > NULL when there is no struct ubi_device *
[]
> Isn't this excessive obfuscation? What's the benefit of it?

Single error message type.
