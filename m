From: David Woodhouse <dwmw2@infradead.org>
To: =?ISO-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
In-Reply-To: <20060423122721.GC19326@wohnheim.fh-wedel.de>
References: <20060422165138.GE6629@wohnheim.fh-wedel.de>
	<20060422171133.GF6629@wohnheim.fh-wedel.de>
	<20060423122721.GC19326@wohnheim.fh-wedel.de>
Content-Type: text/plain; charset=UTF-8
Date: Sun, 23 Apr 2006 14:27:26 +0100
Message-Id: <1145798847.16166.204.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Josh Boyer <jwboyer@gmail.com>, linux-mtd@lists.infradead.org
Subject: Re: [HOWTO] Using git for mtd (v3)
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2006-04-23 at 14:27 +0200, Jörn Engel wrote:
> 
> 8. Create private tree on pentafluge
> 
>   $ ssh git.infradead.org
>   $ mkdir public_git
>   $ cd public_git
>   $ ln -s ~/public_git
>   $ git clone -l -n -s --bare /home/git/mtd-2.6.git mtd-2.6.git
>   $ chmod og+rx ~ ~/public_git

Edit mtd-2.6.git/description too.

You need to set up a remote branch in your local repository which
matches your new tree on pentafluge, just as you did for the 'mtd'
branch above. Except that this one is for pushing _and_ pulling, of
course:

cat > .git/remotes/mymtd << EOF
URL: git+ssh://git.infradead.org/~/public_git/mtd-2.6.git
Pull: master:mtd
Push: mtd:master
EOF

It's probably easier not to play with branches -- that's fine for people
who want to get clever, but the HOWTO should probably just tell people
to use 'git-clone --reference'; either to clone the mtd-2.6.git tree if
they want a read-only copy of that, or to clone locally on pentafluge
and then git-clone from that if they want their own tree.

> 9. Push to private tree on pentafluge
> 
>   $ git push ssh://git.infradead.org/~/public_git/mtd-2.6.git

git push mymtd

>   http://git.infradead.org/ will index the tree every five minutes via
>   cron. 
-- 
dwmw2
