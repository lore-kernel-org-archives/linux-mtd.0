Received: from mail-ey0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rkjnm-0001D2-3h
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 22:04:18 +0000
Received: by eaai13 with SMTP id i13so28414eaa.36
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jan 2012 14:04:16 -0800 (PST)
Subject: Re: [PATCH] cfi: AMD/Fujitsu compatibles: add panic write support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Florian Fainelli <ffainelli@freebox.fr>
Date: Wed, 11 Jan 2012 00:04:14 +0200
In-Reply-To: <4F0C124F.7040807@freebox.fr>
References: <1325878159-32306-1-git-send-email-iws@ovro.caltech.edu>
 <4F0C124F.7040807@freebox.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1326233055.2335.13.camel@koala>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 "Ira W. Snyder" <iws@ovro.caltech.edu>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2012-01-10 at 11:26 +0100, Florian Fainelli wrote:
> Hello,
> 
> On 01/06/12 20:29, Ira W. Snyder wrote:
> > This allows the mtdoops driver to work on flash chips using the
> > AMD/Fujitsu compatible command set.
> >
> > As the code comments note, the locks used throughout the normal code
> > paths in the driver are ignored, so that the chance of writing out the
> > kernel's last messages are maximized.
> 
> This patch made me looking at the panic code, but should not this be 
> made conditionnal to the enabling/disabling of the MTD oops driver?

What do you mean? Conceptually, the driver is a low-level entity and it
provides I/O mechanisms, and it should have no idea who will use them -
be that is mtdoops or anything else.

Artem.
