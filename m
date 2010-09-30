Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1P1CF9-0004qU-Pu
	for linux-mtd@lists.infradead.org; Thu, 30 Sep 2010 06:03:48 +0000
Received: by bwz19 with SMTP id 19so1538454bwz.36
	for <linux-mtd@lists.infradead.org>;
	Wed, 29 Sep 2010 23:03:46 -0700 (PDT)
Subject: Re: [PATCH 1/3] mtd-utils: new memory wrappers
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Mike Frysinger <vapier@gentoo.org>
In-Reply-To: <AANLkTi=E6qy2sBq1thXMUWfxSbCuNZDUOmmGT8o0j0hW@mail.gmail.com>
References: <1285803024-13572-1-git-send-email-vapier@gentoo.org>
	<1285822785.11684.11.camel@localhost>
	<AANLkTimzVA06P8GR4Gy_2PSFDXKnzTOHPj2qr+_X__zw@mail.gmail.com>
	<1285825735.11684.22.camel@localhost>
	<AANLkTi=E6qy2sBq1thXMUWfxSbCuNZDUOmmGT8o0j0hW@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Thu, 30 Sep 2010 09:01:39 +0300
Message-ID: <1285826499.11684.24.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2010-09-30 at 01:59 -0400, Mike Frysinger wrote:
> On Thu, Sep 30, 2010 at 01:48, Artem Bityutskiy wrote:
> > On Thu, 2010-09-30 at 01:15 -0400, Mike Frysinger wrote:
> >> as i'm sure you noticed, i didnt make these up.  i simply moved them
> >> from existing mtd-utils code.
> >
> > Actually no, I did not notice!
> 
> np ... only one or two utils uses this, and easy enough to convert
> them.  before i go further though, a question on direction ...
> 
> mkfs.jffs2 has a lot of helpers that can be moved to common.h.  but it
> implements things using C functions & va_args.  the common.h header
> takes the CPP approach of expanding the variable args.  which way to
> go to ultimately unify the code base !?

I have not strong opinion, how about creating common.c ?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
