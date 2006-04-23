From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060422171133.GF6629@wohnheim.fh-wedel.de>
References: <20060422165138.GE6629@wohnheim.fh-wedel.de>
	<20060422171133.GF6629@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Date: Sun, 23 Apr 2006 13:08:33 +0100
Message-Id: <1145794113.11909.338.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Josh Boyer <jwboyer@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [HOWTO] Using git for mtd
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 2006-04-22 at 19:11 +0200, Jörn Engel wrote:
> Next version with the FIXMEs filled in.  If anyone has comments, spots
> errors, etc., please tell me.
> 
> 1. Clone Linus' tree
> 
>   $ git clone git://rsync.kernel.org/pub/scm/linux/kernel/git/torvalds/linux-2.6.git mtd

Probably best to explain _why_ we're asking people to refrain from just
cloning git://git.infradead.org/mtd-2.6.git 

> 2. Change into soon-to-be mtd tree
> 
>   $ cd mtd
> 
> 3. Setup mtd remotes file
> 
>   $ vi .git/remotes/mtd
>   URL: git://git.infradead.org/mtd-2.6
>   Pull: master:mtd
> 
> 4. Fetch mtd tree
> 
>   $ git fetch mtd
> 
> 5. Checkout mtd tree
> 
>   $ git checkout mtd
> 
> 6. Edit some files
> 
>   Use your favorite editor.  Don't forget to tell git about new files
>   with "git add".
> 
> 7. Commit changes
> 
>   $ git commit -a -s
> 
>   Don't forget the '-s' part or you have to add the Signed-Off-By:
>   line yourself.
> 
> 8. Create private tree on pentafluge
> 
>   $ ssh pentafluge.infradead.org
>   $ mkdir public_git
>   $ cd public_git
>   $ ln -s ~/public_git
>   $ git clone -l -n -s --bare /home/git/mtd-2.6.git mtd-2.6.git
> 

chmod og+rx ~

The HOWTO should also make it clear that the cron job indexes users'
trees every five minutes -- it'll be that long before you can see it in
http://git.infradead.org/, although the
git://git.infradead.org/~user/mtd-2.6.git URL should work immediately.

Probably best to use the rôle address 'git.infradead.org' instead of the
machine name pentafluge.infradead.org, especially as I'm hoping to shift
git services onto a shiny new G5 if I can persuade someone to contribute
such a beast.

> 9. Push to private tree on pentafluge
> 
>   $ git push ssh://pf/~/public_git/mtd-2.6.git

s/pf/git.infradead.org/

> Jörn
> 
-- 
dwmw2
