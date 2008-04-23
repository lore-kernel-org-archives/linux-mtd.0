Subject: Re: [PATCH][JFFS2] Fix garbage collector block search
From: David Woodhouse <dwmw2@infradead.org>
To: Alexander Belyakov <abelyako@googlemail.com>
In-Reply-To: <fe810cf0804230608t1183dbf4l99b168476875bfc0@mail.gmail.com>
References: <E1J2Trs-000IFE-00.abelyako-mail-ru@f65.mail.ru>
	<20080114132843.GA15710@lazybastard.org>
	<fe810cf0801150424j25f35131v83692a3193a45a3b@mail.gmail.com>
	<20080115133350.GA22338@lazybastard.org>
	<fe810cf0801180828g7a48b6a1u69e35f832185b5eb@mail.gmail.com>
	<1208882833.9212.629.camel@pmac.infradead.org>
	<fe810cf0804230431m2bf80e83h4fa71bd5887b7587@mail.gmail.com>
	<1208950350.9212.791.camel@pmac.infradead.org>
	<fe810cf0804230608t1183dbf4l99b168476875bfc0@mail.gmail.com>
Content-Type: text/plain
Date: Wed, 23 Apr 2008 15:01:26 +0100
Message-Id: <1208959286.9212.799.camel@pmac.infradead.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Alexander Belyakov <abelyako@mail.ru>,
	=?ISO-8859-1?Q?J=F6rn?= Engel <joern@logfs.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2008-04-23 at 17:08 +0400, Alexander Belyakov wrote:
> On Wed, Apr 23, 2008 at 3:32 PM, David Woodhouse <dwmw2@infradead.org> wrote:
> >
> >  I'm playing with it now, with the intent of committing it. Can you show
> >  me how to reproduce the problem?
> >
> 
> The most easy way to reproduce it is to fill jffs2 volume with single
> large file until there is no empty space, then remove this file and
> immediately try to write another file.
> 
> Something like:
> ---
> #!/bin/sh
> rm -rf /mnt/vol1/*
> dd if=/dev/urandom of=/mnt/vol1/test.file bs=4096 count=32768
> rm /mnt/vol1/test.file
> dd if=/dev/urandom of=/mnt/vol1/test_new.file bs=2048 count=1024
> -------
> 
> The bug is better reproduced on small volumes (for me it is just
> 4Mbytes). The first dd should exit with "No space left on device"
> error to be sure no free space left. The last dd should always
> succeed. If it fails - you catch the bug. Sometimes it is necessary to
> run this script in several time in a row before last dd exits with an
> error.

Hm, I can't make it fail. I'm using nandsim, and have enabled the
'Museum IDs' so that I can have a 4MiB device (I've also tried 2MiB).

I never even see the 'Synching wbuf in order to reuse
erasable_pending_wbuf_list blocks' message, whether I have debugging
enabled or whether I just unable that one message.

-- 
dwmw2
