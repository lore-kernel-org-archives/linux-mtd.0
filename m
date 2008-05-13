Received: from wr-out-0506.google.com ([64.233.184.225])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Jvubh-0006Qd-B9
	for linux-mtd@lists.infradead.org; Tue, 13 May 2008 13:31:53 +0000
Received: by wr-out-0506.google.com with SMTP id c46so1370676wra.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 May 2008 06:31:52 -0700 (PDT)
Message-ID: <bae050c10805130631g7de2a4b0x1d67ddd3b84511bc@mail.gmail.com>
Date: Tue, 13 May 2008 21:31:52 +0800
From: Nancy <nancydreaming@gmail.com>
To: dedekind@infradead.org
Subject: Re: [PATCH] [MTD] [UBI] add block device layer on top of UBI
In-Reply-To: <1210672391.5708.15.camel@sauron>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10803030317j49cfce3ds7a6af593d16d3736@mail.gmail.com>
	<bae050c10803040140q2d4801d5m4271cadcaa55579@mail.gmail.com>
	<1204623622.23706.22.camel@sauron>
	<bae050c10803040154t2f635dfewe1221c18255f7bda@mail.gmail.com>
	<1204624414.23706.26.camel@sauron>
	<bae050c10803040207odbaebe5vd85b619b370a16cd@mail.gmail.com>
	<bae050c10803040555y3a398fla89fe54c01908838@mail.gmail.com>
	<bae050c10805122116g4295f202j40e1a8528be5220@mail.gmail.com>
	<1210672391.5708.15.camel@sauron>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 13, 2008 at 5:53 PM, Artem Bityutskiy
<dedekind@infradead.org> wrote:
> On Tue, 2008-05-13 at 12:16 +0800, Nancy wrote:
> > Hi all,
> >        I think it is my final edition of ubi block device layer code
> > based on UBI commit e442c48f84982d0fa10c6b292018241dafca4d65
> >        Finally, it can support any filesystem based on block device layer.
> >        eg: FAT, ext2....
> >        #modprobe ubiblk
> >        #mkfs.vfat /dev/ubiblock1
> >        #mount -t vfat /dev/ubiblock1 /mnt/fat
> >
> >        I notice there many people need this function especially our
> > Chinese. Hope this helpful :-)
> >        Here's my implementation:
>
> What is the reason you added this "generic" ubi mtd block stuff? What
> for?
   I though you must know the answer better than any others. Here's
your Big red note
"People are often confused and treat UBI as a block device emulation
layer (also known as FTL - flash translation layer). But this is not
true - UBI is not an FTL."
   I used to be one of those people. There are many people like me
find an good NFTL layer  code in OpenSource. But none! UBI complete
the main part of the NFTL job and done well. In fact I want to ask you
why do not go further to make it a good NFTL, not just for UBIFS use,
but other filesystem based on block device layer.
   In embended system world, this function is very important. mp3,
mp4, mobile phone, study machine...... many many devices need connect
with PC with USB line.  There are huge numbers of people using
Windows.  FAT should be supported.
   Also, some customer like to use Reiserfs. As a BSP Nand flash
driver supporter, I have to meet there need. That's why I add this
"generic" ubi block layer.

> Also, UBI should not have any explicit block device support - it
> should be isolated. It is to ok to add some general support for devices
> on top of UBI, like notification about volume size change and so on,
   Good!
> but not explicit block layer support.
   Why not? Why you so hate block layer?

Gluebi should also get a separate
> module, ideally.
   In fact, we do not need Gluebi, What Glubi for? for jffs2 on top of
UBI?  I'd rather use Jffs2 on top of MTD directly. It really not
neccessary to use 2 or more Nand awared filesystems. Just pick the
best one, let's say UBIFS, enough!

> Also, the patch suffers from too direct copy-pastes which is not
> acceptable.
Oh, Is that a rule? Too direct copy-pastes is what I called code
reused. Complete the task is more important!  Too direct copy-pastes
also shows my high respect to the original code author.

MTD and UBI should be family, Why the developers here are so ....?
Hope my patch make them family again! Please cherrish the peace and
signed off this patch to rescue the people who are looking for NFTL.
If you do mind the copyright, you can wipe out my name,  that's OK, I
do not care much.
Or you do those job all by yourself again. But please, do not ignore
NFTL requirement!


---
Best wishes,
Nancy
