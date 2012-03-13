Received: from perches-mx.perches.com ([206.117.179.246] helo=labridge.com)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1S7Uge-0008PR-90
 for linux-mtd@lists.infradead.org; Tue, 13 Mar 2012 16:35:00 +0000
Message-ID: <1331656495.11405.4.camel@joe2Laptop>
Subject: Re: [PATCH 1/4] jffs2: Convert most D1/D2 macros to jffs2_dbg
From: Joe Perches <joe@perches.com>
To: dedekind1@gmail.com
Date: Tue, 13 Mar 2012 09:34:55 -0700
In-Reply-To: <1331642368.3595.31.camel@sauron.fi.intel.com>
References: <cover.1329349881.git.joe@perches.com>
 <2d68e76db16d42f451370714f03ef952e0839692.1329349881.git.joe@perches.com>
 <1330965033.7220.16.camel@golum> <1330966615.3140.6.camel@joe2Laptop>
 <1331294012.29445.10.camel@sauron.fi.intel.com>
 <1331318968.13055.8.camel@joe2Laptop>
 <1331557935.12037.11.camel@sauron.fi.intel.com>
 <1331566415.13200.14.camel@joe2Laptop>
 <1331570150.12037.55.camel@sauron.fi.intel.com>
 <1331572270.13200.30.camel@joe2Laptop>
 <1331642368.3595.31.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2012-03-13 at 14:39 +0200, Artem Bityutskiy wrote:
> On Mon, 2012-03-12 at 10:11 -0700, Joe Perches wrote:
> > On Mon, 2012-03-12 at 18:35 +0200, Artem Bityutskiy wrote:
> > > On Mon, 2012-03-12 at 08:33 -0700, Joe Perches wrote:
> > > > I tentatively converted them to a bitmap
> > > > and a single jffs2_dbg(mask, fmt, ...)
> > > > but perhaps all of these could be deleted
> > > > too.
> > > I think it is better to convert them to jffs2_debug(). And I guess after
> > > the change the "mask" parameter will go away?
> > Mask would remain and perhaps become a module
> > variable instead of a compile #define.
> > What is jffs2_debug?
> Sorry, I meant to suggest to just turn them all to jffs2_dbg() which you
> introduced, without any bitmasks.

These functions are conditionally compiled today.

Introducing a bitmask allows the same conditional
compilation optimization.

David?  as nominal maintainer, do you have an opinion?

btw: Artem, you are not listed in the MAINTAINERS
entry for jffs2.  Should you be?
