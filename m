Received: from mail-ia0-f179.google.com ([209.85.210.179])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TfKMm-0008Ko-NR
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2012 00:58:37 +0000
Received: by mail-ia0-f179.google.com with SMTP id o25so1700552iad.10
 for <linux-mtd@lists.infradead.org>; Sun, 02 Dec 2012 16:58:35 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20121202193954.2dd3ea8f@pixies.home.jungo.com>
References: <CALF0-+WuaUn5b=2XrzqW7pvM=N1MfQf=sFwLFOrokTkHbOXh3w@mail.gmail.com>
 <alpine.DEB.2.00.1211210626110.357@lnxricardw.se.axis.com>
 <20121121105636.4c8687e0@skate>
 <alpine.DEB.2.00.1211211059540.21683@lnxricardw.se.axis.com>
 <20121121110518.3147bd34@skate>
 <CALF0-+W-Ont1bhn_Go4YRBEpEk46=cXWGJPckAeKPgqwy+QUFw@mail.gmail.com>
 <20121125093621.47f9cb25@pixies.home.jungo.com>
 <1354274647.30168.99.camel@sauron.fi.intel.com>
 <20121202193954.2dd3ea8f@pixies.home.jungo.com>
Date: Sun, 2 Dec 2012 21:58:33 -0300
Message-ID: <CALF0-+WLGSq6tNBExt9PFJccAeKwj0BpVb7vVwQit39xbFiq4A@mail.gmail.com>
Subject: Re: [RFC/PATCH 0/1] ubi: Add ubiblock driver
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: Shmulik Ladkani <shmulik.ladkani@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>, dedekind1@gmail.com,
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

Shmulik,

On Sun, Dec 2, 2012 at 2:39 PM, Shmulik Ladkani
<shmulik.ladkani@gmail.com> wrote:
> Hi Artem,
>
> On Fri, 30 Nov 2012 13:24:07 +0200 Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> On Sun, 2012-11-25 at 09:36 +0200, Shmulik Ladkani wrote:
>> > I'm not sure this is possible in ubiblock case, due to the 1-LEB
>> > writeback cache: if a file (in the mounted fs) is synced, are there any
>> > guarantees the 1-LEB cache is flushed synchronously?
>> > (you mentioned the actual write is only done when a request arrives to
>> > read or write to a different LEB or when the device is released).
>>
>> Why would not it be? ubiblk is just like a hard drive or and SSD fro a
>> file-system. If it caches something, it is just like an internal disk
>> cache. The I/O barrier should flush it. And we have an atomic LEB change
>> operation, so when you want to change the LEB contents, you can do it in
>> power-cut-safe manner.
>>
>> Do I miss something?
>
> Yes, I guess this makes sense.
>
> To my undesrtanding, the ubiblock fetches requests from the request
> queue, and executes them (ubi leb read/write, or using its internal
> cache).
> What would be the actual indication mechanism that notifies ubiblock to
> flush its internal cache? Is it a part of the request structure?
>

I believe that this is done through req->cmd_flag & REQ_FLUSH.

You can search REQ_FLUSH in drivers/block/loop.c or drivers/scsi/sd.c.

AFAIK, this the only mechanism to notify a block device to flush its cache.
Am I wrong? Is there another one?

    Ezequiel
