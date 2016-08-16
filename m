Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bZYsp-0002vC-LE
 for linux-mtd@lists.infradead.org; Tue, 16 Aug 2016 07:34:02 +0000
Date: Tue, 16 Aug 2016 09:33:36 +0200
From: Vincent =?iso-8859-1?Q?Stehl=E9?= <vincent.stehle@intel.com>
To: Richard Weinberger <richard.weinberger@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LKML <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
Subject: Re: [PATCH] UBIFS: fix assertion in layout_in_gaps()
Message-ID: <20160816073336.GA24318@jazz.nc.intel.com>
References: <1471008390-19227-1-git-send-email-vincent.stehle@intel.com>
 <CAFLxGvwqvLpUUzqc_5=iTB03NdU_mYvrmPqRjTZ6O-x+mzTTeA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFLxGvwqvLpUUzqc_5=iTB03NdU_mYvrmPqRjTZ6O-x+mzTTeA@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Aug 14, 2016 at 11:00:33AM +0200, Richard Weinberger wrote:
..
> Good catch! Did you hit this assertion or was it found by review?
> I bet the latter since it is here since ever and given the wrongness
> it is unlikely to trigger.

Dear Richard,

It was found with a static checker and later review to confirm.

Best regards,

Vincent.
