Received: from 1cc-dhcp-117.media.mit.edu ([18.85.46.117])
	by pentafluge.infradead.org with esmtpsa (Exim 4.61 #1 (Red Hat Linux))
	id 1FTSHJ-0005dS-ME
	for linux-mtd@lists.infradead.org; Wed, 12 Apr 2006 00:28:09 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain
Date: Tue, 11 Apr 2006 19:28:11 -0400
Message-Id: <1144798092.2645.42.camel@shinybook.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Switching to GIT.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I think it's about time for us to switch to git -- the CVS repository
isn't really working too well. It was OK for a long time because I could
let people play with things in CVS and then clean it up to merge it
upstream, but that hasn't really worked for us with recent JFFS2
changes, partly because I haven't had much time to do that and the
changes have been too intrusive for me to keep up with them properly.

I think the better way to do things like that would be for people to
have their own git tree with stuff like EBH, xattr support, and then
others can use it from there -- it doesn't have to be merged directly
into CVS _first_. Once it's all working and stable, _then_ we can merge
it into the main tree.

I'd also like to retire the machine which is cvs.infradead.org at some
point, so the git service is all on pentafluge.infradead.org (aka
git.infradead.org). If you don't have an account there yet, you'll need
to ask me to set it up for you.

Users can create git trees in their ~/public_git/treename.git which will
be publicly accessible as git://git.infradead.org/~whoever/treename.git 

There's a clean copy of Linus' kernel tree in /home/git/linux-2.6.git
which is updated nightly, and also the 'official' MTD tree next to it --
please clone from one of those using 'alternates' instead of creating an
entirely new tree with all its own objects. For example:
     git-clone -l -n -s --bare /home/git/linux-2.6.git blah-2.6.git

There's also gitweb running on http://git.infradead.org/ but it doesn't
scan the users' home directories yet. Feel free to send me patches
against gitweb.cgi.

The MTD tree is now at git://git.infradead.org/mtd-2.6.git and the
utilities are at git://git.infradead.org/mtd-utils.git

The latter has just been imported directly from CVS and probably doesn't
build yet. The former is currently a clean copy of Linus' tree -- I'll
be cherry-picking some stuff from CVS shortly.

I haven't yet sorted out a script to feed the commits list, although it
shouldn't be hard. It's just a special case of the one I already use to
feed the git-commits lists on kernel.org.

-- 
dwmw2
