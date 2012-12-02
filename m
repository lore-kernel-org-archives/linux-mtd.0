Received: from mail-ee0-f49.google.com ([74.125.83.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TfDWR-0004xb-46
 for linux-mtd@lists.infradead.org; Sun, 02 Dec 2012 17:40:07 +0000
Received: by mail-ee0-f49.google.com with SMTP id c4so1190141eek.36
 for <linux-mtd@lists.infradead.org>; Sun, 02 Dec 2012 09:40:05 -0800 (PST)
Date: Sun, 2 Dec 2012 19:39:54 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: dedekind1@gmail.com
Subject: Re: [RFC/PATCH 0/1] ubi: Add ubiblock driver
Message-ID: <20121202193954.2dd3ea8f@pixies.home.jungo.com>
In-Reply-To: <1354274647.30168.99.camel@sauron.fi.intel.com>
References: <CALF0-+WuaUn5b=2XrzqW7pvM=N1MfQf=sFwLFOrokTkHbOXh3w@mail.gmail.com>
 <alpine.DEB.2.00.1211210626110.357@lnxricardw.se.axis.com>
 <20121121105636.4c8687e0@skate>
 <alpine.DEB.2.00.1211211059540.21683@lnxricardw.se.axis.com>
 <20121121110518.3147bd34@skate>
 <CALF0-+W-Ont1bhn_Go4YRBEpEk46=cXWGJPckAeKPgqwy+QUFw@mail.gmail.com>
 <20121125093621.47f9cb25@pixies.home.jungo.com>
 <1354274647.30168.99.camel@sauron.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ezequiel Garcia <elezegarcia@gmail.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Michael Opdenacker <michael.opdenacker@free-electrons.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Tim Bird <tim.bird@am.sony.com>, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

On Fri, 30 Nov 2012 13:24:07 +0200 Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Sun, 2012-11-25 at 09:36 +0200, Shmulik Ladkani wrote:
> > I'm not sure this is possible in ubiblock case, due to the 1-LEB
> > writeback cache: if a file (in the mounted fs) is synced, are there any
> > guarantees the 1-LEB cache is flushed synchronously?
> > (you mentioned the actual write is only done when a request arrives to
> > read or write to a different LEB or when the device is released).
> 
> Why would not it be? ubiblk is just like a hard drive or and SSD fro a
> file-system. If it caches something, it is just like an internal disk
> cache. The I/O barrier should flush it. And we have an atomic LEB change
> operation, so when you want to change the LEB contents, you can do it in
> power-cut-safe manner.
> 
> Do I miss something?

Yes, I guess this makes sense.

To my undesrtanding, the ubiblock fetches requests from the request
queue, and executes them (ubi leb read/write, or using its internal
cache).
What would be the actual indication mechanism that notifies ubiblock to
flush its internal cache? Is it a part of the request structure?

Regards,
Shmulik
