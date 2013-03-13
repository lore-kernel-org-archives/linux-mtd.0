Received: from mga11.intel.com ([192.55.52.93])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UFjse-0001eX-2i
 for linux-mtd@lists.infradead.org; Wed, 13 Mar 2013 11:30:00 +0000
Message-ID: <1363174231.11441.26.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 1/2] mtd: doc: remove support for DoC 2000/2001/2001+
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Magnus Damm <magnus.damm@gmail.com>
Date: Wed, 13 Mar 2013 13:30:31 +0200
In-Reply-To: <1363172833.32099.345.camel@i7.infradead.org>
References: <1362560099-19638-1-git-send-email-dedekind1@gmail.com>
 <1363172645.11441.17.camel@sauron.fi.intel.com>
 <1363172833.32099.345.camel@i7.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: David Woodhouse <dwmw2@infradead.org>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2013-03-13 at 11:07 +0000, David Woodhouse wrote:
> On Wed, 2013-03-13 at 13:04 +0200, Artem Bityutskiy wrote:
> > On Wed, 2013-03-06 at 10:54 +0200, Artem Bityutskiy wrote:
> > > From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> > > 
> > > These drivers are deprecated for very long time, and we have a different driver
> > > for these called "diskonchip". Thus, kill the ancient cruft.
> > > 
> > > Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
> > 
> > Hi Magnus, I am removing the ancient pre-NAND DoC drivers. Dwmw2 wanted
> > me to check with you as well. Thanks!
> > 
> > http://thread.gmane.org/gmane.linux.drivers.mtd/45773
> 
> Er, I suggested checking with Magnus about removing Renesas AG-AND
> support, because none of it ever seems to have been seen in the wild...

Oh, sorry. Magnus, I am removing the AG-AND support. If you have
comments, please, rise your voice!

-- 
Best Regards,
Artem Bityutskiy
