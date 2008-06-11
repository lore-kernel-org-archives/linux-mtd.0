Received: from wf-out-1314.google.com ([209.85.200.168])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K6LXv-0006tw-3l
	for linux-mtd@lists.infradead.org; Wed, 11 Jun 2008 08:19:07 +0000
Received: by wf-out-1314.google.com with SMTP id 28so3066575wfc.24
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Jun 2008 01:19:05 -0700 (PDT)
Message-ID: <bae050c10806110119u74cf7574mbc3531aa17c16b93@mail.gmail.com>
Date: Wed, 11 Jun 2008 16:19:04 +0800
From: Nancy <nancydreaming@gmail.com>
To: "Zhao Forrest" <forrest.zhao@gmail.com>
Subject: Re: A question about UBIFS
In-Reply-To: <ac8af0be0806110056q427ff589h1269d4d8633d0170@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <ac8af0be0806102116l5918c48ax279d456b4de1d061@mail.gmail.com>
	<484F7202.1010701@nokia.com>
	<ac8af0be0806110056q427ff589h1269d4d8633d0170@mail.gmail.com>
Cc: Artem.Bityutskiy@nokia.com, linux-mtd@lists.infradead.org,
	Adrian Hunter <ext-adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6/11/08, Zhao Forrest <forrest.zhao@gmail.com> wrote:
> >
> >> My question is how page 11 is updated by UBIFS/UBI?
> >
> > As far as UBIFS goes, you need to learn about wandering trees and
> > garbage collection.
>
> This question is just out of my curiosity and not related to this topic.
> Do you know if there is any FTL implemented by firmware doing the
> out-of-place updating? Maybe this is too complexed to be implemented
> by firmware?

JFFS2, UBIFS can do that "out-of-place" updating, cause they are
file-system, they know what is validate data what is trash (should be
managed by garbage collection).

In FTL layer, you have no way to know, no way to differ validate and
trash. even no way to differ what is filesystem meta data what is file
content data. In FTL layer, there's no way to interperet the data. But
if you do some special FTL, eg. FTL only for FAT filesystem, and you
are good at How FAT implemet in Linux, maybe you can do that. That's
really hard :-)


-- 
Best wishes,
Nancy
