Received: from mail.linuxfoundation.org ([140.211.169.12])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g4L9M-0008NI-Pm
 for linux-mtd@lists.infradead.org; Mon, 24 Sep 2018 07:19:22 +0000
Date: Mon, 24 Sep 2018 09:19:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Peter Rosin <peda@axentia.se>
Cc: Richard Weinberger <richard@nod.at>, linux-mtd@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [GIT PULL] UBIFS fixes for 4.19-rc4
Message-ID: <20180924071904.GB7871@kroah.com>
References: <2bdd37c6-17af-e216-d865-fad2c6ff6dae@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2bdd37c6-17af-e216-d865-fad2c6ff6dae@axentia.se>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Sep 24, 2018 at 09:11:55AM +0200, Peter Rosin wrote:
> I fredags, den 21 september 2018, 15:53:42 CEST skrev Greg KH:
> > On Fri, Sep 21, 2018 at 11:33:15AM +0200, Richard Weinberger wrote:
> >> Greg,
> >> 
> >> The following changes since commit ae596de1a0c8c2c924dc99d23c026259372ab234:
> >> 
> >>   Compiler Attributes: naked can be shared (2018-09-20 15:23:58 +0200)
> > 
> > Wow, bold move, new patches with less than 24 hours in your tree.  That
> > means linux-next didn't see them :(
> > 
> >> are available in the Git repository at:
> >> 
> >>   git://git.infradead.org/linux-ubifs.git tags/upstream-4.19-rc4
> > 
> > Now pulled, but really, don't you think that they should at least go
> > through 0-day first?  Maybe no one runs ubifs on mainline kernels...
> 
> FWIW, we do...

That's good to know.  I was just trying to say that patches asked to be
pulled in, less than 24 hours from when they were added to the
developer's tree, is usually a little "suspect" as they normally have
not had the chance to go through our "CI" systems.

That's all, I wasn't trying to disparage the UBIFS codebase at all :)

thanks,

greg k-h
