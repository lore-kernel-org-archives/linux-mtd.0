Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZrDEE-0004Dm-HG
 for linux-mtd@lists.infradead.org; Tue, 27 Oct 2015 23:00:31 +0000
Received: by pabla5 with SMTP id la5so42515974pab.0
 for <linux-mtd@lists.infradead.org>; Tue, 27 Oct 2015 16:00:10 -0700 (PDT)
Date: Tue, 27 Oct 2015 16:00:07 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
Cc: david@sigma-star.at, dedekind1@gmail.com, richard@nod.at,
 linux-mtd@lists.infradead.org
Subject: Re: [RESEND PATCH v2 01/27] mtd-utils: Restructure the mtd-utils
 source.
Message-ID: <20151027230007.GB64073@google.com>
References: <1444881890-4012-2-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1444882208-4455-1-git-send-email-yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1444882208-4455-1-git-send-email-yangds.fnst@cn.fujitsu.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, Oct 15, 2015 at 12:10:08PM +0800, Dongsheng Yang wrote:
> * There is no code modification in this commit, only moving
> * the files to proper place.
> 
> The user tools looks a little messy as we place almost
> the all tools in the root directory of mtd-utils. To make
> it more clear, I propose to introduce the following structure
> for our source code.
> 
> mtd-utils/
> 	|-- lib
> 	|-- include
> 	|-- misc-utils
> 	|-- flash-utils

What's the difference between flash-utils and misc-utils? And don't just
tell me it's because they were named starting with "flash" :)

Particularly, I think things like "mtdpart" and "flash_erase" are pretty
similar levels of generic.

(Also, why is mtdinfo in ubi-utils still? It should be moved, IMO.)

> 	|-- jffsX-utils

What makes more sense: jffsX or just jffs?

> 	|-- nand-utils
> 	|-- nor-utils

What are specific to NOR flash? I don't even know what "rfddump" and
"rfdformat" are. Do they really deserve their own directory?

> 	|-- ubi-utils
> 	|-- ubifs-utils
> 	`-- tests

You need to update .gitignore too.

Brian
