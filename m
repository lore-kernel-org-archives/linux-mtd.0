Received: from mail-pd0-x233.google.com ([2607:f8b0:400e:c02::233])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XA7sk-0000tr-CZ
 for linux-mtd@lists.infradead.org; Thu, 24 Jul 2014 01:31:42 +0000
Received: by mail-pd0-f179.google.com with SMTP id ft15so2560138pdb.24
 for <linux-mtd@lists.infradead.org>; Wed, 23 Jul 2014 18:31:18 -0700 (PDT)
Date: Wed, 23 Jul 2014 18:31:15 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: bpqw <bpqw@micron.com>
Subject: Re: Subject: [PATCH 1/1] mtd:nand:fix nand_lock/unlock() function
Message-ID: <20140724013115.GB3711@ld-irv-0074>
References: <CB9F11E856CFD04BB18EC1C68F2598931B1112@NTXXIAMBX01.xacn.micron.com>
 <20140724012730.GA3711@ld-irv-0074>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140724012730.GA3711@ld-irv-0074>
Cc: "ron@debian.org" <ron@debian.org>,
 "artem.bityutskiy@linux.intel.com" <artem.bityutskiy@linux.intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "b32955@freescale.com" <b32955@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ezequiel.garcia@free-electrons.com" <ezequiel.garcia@free-electrons.com>,
 "u.kleine-koenig@pengutronix.de" <u.kleine-koenig@pengutronix.de>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 23, 2014 at 06:27:30PM -0700, Brian Norris wrote:
> Hi White,
> 
> On Thu, Jul 24, 2014 at 01:00:01AM +0000, bpqw wrote:
[...]

And...I just got a rejection email from micron.com:

  The error that the other server returned was:
  550 5.1.1 <bpqw@micron.com>... <bpqw@micron.com>... User unknown

I'm not sure how to get a reply to the submitter now. Perhaps he reads
LKML.

Brian
