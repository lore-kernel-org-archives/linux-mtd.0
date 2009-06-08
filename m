Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MDXkW-0007EJ-Tf
	for linux-mtd@lists.infradead.org; Mon, 08 Jun 2009 05:50:31 +0000
Subject: Re: about ubifs
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jamie Lokier <jamie@shareable.org>
In-Reply-To: <20090608013528.GI15426@shareable.org>
References: <1244204035.18630.0.camel@tommy-desktop>
	<71cd59b00906050542v72c228a0r883cef7795189fe9@mail.gmail.com>
	<1244206994.20718.7.camel@tommy-desktop>
	<71cd59b00906050704m650d9701q1012dc8b649d8d7f@mail.gmail.com>
	<20090608013528.GI15426@shareable.org>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 08 Jun 2009 08:49:55 +0300
Message-Id: <1244440195.5847.327.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, tommy <jiujin.hong@mid-fun.com>,
	Corentin Chary <corentin.chary@gmail.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2009-06-08 at 02:35 +0100, Jamie Lokier wrote:
> Corentin Chary wrote:
> > On Fri, Jun 5, 2009 at 3:03 PM, tommy<jiujin.hong@mid-fun.com> wrote:
> > > no,i didn't fsync when i close file !
> > >
> > > did ubifs driver can achieve "fsync" when user modify some file and
> > > close with save ?
> > 
> > For critical data, you need to call fsync to be sure the data is
> > stored on the flash.
> > There is also a "sync" option for ubifs, but this will hurt performance a lot.
> 
> That reminds me.
> 
> A filesystem-generic "sync-on-close" mount option would be handy for
> things like that.
> 
> Expecting users to call fsync from a shell script is probably a bit much
> in a lot of applications.

Not sure about sync-on-every-close, but ex4-ish
sync-on-close-if-there-was-truncate makes sense, IMO, and we even plan
to implement this, we just do not have enough time ATM:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_sync_exceptions

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
