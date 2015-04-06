Received: from mail-pa0-x22b.google.com ([2607:f8b0:400e:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YevUV-0002yz-8L
 for linux-mtd@lists.infradead.org; Mon, 06 Apr 2015 01:06:16 +0000
Received: by patj18 with SMTP id j18so28593201pat.2
 for <linux-mtd@lists.infradead.org>; Sun, 05 Apr 2015 18:05:53 -0700 (PDT)
Date: Sun, 5 Apr 2015 18:05:50 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Nicholas Mc Guire <hofrat@osadl.org>
Subject: Re: [PATCH] mtd: fsl_ifc_nand: use msecs_to_jiffies for time
 conversion
Message-ID: <20150406010550.GI2677@norris-Latitude-E6410>
References: <1426245828-15640-1-git-send-email-hofrat@osadl.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1426245828-15640-1-git-send-email-hofrat@osadl.org>
Cc: Wolfram Sang <wsa@the-dreams.de>, linux-kernel@vger.kernel.org,
 Joe Schultz <jschultz@xes-inc.com>, linux-mtd@lists.infradead.org,
 Aaron Sierra <asierra@xes-inc.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Mar 13, 2015 at 07:23:47AM -0400, Nicholas Mc Guire wrote:
> This is only an API consolidation and should make things more readable
> it replaces var * HZ / 1000 by msecs_to_jiffies(var) which helps readability
> and also handles all corner-cases properly.
> 
> Signed-off-by: Nicholas Mc Guire <hofrat@osadl.org>

Pushed to l2-mtd.git.

I'm not sure the objections about an extra function call are important
right now; if they are, then it shouldn't be too hard to patch in a
__builtin_constant_p() variant of msecs_to_jiffies(), as Joe suggested.

Brian
