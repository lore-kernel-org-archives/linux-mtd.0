Received: from www.church-of-our-saviour.org ([69.25.196.31]
	helo=thunker.thunk.org)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1L0lI8-0006Jp-RV
	for linux-mtd@lists.infradead.org; Thu, 13 Nov 2008 23:08:01 +0000
Date: Thu, 13 Nov 2008 18:07:17 -0500
From: Theodore Tso <tytso@mit.edu>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] filesystems: use has_capability_noaudit interface for
	reserved blocks checks
Message-ID: <20081113230717.GA25117@mit.edu>
References: <1226430769.3353.5.camel@localhost.localdomain>
	<20081113145316.e53858bd.akpm@linux-foundation.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20081113145316.e53858bd.akpm@linux-foundation.org>
Cc: adilger@sun.com, dushistov@mail.ru, ext-adrian.hunter@nokia.com,
	sct@redhat.com, linux-kernel@vger.kernel.org,
	Eric Paris <eparis@redhat.com>, jmorris@namei.org,
	linux-mtd@lists.infradead.org, linux-ext4@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Nov 13, 2008 at 02:53:16PM -0800, Andrew Morton wrote:
> On Tue, 11 Nov 2008 14:12:49 -0500
> Eric Paris <eparis@redhat.com> wrote:
> 
> > ext[2,3,4], ufs, and ubifs all check for  CAP_SYS_RESOURCE to determine
> > if they should allow reserved blocks to be used.  A process not having
> > this capability is not failing some security decision and should not be
> > audited.  Thus move to using has_capability_noaudit.
> > 
> > Signed-off-by: Eric Paris <eparis@redhat.com>
> > ---
> > 
> > I would like to push this patch through the security tree (since that's
> > the only place the new cap_noaudit interface exists), but I'd like to
> > get an ACK from each subsystem maintainer.

For ext4:

Acked-by: "Theodore Ts'o" <tytso@mit.edu>

						- Ted
