Received: from mail-qc0-x236.google.com ([2607:f8b0:400d:c01::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y9ImJ-0007mm-Rj
 for linux-mtd@lists.infradead.org; Thu, 08 Jan 2015 19:29:56 +0000
Received: by mail-qc0-f182.google.com with SMTP id r5so4086618qcx.13
 for <linux-mtd@lists.infradead.org>; Thu, 08 Jan 2015 11:29:32 -0800 (PST)
Date: Thu, 8 Jan 2015 11:29:28 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Daniel Ehrenberg <dehrenberg@google.com>
Subject: Re: WP# line on flash chip?
Message-ID: <20150108192928.GU9759@ld-irv-0074>
References: <CALupW3AMWWs57nKEy1OsP_3ZLLH_US1ZPua+s8-qOWLVcnRd_g@mail.gmail.com>
 <CAAK6Zt3kirnghmg2ghP+U1hru-Muim90=yYDGmY+YSincmEKAQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAAK6Zt3kirnghmg2ghP+U1hru-Muim90=yYDGmY+YSincmEKAQ@mail.gmail.com>
Cc: Steve deRosier <derosier@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Jan 08, 2015 at 11:00:03AM -0800, Daniel Ehrenberg wrote:
> In fact, the kernel
> can't drive it appropriately because the important time to hold it low
> is before the kernel is up (or actually it can go low sooner than
> that),

That's not true. It's also helpful to have it low during a power cut
scenario, which theoretically can occur at any time.

> and by the time the kernel is up, it's fine to have it high all
> the time.

As Steve quoted Micron, it's good to keep WP asserted when you're not
writing to the flash.

Brian
