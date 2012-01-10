Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rkjpu-0001Kw-FH
 for linux-mtd@lists.infradead.org; Tue, 10 Jan 2012 22:06:31 +0000
Received: by eekc4 with SMTP id c4so27685eek.36
 for <linux-mtd@lists.infradead.org>; Tue, 10 Jan 2012 14:06:28 -0800 (PST)
Subject: Re: [PATCH] cfi: AMD/Fujitsu compatibles: add panic write support
From: Artem Bityutskiy <dedekind1@gmail.com>
To: "Ira W. Snyder" <iws@ovro.caltech.edu>
Date: Wed, 11 Jan 2012 00:06:26 +0200
In-Reply-To: <20120110163845.GA30403@ovro.caltech.edu>
References: <1325878159-32306-1-git-send-email-iws@ovro.caltech.edu>
 <4F0C124F.7040807@freebox.fr> <20120110163845.GA30403@ovro.caltech.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Message-ID: <1326233187.2335.15.camel@koala>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Florian Fainelli <ffainelli@freebox.fr>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2012-01-10 at 08:38 -0800, Ira W. Snyder wrote:
> On Tue, Jan 10, 2012 at 11:26:23AM +0100, Florian Fainelli wrote:
> > Hello,
> > 
> > On 01/06/12 20:29, Ira W. Snyder wrote:
> > > This allows the mtdoops driver to work on flash chips using the
> > > AMD/Fujitsu compatible command set.
> > >
> > > As the code comments note, the locks used throughout the normal code
> > > paths in the driver are ignored, so that the chance of writing out the
> > > kernel's last messages are maximized.
> > 
> > This patch made me looking at the panic code, but should not this be 
> > made conditionnal to the enabling/disabling of the MTD oops driver?
> > 
> 
> It is reasonable to make this code conditional based on CONFIG_MTD_OOPS.
> The mtdoops driver is the only user of mtd->panic_write().

I think we should not break layering - the driver should not know about
entities like mtdoops which are at upper layers. It is like making a
disk driver conditional on file-systems.

Artem.
