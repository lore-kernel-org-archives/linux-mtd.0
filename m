Received: from [195.209.228.254] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.52 #1 (Red Hat Linux))
	id 1EMmdT-0008Uz-6X
	for linux-mtd@lists.infradead.org; Tue, 04 Oct 2005 09:15:27 -0400
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: Josh Boyer <jdub@us.ibm.com>
In-Reply-To: <1128430963.20490.3.camel@windu.rchland.ibm.com>
References: <1128125846.6926.120.camel@localhost.localdomain>
	<434264A0.5000708@yandex.ru>
	<1128430963.20490.3.camel@windu.rchland.ibm.com>
Content-Type: text/plain
Date: Tue, 04 Oct 2005 17:14:36 +0400
Message-Id: <1128431676.11541.3.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Artem B. Bityutskiy" <dedekind@yandex.ru>, linux-mtd@lists.infradead.org
Subject: Re: [PATCH] jffs2, symlink, and 2.6.13
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2005-10-04 at 08:02 -0500, Josh Boyer wrote:
> On Tue, 2005-10-04 at 15:16 +0400, Artem B. Bityutskiy wrote:
> > Peter Grayson wrote:
> > > For those on earlier kernel versions, this change will yield compiler
> > > warnings. I am not sure what the policy is for maintaining compatibility
> > > with older kernel versions, so I did not include any changes to
> > > compatmac.h. Do we want to reproduce the struct inode_operations
> > > declaration in compatmac.h just so that latest mtd does not yield
> > > compiler warnings on older kernels?
> > 
> > The patch looks OK. Not sure how to support compatimility, I would just 
> > let gcc print warnings in older kernels. And it looks like it is 
> > harmless. Anyone, comments?
> 
> I'd rather it be added to compatmac.h.  We have things in there that
> support older 2.6 kernels already, so adding another wouldn't hurt.
> There's even a section for kernels older than 2.6.13 already.

Yes, it is better, providing one do it it elegantly and without
introducing any crap to symlink.c.

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
