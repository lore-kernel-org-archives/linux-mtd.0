Received: from shinybook.infradead.org ([81.187.2.165])
	by pentafluge.infradead.org with esmtpsa (Exim 4.61 #1 (Red Hat Linux))
	id 1FVfjG-0006QC-Pn
	for linux-mtd@lists.infradead.org; Tue, 18 Apr 2006 03:14:10 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: linux-mtd@lists.infradead.org
In-Reply-To: <1144798092.2645.42.camel@shinybook.infradead.org>
References: <1144798092.2645.42.camel@shinybook.infradead.org>
Content-Type: text/plain
Date: Tue, 18 Apr 2006 03:14:20 +0100
Message-Id: <1145326461.16166.10.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: Switching to GIT.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2006-04-11 at 19:28 -0400, David Woodhouse wrote:
> There's also gitweb running on http://git.infradead.org/ but it
> doesn't scan the users' home directories yet. Feel free to send me
> patches against gitweb.cgi.

This is now fixed -- users' public_git directories are scanned by a cron
job every five minutes and an index is created. We only look for _bare_
repositories _directly_ under your ~/public_git directory -- i.e. the
script looks for ~/public_git/*/HEAD files.

If you have a deeper directory structure, or if your repository isn't a
bare repository, then it won't find your trees. It also won't find them
if your home directory isn't world-executable.

The switch to git seems to be working out OK so far. It should be fairly
simple for anyone to create git trees and ask me to pull from them --
I'd prefer that rather than patches in mail, if possible. Please make
sure your tree is based on the current contents of the mtd-2.6.git tree
though, to reduce the number of merges we have.

-- 
dwmw2
