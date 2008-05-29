Received: from wf-out-1314.google.com ([209.85.200.168])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1K1dhU-0004XY-FN
	for linux-mtd@lists.infradead.org; Thu, 29 May 2008 08:41:33 +0000
Received: by wf-out-1314.google.com with SMTP id 28so3110101wfc.24
	for <linux-mtd@lists.infradead.org>;
	Thu, 29 May 2008 01:41:31 -0700 (PDT)
Message-ID: <bae050c10805290141g66dba350s5ab1dc3611498938@mail.gmail.com>
Date: Thu, 29 May 2008 16:41:31 +0800
From: Nancy <nancydreaming@gmail.com>
To: mhfan@hhcn.com
Subject: Re: mkfs.ubifs, ubinize, ubiupdatevol request!
In-Reply-To: <483E68E3.30609@hhcn.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <bae050c10805290002gb294d4yf5a62a4331225dbc@mail.gmail.com>
	<483E5C97.2000100@hhcn.com>
	<bae050c10805290101s4467bb39u95cd9fe0a55f883@mail.gmail.com>
	<483E68E3.30609@hhcn.com>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5/29/08, Meihui Fan <mhfan@hhcn.com> wrote:
>
>Nancy wrote:
> > I have tried several pair, but none was same as winodws fast fat32
> > format program.
> > Would you please give me an example?
> >
> > By the way, are you using my ubiblk patch now? Have you meet the same
>
> No. I didn't have a chance to using your ubiblk patch. But I think it is
> useful, and it would very nice if your patch (if you do some further work as
> the UBI guys pointed out) or a similar one to be merged into UBI and
> mainline kernel. Then I and many other people would benefit from this in the
> future.
   Yes, you are quite right! But I guess most MTD developers have more
interesting in Alex Dubov future FAL patch.

> > speed problem? How do you solve it?
>
> I met a similar block access performance issue for the SD/MMC card in my
> target. I solved it by merge several continues single small block access
> into a bigger batch one.

I see, thanks!


-- 
Best wishes,
Nancy
