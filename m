Received: from anchor-post-32.mail.demon.net ([194.217.242.90])
	by pentafluge.infradead.org with esmtp (Exim 4.30 #5 (Red Hat Linux))
	id 1Avfjy-0004Md-Sg
	for linux-mtd@lists.infradead.org; Tue, 24 Feb 2004 16:49:02 +0000
Content-Type: text/plain;
  charset="iso-8859-1"
From: Simon Haynes <simon@baydel.com>
To: David Woodhouse <dwmw2@infradead.org>
Date: Tue, 24 Feb 2004 16:17:35 +0000
References: <4034E8ED.5757.55A2D9@localhost> <69BCB2F40B2B@baydel.com>
	<1077639264.7826.516.camel@hades.cambridge.redhat.com>
In-Reply-To: <1077639264.7826.516.camel@hades.cambridge.redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <69D8404D0D5E@baydel.com>
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Corruption.
Reply-To: simon@baydel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 24 Feb 2004 4:14 pm, David Woodhouse wrote:
> On Tue, 2004-02-24 at 15:47 +0000, Simon Haynes wrote:
> > I hacked fs/jffs2/super.c and fs/jffs2/super_v24.c. Only the v24 got
> > compiled. I guess this is because my kernel is 2.4.21.  I had to also
> > include ramdisk in the kernel as it was previously missing ? Does this
> > effect MTD ?
>
> No, it neither effects nor affects the MTD drivers.
>
> > This mounted rw.
>
> OK... now can you reproduce the same _problem_ that way?

My problem only occurs across reboots. As the ramdisk is not persistent 
storage how can I try and reproduce the problem. I have tried to reproduce 
the problem on mtd devices without rebooting and I have not managed to to 
this. 

Cheers 

SImon. 
