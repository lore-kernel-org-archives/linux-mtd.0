Subject: Re: May I received a UBIFS sourcecode based on kernel 2.6.22?
From: David Woodhouse <dwmw2@infradead.org>
To: David Brown <mtd@davidb.org>
In-Reply-To: <20071228032745.GA1232@old.davidb.org>
References: <bae050c10712271727p133ca598x8440d5b82c4bc0ac@mail.gmail.com>
	<20071228032745.GA1232@old.davidb.org>
Content-Type: text/plain
Date: Fri, 28 Dec 2007 09:38:24 +0000
Message-Id: <1198834704.5565.1.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Nancy <nancydreaming@gmail.com>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On Thu, 2007-12-27 at 19:27 -0800, David Brown wrote:
> 
> It seems to not be under the 'master' branch in that repo.  Try
> something
> like:
> 
>    $ cd ubifs-olpc-2.6
>    $ git checkout -b stable-ubifs master/stable-ubifs
> 
> and you'll find the files there.  There's quite a few branches in that
> repo, so there might be a better one to look at.

Ew.

Artem, branches are a _really_ bad idea. Play with them locally if you
like the pain, but please make the relevant ones available as separate
_trees_ on bombadil. If other people also like pain, they can always
pull them into multiple branches in their own working repository.

-- 
dwmw2
