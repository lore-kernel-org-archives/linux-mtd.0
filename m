Received: from mga03.intel.com ([134.134.136.65])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XoX6W-0007qD-Iy
 for linux-mtd@lists.infradead.org; Wed, 12 Nov 2014 12:32:57 +0000
Message-ID: <1415795552.22887.247.camel@sauron.fi.intel.com>
Subject: Re: [PATCH V6] UBI: Extend UBI layer debug/messaging capabilities
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Wed, 12 Nov 2014 14:32:32 +0200
In-Reply-To: <54626835.40503@nod.at>
References: <1415023112-21704-1-git-send-email-tlinder@codeaurora.org>
 <5460F7D8.2030100@nod.at> <5461C5AD.5040705@nod.at>
 <1415707434.22887.158.camel@sauron.fi.intel.com> <5462003C.9090509@nod.at>
 <1415712477.22887.172.camel@sauron.fi.intel.com> <54626835.40503@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Tanya Brokhman <tlinder@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, linux-mtd@lists.infradead.org,
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

On Tue, 2014-11-11 at 20:49 +0100, Richard Weinberger wrote:
> > I am OK with removing function names from warnings and errors, though.
> > But they were there since the very beginning, and changing this is a
> > separate subject, so I'd prefer someone else to submit a corresponding
> > patch.
> 
> If we keep the function names away from ubi_msg() I'm perfectly fine. :-)

OK, I'm pushing the patch I sent.
