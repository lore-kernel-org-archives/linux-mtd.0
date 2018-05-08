Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fG6Y1-0007r8-2M
 for linux-mtd@lists.infradead.org; Tue, 08 May 2018 17:37:09 +0000
Date: Tue, 8 May 2018 17:36:49 +0000
From: "Luis R. Rodriguez" <mcgrof@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Mauro Carvalho Chehab <mchehab@infradead.org>,
 linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-fbdev@vger.kernel.org,
 linux-can@vger.kernel.org, "Luis R. Rodriguez" <mcgrof@kernel.org>,
 linux-iio@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-crypto@vger.kernel.org,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org
Subject: Re: [PATCH 00/18] Fix some build warnings/errors with Sphinx
Message-ID: <20180508173649.GH27853@wotan.suse.de>
References: <cover.1525684985.git.mchehab+samsung@kernel.org>
 <20180508101342.2bde20ea@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180508101342.2bde20ea@lwn.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 08, 2018 at 10:13:42AM -0600, Jonathan Corbet wrote:
> On Mon,  7 May 2018 06:35:36 -0300
> Mauro Carvalho Chehab <mchehab+samsung@kernel.org> wrote:
> 
> > I decided to give a try with Sphinx last stable version
> > (1.17.4), and noticed several issues. The worse one was
> > with the networking book: a non-standard footnote there
> > with [*] instead of a number causes it to break PDF building.
> > 
> > So, I took some spare time to address some warnings all over
> > the tree, and moved a few text documents to a book. 
> 
> OK, I've applied the ones that seem to make sense for me to take now.
> There's comments on the firmware one, 

I'll fold in the fixes for the firmware API which do apply to my queue.

  Luis
