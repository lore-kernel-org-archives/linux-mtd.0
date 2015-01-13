Received: from mail-pa0-x234.google.com ([2607:f8b0:400e:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YB9U2-0003hF-F4
 for linux-mtd@lists.infradead.org; Tue, 13 Jan 2015 21:58:43 +0000
Received: by mail-pa0-f52.google.com with SMTP id eu11so6057172pac.11
 for <linux-mtd@lists.infradead.org>; Tue, 13 Jan 2015 13:58:20 -0800 (PST)
Date: Tue, 13 Jan 2015 13:58:17 -0800
From: Brian Norris <computersforpeace@gmail.com>
To: Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH v3 2/2] mtd: fsl-quadspi: Fix module unbound
Message-ID: <20150113215817.GW9759@ld-irv-0074>
References: <1420626727-6929-1-git-send-email-festevam@gmail.com>
 <1420626727-6929-2-git-send-email-festevam@gmail.com>
 <20150109201743.GW9759@ld-irv-0074>
 <CAOMZO5BaEyU=qJfCsng+kPBcWSxb6wgJzzahgYvHn5Fqi_uoWA@mail.gmail.com>
 <20150113185153.GT9759@ld-irv-0074>
 <CAOMZO5Cy39iC0CpvO0H6i6rX6YVyns-2tZi5-vU28hCM6kgu-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOMZO5Cy39iC0CpvO0H6i6rX6YVyns-2tZi5-vU28hCM6kgu-w@mail.gmail.com>
Cc: Fabio Estevam <fabio.estevam@freescale.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Huang Shijie <shijie8@gmail.com>, Frank.Li@freescale.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Fabio,

On Tue, Jan 13, 2015 at 07:45:22PM -0200, Fabio Estevam wrote:
> On Tue, Jan 13, 2015 at 4:51 PM, Brian Norris
> <computersforpeace@gmail.com> wrote:
> 
> >> - Read the two flashes.
> >
> > Are you doing any verification to make sure you're reading the *correct*
> > data? I'd imagine from some what I see in your patches, that you might
> > actually be reading from the wrong flash.
> 
> Yes, you are right. Just confirmed that with this v3 applied I erased
> /dev/mtd0, but that also incorrectly erased /dev/mtd1.
> 
> Now I came back to the original v1 patch: isn't it the simpler
> approach for fixing the module load/unload crash problem?
> 
> It only keeps the mtd unregistration index in sync with registration
> and doesn't touch other areas of the driver.
> 
> IMHO it is an improvement over the current situation.

Right, I thought your original patch was an improvement, but it did
still leave some of the error path broken. And as Huang mentioned,
multiple devices were never actually *properly* supported, so there were
problems there.

> I agree that this driver needs more rework, but I am not able to put
> it on such good state.

I might be OK with taking v1 if we can do the following:

(1) Identify who will take responsibility for testing and improving this
driver. We might even add a MAINTAINERS entry

(2) Get an 'ack' from said person

(3) Document the known issues with this driver; add some TODO/FIXME
comments, and maybe disable potentially broken features until they get
fixed (e.g., only probe up to 1 flash, leaving the second flash
disabled)

Huang mentioned that Frank may be interested in (1).

Brian
