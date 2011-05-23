Received: from mail-ww0-f41.google.com ([74.125.82.41])
	by canuck.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
	id 1QOeD5-0003BS-7s
	for linux-mtd@lists.infradead.org; Mon, 23 May 2011 23:06:51 +0000
Received: by wwi18 with SMTP id 18so1968239wwi.0
	for <linux-mtd@lists.infradead.org>;
	Mon, 23 May 2011 16:06:49 -0700 (PDT)
Date: Tue, 24 May 2011 00:06:44 +0100
From: Jamie Iles <jamie@jamieiles.com>
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: [PATCH 02/62] mtd: introduce mtd_device_(un)register()
Message-ID: <20110523230643.GA3727@pulham.picochip.com>
References: <1306142623-24952-1-git-send-email-jamie@jamieiles.com>
	<1306142623-24952-3-git-send-email-jamie@jamieiles.com>
	<BANLkTinmtYksAsCzO8ApGx7k9WNG659zYA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BANLkTinmtYksAsCzO8ApGx7k9WNG659zYA@mail.gmail.com>
Cc: Jamie Iles <jamie@jamieiles.com>, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 23, 2011 at 06:55:49PM -0400, Mike Frysinger wrote:
> On Mon, May 23, 2011 at 05:22, Jamie Iles wrote:
> > To prepare for the removal of add_mtd_device and add_mtd_partitions(),
> > introduce mtd_device_register().  This will create partitions if they
> > are supplied or register the whole device if there are no partitions.
> >
> > Once all drivers are converted to use mtd_device_register(),
> > add_mtd_device() and add_mtd_partitions() will be made internal only.
> 
> i vaguely recall attempting to submit new functions like this a while
> ago, but ultimately it was rejected due to the different behavior mtd
> drivers had wrt partitions and whole devices

I think these cases can still be covered - mtd_device_register() can be 
called twice - once with partitions and once without so it's just like 
calling add_mtd_device() then add_mtd_partitions().  The unregistering 
code deletes all registered partitions then only the master if it has 
been registered.

I don't believe these patches should have changed the behaviour of any 
of the drivers (other than it's now not possible to select whether the 
device is partitioned or not by a Kconfig option), but that can be done 
at runtime through command line partitioning perhaps.

Jamie
