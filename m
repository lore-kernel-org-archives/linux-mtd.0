Received: from mail-gx0-f176.google.com ([209.85.217.176])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1M1Jcy-0007ae-Sp
	for linux-mtd@lists.infradead.org; Tue, 05 May 2009 12:20:11 +0000
Received: by gxk24 with SMTP id 24so6541498gxk.18
	for <linux-mtd@lists.infradead.org>;
	Tue, 05 May 2009 05:20:02 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <71cd59b00905050249y7ea998c7mb5bb95c968d28b72@mail.gmail.com>
References: <71cd59b00905050249y7ea998c7mb5bb95c968d28b72@mail.gmail.com>
Date: Tue, 5 May 2009 08:20:02 -0400
Message-ID: <8bd0f97a0905050520k216cbb15lc2d108115b20f08a@mail.gmail.com>
Subject: Re: mtdutils and libubiio
From: Mike Frysinger <vapier.adi@gmail.com>
To: Corentin Chary <corentin.chary@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: Sidney Amani <amani_s@epitech.net>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 5, 2009 at 05:49, Corentin Chary wrote:
> Some time ago we made libubiio available at :
> http://git.iksaif.net/?p=libubiio.git;a=summary
> I wanted to know how it can be used in mtd-utils, so we can start
> making patch for inclusion into mtd-utils.
> The first thing I see is mkfs.ubifs, using libubiio we will be able to
> run mkfs on an ubi volume. I believe it's
> simpler than creating a image, and using other tools to write it to the volume.
> Where can libubiio be used ?

search the archives ... some one already posted a method for libifying
the UBI code that exists in mtd-utils.  fixing up the minor remaining
issues with that patch seems saner than trying to merge a completely
unrelated code base.
-mike
