Received: from mga02.intel.com ([134.134.136.20])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xu2Gl-0004QX-TI
 for linux-mtd@lists.infradead.org; Thu, 27 Nov 2014 16:50:17 +0000
Message-ID: <1417106992.5858.135.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 2/6] UBI: Fastmap: Ensure that only one fastmap work is
 scheduled
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Thu, 27 Nov 2014 18:49:52 +0200
In-Reply-To: <547753C0.6050604@nod.at>
References: <1416835236-25185-1-git-send-email-richard@nod.at>
 <1416835236-25185-3-git-send-email-richard@nod.at>
 <1417102042.5858.102.camel@sauron.fi.intel.com> <54774DB7.5090200@nod.at>
 <1417106151.5858.122.camel@sauron.fi.intel.com> <547753C0.6050604@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2014-11-27 at 17:39 +0100, Richard Weinberger wrote:
> > So the background thread would first check this flag, and if it is set -
> > call the fastmap stuff. The go do the WL works.
> > 
> > Just off-the top of my head, take with grain of salt.
> 
> So you want me to redesign it?
> IMHO this is just a matter of taste.
> 
> Face it, my brain does not work like yours. I design things differently.

OK.
