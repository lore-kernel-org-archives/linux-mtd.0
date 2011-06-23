Received: from mail-pv0-f177.google.com ([74.125.83.177])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QZlS3-0006I8-Rl
	for linux-mtd@lists.infradead.org; Thu, 23 Jun 2011 15:04:16 +0000
Received: by pvg20 with SMTP id 20so1297977pvg.36
	for <linux-mtd@lists.infradead.org>;
	Thu, 23 Jun 2011 08:04:13 -0700 (PDT)
Subject: Re: [PATCH v3 0/7] prepare new nanddump options, defaults
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Thu, 23 Jun 2011 18:04:57 +0300
In-Reply-To: <1308841377.23597.10.camel@sauron>
References: <BANLkTi=-25MExYfuB-ANK4ceh3gWy+BqCg@mail.gmail.com>
	<1308761363-16512-1-git-send-email-computersforpeace@gmail.com>
	<1308841377.23597.10.camel@sauron>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1308841503.23597.12.camel@sauron>
Mime-Version: 1.0
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org,
	Mike Frysinger <vapier.adi@gmail.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2011-06-23 at 18:02 +0300, Artem Bityutskiy wrote:
> On Wed, 2011-06-22 at 09:49 -0700, Brian Norris wrote:
> > Hello,
> > 
> > I think this should be the last version necessary for this particular patch
> > series...
> > 
> > This series adds, changes, and deprecates several nanddump options, helping make
> > nanddump a closer inverse to nandwrite. This is mostly a preparation for the
> > next release, when several defaults might change. A short list of the planned
> > changes:
> > 
> >  * unify bad block methods under `--bb=METHOD', deprecating old ones
> >  * kill --omitbad in favor of --bb=skipbad
> >  * skip bad blocks by default (i.e., --bb=skipbad)
> >  * do not dump OOB by default (--omitoob)
> >  * add `--oob' to force dumping OOB
> > 
> > Please let me know when these are accepted and the 1.4.5 release is made, so I
> > can send a proper patchset to clean this all up as planned for the 1.4.6
> > release.
> 
> Pushed, thank you!
> 
> > BTW, is each utility supposed to have its own version? (e.g., nanddump has
> > version 1.30?) Should these versions be kept in any kind of sync with the
> > mtd-utils revision tags? And does Artem take care of this stuff?
> 
> Actually no, I do not take care of this and this is messy. Probably it
> would be easier if all utils had the same version as the release...

And speaking about released, should we do a new one? If you see that
some utils should have a version increased - feel free to do so. But
even better we could make the version numbers to be the same as release
number, then this process would be more automated and version would make
some sense...

-- 
Best Regards,
Artem Bityutskiy
