Received: from mga14.intel.com ([192.55.52.115])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XV1wu-0002fZ-TY
 for linux-mtd@lists.infradead.org; Fri, 19 Sep 2014 17:26:25 +0000
Message-ID: <1411147451.23429.20.camel@sauron.fi.intel.com>
Subject: Re: Does UBI LEB-level access interlock happily with UBIfs access?
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Atlant Schmidt <aschmidt@dekaresearch.com>
Date: Fri, 19 Sep 2014 20:24:11 +0300
In-Reply-To: <0A40042D85E7C84DB443060EC44B3FD36D986A301C@dekaexchange07.deka.local>
References: <0A40042D85E7C84DB443060EC44B3FD36D986A3009@dekaexchange07.deka.local>
 <1411140449.28850.152.camel@sauron.fi.intel.com>
 <0A40042D85E7C84DB443060EC44B3FD36D986A301A@dekaexchange07.deka.local>
 <1411146833.23429.11.camel@sauron.fi.intel.com>
 <0A40042D85E7C84DB443060EC44B3FD36D986A301C@dekaexchange07.deka.local>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-09-19 at 13:17 -0400, Atlant Schmidt wrote:
> But as I pointed, this will not force re-read of the volume table LEBs.
> To address this, you'd need to do some additional, not very difficult
> work.

Oh, and this won't make UBI re-read the EC and VID headers, so they may
bit-rot too.

So indeed it sounds like UBI needs a separate interface for this kind of
"scrub all bit-flips" issues. I do not think it is hard to do - all the
mechanisms are already implemented, so this would mostly be about
inventing good API.


-- 
Best Regards,
Artem Bityutskiy
