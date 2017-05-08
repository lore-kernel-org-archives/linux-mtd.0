Received: from mail-yw0-x244.google.com ([2607:f8b0:4002:c05::244])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1d7mgx-0002yw-CB
 for linux-mtd@lists.infradead.org; Mon, 08 May 2017 17:43:28 +0000
Received: by mail-yw0-x244.google.com with SMTP id j9so5616575ywj.3
 for <linux-mtd@lists.infradead.org>; Mon, 08 May 2017 10:43:06 -0700 (PDT)
Sender: Tejun Heo <htejun@gmail.com>
Date: Mon, 8 May 2017 13:43:03 -0400
From: Tejun Heo <tj@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 David Woodhouse <dwmw2@infradead.org>, Hans de Goede <hdegoede@redhat.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-mtd@lists.infradead.org,
 Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: Re: Race to power off harming SATA SSDs
Message-ID: <20170508174303.GA12079@htj.duckdns.org>
References: <1494228094.6528.14.camel@infradead.org>
 <alpine.DEB.2.11.1705080930150.6882@lnxricardw1>
 <1494231215.6528.22.camel@infradead.org>
 <alpine.DEB.2.11.1705081034420.6882@lnxricardw1>
 <1494233673.6528.28.camel@infradead.org>
 <alpine.DEB.2.11.1705081059580.6882@lnxricardw1>
 <7ee84982-cfad-94d7-4e22-4edbeb852b32@redhat.com>
 <1494238390.6528.42.camel@infradead.org>
 <20170508135005.0b9b200b@bbrezillon> <20170508164322.GA9781@amd>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170508164322.GA9781@amd>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On Mon, May 08, 2017 at 06:43:22PM +0200, Pavel Machek wrote:
> What I was trying to point out was that storage people try to treat
> SSDs as HDDs... and SSDs are very different. Harddrives mostly survive
> powerfails (with emergency parking), while it is very, very difficult
> to make SSD survive random powerfail, and we have to make sure we
> always powerdown SSDs "cleanly".

We do.

The issue raised is that some SSDs still increment the unexpected
power loss count even after clean shutdown sequence and that the
kernel should wait for some secs before powering off.

We can do that for select devices but I want something more than "this
SMART counter is getting incremented" before doing that.

Thanks.

-- 
tejun
