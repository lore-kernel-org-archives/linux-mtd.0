Received: from [213.170.72.194] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1DnW5e-0002u1-4o
	for linux-mtd@lists.infradead.org; Wed, 29 Jun 2005 02:30:31 -0400
From: "Artem B. Bityuckiy" <dedekind@infradead.org>
To: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <1119983460.12240.22.camel@hades.cambridge.redhat.com>
References: <200506271409.42449.charles.tilbury@comcast.net>
	<200506280858.14732.charles.tilbury@comcast.net>
	<42C17594.4000403@yandex.ru>
	<200506280941.14702.charles.tilbury@comcast.net>
	<1119983460.12240.22.camel@hades.cambridge.redhat.com>
Content-Type: text/plain
Date: Wed, 29 Jun 2005 10:29:56 +0400
Message-Id: <1120026596.16978.17.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: charles.tilbury@comcast.net, linux-mtd@lists.infradead.org
Subject: Re: NAND flash question
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-06-28 at 19:30 +0100, David Woodhouse wrote:
> On Tue, 2005-06-28 at 09:41 -0700, Charles Tilbury wrote:
> > In part, I want to get rid of the messages.  They make the marketing
> > guys nervous.  <<grin>>  I may just supress them using comments.  What
> > I really need is to make sure that the user land data gets flushed to
> > NAND before power loss.   That seems like a JFFS2 issue, do you agree?
> 
> Not really. Userland data are flushed to the medium on fsync() or sync()
> just as with other file systems. If a write() call has _just finished
> when the power is lost, there's no guarantee that _any_ file system will
> have committed that write to the medium already. (Unless you were using
> O_SYNC, which we don't support for JFFS2).
> 
This all is correct. But IMO the question implied that the messages like
this are too scary:

jffs2_get_inode_nodes(): CRC failed on node at 0x%08x: Read 0x%08x,
calculated 0x%08x.

And I tend to agree with this. Unclean reboots are normal in embedded
devices and it would be nice not to frighten people by such messages,
especially because in 99% cases this is harmless - just the last written
data is lost. And this is not the first time people are confused with
that. But unfortunately, it is difficult to distinguish between CRC
errors caused by unclean reboots and by real media corruptions, so I
prefer to print this rather then to be silent.

If someone has come up with a patch which smartly distinguishes the CRC
errors reason I'd be very glad.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
