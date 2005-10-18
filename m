Received: from mail.fh-wedel.de ([213.39.232.198] helo=moskovskaya.fh-wedel.de)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1ES1D8-0003ad-Kn
	for linux-mtd@lists.infradead.org; Tue, 18 Oct 2005 19:49:45 -0400
Date: Wed, 19 Oct 2005 01:49:14 +0200
From: =?iso-8859-1?Q?J=F6rn?= Engel <joern@wohnheim.fh-wedel.de>
To: Daniel Ann <ktdann@gmail.com>
Message-ID: <20051018234914.GF20236@wohnheim.fh-wedel.de>
References: <9b7ca6570510121624h5abdbf3erf526aab893bf285a@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9b7ca6570510121624h5abdbf3erf526aab893bf285a@mail.gmail.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: FYI, problem in CVS version
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 13 October 2005 08:24:31 +0900, Daniel Ann wrote:
> 
> I've downloaded CVS version yesterday and patched linux-2.6.12.3
> kernel but everytime I try to do make mrproper I get an error saying
> fs/jffs3/makefile.clean doesnt exist.
> 
> I've noticed that patch didnt include any JFFS3 files since there
> werent any fs/jffs3 directory to start with, but fs/Makefile had line
> mentioning JFFS3. So, I've commented out and did make mrproper which
> worked.
> 
> Just to let you know how I've patched the kernel, I've executed
> patchkernel.sh with following argument,
> ./patchkernel.sh -c -2 -3 -v /usr/src/linux-2.6.12.3

Not adding the "-3" would have avoided your problem.  Jffs3 has been
removed for the most part, but it looks like fs/Makefile.jffs3 and
some bits inside patchkernel.sh have survived.  Would you mind sending
a patch to kill those bits as well?

Jörn

-- 
There's nothing better for promoting creativity in a medium than
making an audience feel "Hmm ­ I could do better than that!"
-- Douglas Adams in a slashdot interview
