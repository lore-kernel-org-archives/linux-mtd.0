Received: from 3a.49.1343.static.theplanet.com ([67.19.73.58]
	helo=pug.o-hand.com)
	by canuck.infradead.org with esmtps (Exim 4.63 #1 (Red Hat Linux))
	id 1HMVrJ-0007F5-DC
	for linux-mtd@lists.infradead.org; Wed, 28 Feb 2007 15:57:12 -0500
Subject: Re: [PATCH 5/5] jffs2: Allow selection of compression mode via a
	sysfs attribute
From: Richard Purdie <rpurdie@openedhand.com>
To: dedekind@infradead.org
In-Reply-To: <1172691583.17031.35.camel@sauron>
References: <1172690034.16062.144.camel@localhost.localdomain>
	<1172691583.17031.35.camel@sauron>
Content-Type: text/plain
Date: Wed, 28 Feb 2007 20:56:56 +0000
Message-Id: <1172696216.16062.147.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-crypto@vger.kernel.org, linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	LKML <linux-kernel@vger.kernel.org>, herbert@gondor.apana.org.au
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2007-02-28 at 21:39 +0200, Artem Bityutskiy wrote:
> On Wed, 2007-02-28 at 19:13 +0000, Richard Purdie wrote:
> > +/* gives us jffs2_subsys */
> > +static decl_subsys(jffs2, NULL, NULL);
> 
> There is actually a file-system subsys - look up for fs_subsys. It is
> declared at fs/namespace.c.

Further down the patch you'll see:

+	kset_set_kset_s(&jffs2_subsys, fs_subsys);

There was a reason for doing that instead using fs_subsys in the above
although I can't remember why offhand. I did try it and it didn't work
as expected...

Regards,

Richard
