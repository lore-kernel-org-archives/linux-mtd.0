Received: from mail.davidb.org ([66.93.32.219])
	by pentafluge.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1J85v0-0005HT-2P
	for linux-mtd@lists.infradead.org; Fri, 28 Dec 2007 03:30:01 +0000
Date: Thu, 27 Dec 2007 19:27:45 -0800
From: David Brown <mtd@davidb.org>
To: Nancy <nancydreaming@gmail.com>
Subject: Re: May I received a UBIFS sourcecode based on kernel 2.6.22?
Message-ID: <20071228032745.GA1232@old.davidb.org>
References: <bae050c10712271727p133ca598x8440d5b82c4bc0ac@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <bae050c10712271727p133ca598x8440d5b82c4bc0ac@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Dec 28, 2007 at 09:27:47AM +0800, Nancy wrote:

>git://git.infradead.org/users/dedekind/ubifs-olpc-2.6.git
>      To my surprise,  there did not have folder "ubifs" under
>directory "fs"? Where it is?

It seems to not be under the 'master' branch in that repo.  Try something
like:

   $ cd ubifs-olpc-2.6
   $ git checkout -b stable-ubifs master/stable-ubifs

and you'll find the files there.  There's quite a few branches in that
repo, so there might be a better one to look at.

Dave
