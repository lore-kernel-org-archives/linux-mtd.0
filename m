Received: from mail-ww0-f49.google.com ([74.125.82.49])
	by canuck.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1PstLv-0002Cu-JB
	for linux-mtd@lists.infradead.org; Fri, 25 Feb 2011 08:48:44 +0000
Received: by wwb29 with SMTP id 29so1262085wwb.18
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Feb 2011 00:48:41 -0800 (PST)
Subject: Re: [PATCH 1/5] MTD: make MTD_CONCAT support mandatory
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Dmitry Eremin-Solenikov <dbaryshkov@gmail.com>
In-Reply-To: <AANLkTi=TP7T-vt_vgacRPOgGWvhHPqKkEggQNDmPDkY3@mail.gmail.com>
References: <1294745619-7142-1-git-send-email-dbaryshkov@gmail.com>
	<201101121425.49587.sr@denx.de>
	<AANLkTi=TP7T-vt_vgacRPOgGWvhHPqKkEggQNDmPDkY3@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Fri, 25 Feb 2011 10:47:18 +0200
Message-ID: <1298623638.2798.11.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, Stefan Roese <sr@denx.de>,
	David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2011-02-15 at 17:07 +0300, Dmitry Eremin-Solenikov wrote:
> Hello,
> 
> On Wed, Jan 12, 2011 at 4:25 PM, Stefan Roese <sr@denx.de> wrote:
> > On Tuesday 11 January 2011 12:33:35 Dmitry Eremin-Solenikov wrote:
> >> Move mtdconcat to be an integral part of the mtd core. It's a tiny bit
> >> of code, which bears 'say Y if you don't know what to do' note in the
> >> Kconfig. OTOH there are several ugly ifdefs depending on the MTD_CONCAT.
> >> So, making MTD_CONCAT support mandatory will allow us to clean up code a
> >> lot.
> >>
> >> Kconfig entry is changed to be a bool defaulting to Y, so all code
> >> pieces depending on it, will have MTD_CONCAT Kconfig symbol and
> >> CONFIG_MTD_CONCAT define. This will be removed in one of next patches.
> >
> > Whole patch series looks good. Thanks. I'm not sure if it makes more sense to
> > squash the MTD patches into one patch. Either way I'm fine with it, so:
> >
> > Acked-by: Stefan Roese <sr@denx.de>
> >
> > for the whole patch series.
> 
> What about this series? Will it find it's way to kernel or should I do
> some more steps?

They still sit in my l2-mtd-2.6.git tree. You are not expected to do
anything, David should look at them an pick them (or reject with an
e-mail explaining the reasons) later. Usually he does this closer to the
merge window.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
