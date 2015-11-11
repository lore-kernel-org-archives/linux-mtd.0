Received: from mail-pa0-x22a.google.com ([2607:f8b0:400e:c03::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Zwe4Y-0005CD-RE
 for linux-mtd@lists.infradead.org; Wed, 11 Nov 2015 22:40:59 +0000
Received: by pasz6 with SMTP id z6so44802917pas.2
 for <linux-mtd@lists.infradead.org>; Wed, 11 Nov 2015 14:40:38 -0800 (PST)
Date: Wed, 11 Nov 2015 14:40:35 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: david@sigma-star.at, dedekind1@gmail.com, richard@nod.at,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH V3 01/27] mtd-utils: Restructure the mtd-utils source.
Message-ID: <20151111224035.GD71848@google.com>
References: <1444882208-4455-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1446261121-9978-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <20151111223007.GC71848@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151111223007.GC71848@google.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Nov 11, 2015 at 02:30:07PM -0800, Brian Norris wrote:
> On Sat, Oct 31, 2015 at 11:12:01AM +0800, Dongsheng Yang wrote:
> > * There is no code modification in this commit, only moving
> > * the files to proper place.
> > 
> > The user tools looks a little messy as we place almost
> > the all tools in the root directory of mtd-utils. To make
> > it more clear, I propose to introduce the following structure
> > for our source code.
> > 
> > mtd-utils/
> > 	|-- lib
> > 	|-- include
> > 	|-- misc-utils
> > 	|-- jffsX-utils
> > 	|-- nand-utils
> > 	|-- nor-utils
> > 	|-- ubi-utils
> > 	|-- ubifs-utils
> > 	`-- tests
> > 
> > Signed-off-by: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
> > ---
> > changelog:
> > 	v1:
> > 		- move tools in flash-utils to misc-utils
> > 		- change dir in gitignore
> > 		- remove flash_info in gitignore
> > 		- add mtdpart in gitignore
> >  .gitignore                                         | 54 +++++++++----------
> 
> This patch doesn't apply, due to .gitignore. I don't know what repo
> you're patching of, but it's not the tip of mtd-utils.git...

Anyway, I fixed the conflicts and pushed this patch to mtd-utils.git.
Please let me know if you see any problems.

I'm probably not the one to review/apply the rest of this series, so
I'll leave that to Richard and others.

Brian
