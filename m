Received: from mail-fx0-f49.google.com ([209.85.161.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OiLMH-00055w-VE
	for linux-mtd@lists.infradead.org; Mon, 09 Aug 2010 05:57:14 +0000
Received: by fxm3 with SMTP id 3so6121276fxm.36
	for <linux-mtd@lists.infradead.org>;
	Sun, 08 Aug 2010 22:57:12 -0700 (PDT)
Subject: Re: [PATCH 2/7] UBIFS: do not treat ENOSPC specially
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Vitaly Wool <vitalywool@gmail.com>
In-Reply-To: <AANLkTinexMZo_7aTx3cvs=Nk1freiH+jeuo2bYyMrXJu@mail.gmail.com>
References: <1281169577-18664-1-git-send-email-dedekind1@gmail.com>
	<1281169577-18664-3-git-send-email-dedekind1@gmail.com>
	<AANLkTinexMZo_7aTx3cvs=Nk1freiH+jeuo2bYyMrXJu@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 09 Aug 2010 08:56:57 +0300
Message-ID: <1281333417.2332.0.camel@brekeke>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Matthieu CASTET <matthieu.castet@parrot.com>,
	Adrian Hunter <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-08-08 at 13:51 -0400, Vitaly Wool wrote:
> >                ret = ubifs_garbage_collect_leb(c, &lp);
> >                if (ret < 0) {
> > -                       if (ret == -EAGAIN || ret == -ENOSPC) {
> > +                       if (ret == -EAGAIN) {
> >                                /*
> >                                 * These codes are not errors, so we have to
> >                                 * return the LEB to lprops. But if the
> 
> (just passing by...) probably the comment should be updated as well?

Hi, indeed :-)

Artem.
