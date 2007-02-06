Received: from web58707.mail.re1.yahoo.com ([66.196.100.184])
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HESzw-0000Od-PU
	for linux-mtd@lists.infradead.org; Tue, 06 Feb 2007 11:16:52 -0500
Date: Tue, 6 Feb 2007 08:10:08 -0800 (PST)
From: Philip Rakity <prakity@yahoo.com>
Subject: Re: Do not understand use of oobfree
To: dedekind@infradead.org
In-Reply-To: <1170663762.3628.56.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Message-ID: <389628.4664.qm@web58707.mail.re1.yahoo.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


I am still a little confused about oobfree and jffs2.  So, Jffs2 knows
about the physical layout of the out of band area -- does not treat it
as a logical linear memory area?  The driver does not hide the layout
by providing a linear mapping to jffs2 ?  oobfree tells jffs2 where it
can put its data ?

Philip
--- Artem Bityutskiy <dedekind@infradead.org> wrote:

> On Sun, 2007-02-04 at 19:58 -0800, Philip Rakity wrote:
> > I am asking because if I have a flash device that does not map per
> the
> > standard includes do I have to touch jffs2 to get things to work. 
> 
> I've just submitted a patch which teaches UBI to use MTD_OOB_AUTO
> option. Please, make sure your driver supports it and try the patch.
> 
> The idea is that it is not application's business to know details of
> OOB
> - where ECC bytes ate stored, BB marker, etc. This is all legacy
> stuff,
> conceptually wrong. We now (thankfully) have the MTD_OOB_AUTO and it
> should be used instead. It represents free OOB bytes as a contiguous
> buffer and allows you read to it and write from it.
> 
> The patches are not in Mainline, not even in mtd-2.6.git yet. They
> are
> at
> git://git.infradead.org/~dedekind/dedekind-mtd-2.6.git.
> 
> Or web
>
http://git.infradead.org/?p=users/dedekind/dedekind-mtd-2.6.git;a=summary
> 
> Try this and send us your success story or the complaint.
> 
> P.S. I don't know why we don't remove the legacy OOB-related stuff -
> but
> I am all for it.
> 
> -- 
> Best regards,
> Artem Bityutskiy (Битюцкий Артём)
> 
> 
> 



 
____________________________________________________________________________________
Never Miss an Email
Stay connected with Yahoo! Mail on your mobile.  Get started!
http://mobile.yahoo.com/services?promote=mail
