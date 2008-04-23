Received: from hu-out-0506.google.com ([72.14.214.237])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1JoeiB-0008SW-AC
	for linux-mtd@lists.infradead.org; Wed, 23 Apr 2008 13:08:36 +0000
Received: by hu-out-0506.google.com with SMTP id 34so1575018hui.22
	for <linux-mtd@lists.infradead.org>;
	Wed, 23 Apr 2008 06:08:33 -0700 (PDT)
Message-ID: <fe810cf0804230608t1183dbf4l99b168476875bfc0@mail.gmail.com>
Date: Wed, 23 Apr 2008 17:08:33 +0400
From: "Alexander Belyakov" <abelyako@googlemail.com>
To: "David Woodhouse" <dwmw2@infradead.org>
Subject: Re: [PATCH][JFFS2] Fix garbage collector block search
In-Reply-To: <1208950350.9212.791.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <E1J2Trs-000IFE-00.abelyako-mail-ru@f65.mail.ru>
	<20080114132843.GA15710@lazybastard.org>
	<fe810cf0801150424j25f35131v83692a3193a45a3b@mail.gmail.com>
	<20080115133350.GA22338@lazybastard.org>
	<fe810cf0801180828g7a48b6a1u69e35f832185b5eb@mail.gmail.com>
	<1208882833.9212.629.camel@pmac.infradead.org>
	<fe810cf0804230431m2bf80e83h4fa71bd5887b7587@mail.gmail.com>
	<1208950350.9212.791.camel@pmac.infradead.org>
Cc: Alexander Belyakov <abelyako@mail.ru>,
	=?UTF-8?Q?J=C3=B6rn_Engel?= <joern@logfs.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Apr 23, 2008 at 3:32 PM, David Woodhouse <dwmw2@infradead.org> wrote:
>
>  I'm playing with it now, with the intent of committing it. Can you show
>  me how to reproduce the problem?
>

The most easy way to reproduce it is to fill jffs2 volume with single
large file until there is no empty space, then remove this file and
immediately try to write another file.

Something like:
---
#!/bin/sh
rm -rf /mnt/vol1/*
dd if=/dev/urandom of=/mnt/vol1/test.file bs=4096 count=32768
rm /mnt/vol1/test.file
dd if=/dev/urandom of=/mnt/vol1/test_new.file bs=2048 count=1024
-------

The bug is better reproduced on small volumes (for me it is just
4Mbytes). The first dd should exit with "No space left on device"
error to be sure no free space left. The last dd should always
succeed. If it fails - you catch the bug. Sometimes it is necessary to
run this script in several time in a row before last dd exits with an
error.

Thanks,
Alexander
