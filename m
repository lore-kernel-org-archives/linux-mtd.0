Received: from mail-da0-x22d.google.com ([2607:f8b0:400e:c00::22d])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1URs02-0008JX-UE
 for linux-mtd@lists.infradead.org; Mon, 15 Apr 2013 22:35:47 +0000
Received: by mail-da0-f45.google.com with SMTP id v40so2283774dad.4
 for <linux-mtd@lists.infradead.org>; Mon, 15 Apr 2013 15:35:42 -0700 (PDT)
Date: Mon, 15 Apr 2013 15:35:32 -0700
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: [ 10/11] mtdchar: fix offset overflow detection
Message-ID: <20130415223532.GB10195@kroah.com>
References: <20130415020614.067692418@linuxfoundation.org>
 <20130415020614.846683113@linuxfoundation.org>
 <1366059320.3072.65.camel@shinybook.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1366059320.3072.65.camel@shinybook.infradead.org>
Cc: Brad Spengler <spender@grsecurity.net>,
 Suresh Siddha <suresh.b.siddha@intel.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, linux-mtd@lists.infradead.org,
 Ben Hutchings <ben@decadent.org.uk>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 15, 2013 at 09:55:20PM +0100, David Woodhouse wrote:
> On Sun, 2013-04-14 at 19:17 -0700, Greg Kroah-Hartman wrote:
> > 3.0-stable review patch.  If anyone has any objections, please let me know.
> 
> Please use f5cf8f07423b2677cebebcebc863af77223a4972 instead (for 3.4
> too).

Really?  I love the comment in that commit, "disable it for now until it
can be fixed properly in the next merge window."  Yet that was back in
October of last year, no one has actually fixed this issue, is that
because it can't be properly fixed, or just because no one got around to
it?

thanks,

greg k-h
