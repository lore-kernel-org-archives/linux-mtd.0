Received: from mga11.intel.com ([192.55.52.93])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpaCb-0007ib-90
 for linux-mtd@lists.infradead.org; Wed, 28 May 2014 09:31:18 +0000
Message-ID: <1401269453.2118.5.camel@sauron.fi.intel.com>
Subject: Re: [PATCH v2] mtd-utils: integck: add support for volume specific
 power-cut test
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mats =?ISO-8859-1?Q?K=E4rrman?= <Mats.Karrman@tritech.se>
Date: Wed, 28 May 2014 12:30:53 +0300
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B4094CF@post.tritech.se>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B401901@post.tritech.se>
 ,<1401194249.1304.140.camel@sauron.fi.intel.com>
 <ED3E0BCACD909541BA94A34C4A164D4C5B4091B2@post.tritech.se>
 ,<1401202545.1304.164.camel@sauron.fi.intel.com>
 <ED3E0BCACD909541BA94A34C4A164D4C5B4094CF@post.tritech.se>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-05-28 at 08:40 +0000, Mats Kärrman wrote:
> On Tuesday, May 27, 2014 4:55 PM, Artem Bityutskiy wrote:
> > How about this compromise solution which should be simple enough to
> > implement, but I am not sure it is good enough to you.
> > 
> > Change -p so that it takes an _argument_. The argument should be a path
> > to the debugfs file which controls the power cuts emulation. This can be
> > either global or the per-FS switch.
> > 
> > All the test will do is writing '1' to this file as soon as it starts,
> > and as soon as it mounts or re-mounts the FS.
> > 
> > Now, it is your choice which file path to give - the global or the
> > per-FS.
> 
> I guess you mean something in the line of
> http://comments.gmane.org/gmane.linux.drivers.mtd/47872

Yes, but without introducing a new option, but just changing the old one
and add the path argument there.

-- 
Best Regards,
Artem Bityutskiy
