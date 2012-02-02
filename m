Received: from [2002:4e20:1eda::1] (helo=caramon.arm.linux.org.uk)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rt3A5-0006dA-S3
 for linux-mtd@lists.infradead.org; Thu, 02 Feb 2012 20:21:43 +0000
Date: Thu, 2 Feb 2012 20:21:13 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
To: "Rafael J. Wysocki" <rjw@sisk.pl>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: [PATCH RFC 2/2] mtd : Make the mtd_suspend return 0 if the
 suspend is not implemented
Message-ID: <20120202202113.GA17309@n2100.arm.linux.org.uk>
References: <1327306361-9803-1-git-send-email-shubhrajyoti@ti.com>
 <201201302358.26152.rjw@sisk.pl>
 <1328183022.28171.165.camel@sauron.fi.intel.com>
 <201202021940.26552.rjw@sisk.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201202021940.26552.rjw@sisk.pl>
Sender: Russell King - ARM Linux <linux@arm.linux.org.uk>
Cc: Brian Norris <computersforpeace@gmail.com>, dedekind1@gmail.com,
 linux-mtd@lists.infradead.org, linux-omap@vger.kernel.org,
 Shubhrajyoti D <shubhrajyoti@ti.com>, linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Feb 02, 2012 at 07:40:26PM +0100, Rafael J. Wysocki wrote:
> On Thursday, February 02, 2012, Artem Bityutskiy wrote:
> > On Mon, 2012-01-30 at 23:58 +0100, Rafael J. Wysocki wrote:
> > > Thanks, but is anyone actually going to push it to Linus any time soon?
> > 
> > I agree, but I am not the maintainer so cannot answer. David Woodhouse
> > is aware of this, but I do not know when he gonna send the pull request.
> 
> Well, the problem is being reported by more and more people, so I'd
> like to push the fix quickly.
> 
> David, please let me know if you don't want me to include the $subject patch
> into the next PM fixes pull request.  If I don't hear from you, I'll push it
> next week for -rc4.

I too have it in my tree as a patch which Artem sent me, as it's rather
fundamental to not oopsing the kernel when you suspend/resume on any ARM
platform.
