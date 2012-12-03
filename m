Received: from mail-ie0-f177.google.com ([209.85.223.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TfblH-00073j-Sp
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2012 19:33:04 +0000
Received: by mail-ie0-f177.google.com with SMTP id k13so4667014iea.36
 for <linux-mtd@lists.infradead.org>; Mon, 03 Dec 2012 11:33:02 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CALF0-+WLGSq6tNBExt9PFJccAeKwj0BpVb7vVwQit39xbFiq4A@mail.gmail.com>
References: <CALF0-+WuaUn5b=2XrzqW7pvM=N1MfQf=sFwLFOrokTkHbOXh3w@mail.gmail.com>
 <alpine.DEB.2.00.1211210626110.357@lnxricardw.se.axis.com>
 <20121121105636.4c8687e0@skate>
 <alpine.DEB.2.00.1211211059540.21683@lnxricardw.se.axis.com>
 <20121121110518.3147bd34@skate>
 <CALF0-+W-Ont1bhn_Go4YRBEpEk46=cXWGJPckAeKPgqwy+QUFw@mail.gmail.com>
 <20121125093621.47f9cb25@pixies.home.jungo.com>
 <1354274647.30168.99.camel@sauron.fi.intel.com>
 <20121202193954.2dd3ea8f@pixies.home.jungo.com>
 <CALF0-+WLGSq6tNBExt9PFJccAeKwj0BpVb7vVwQit39xbFiq4A@mail.gmail.com>
Date: Mon, 3 Dec 2012 16:33:01 -0300
Message-ID: <CALF0-+Vab6HZX-yRh0N6HxRSu4GavNXTpzrF6Ry7sDFwAXMHeg@mail.gmail.com>
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

On Sun, Dec 2, 2012 at 9:58 PM, Ezequiel Garcia <elezegarcia@gmail.com> wrote:
[...]
>>
>> To my undesrtanding, the ubiblock fetches requests from the request
>> queue, and executes them (ubi leb read/write, or using its internal
>> cache).
>> What would be the actual indication mechanism that notifies ubiblock to
>> flush its internal cache? Is it a part of the request structure?
>>
>
> I believe that this is done through req->cmd_flag & REQ_FLUSH.
>
> You can search REQ_FLUSH in drivers/block/loop.c or drivers/scsi/sd.c.
>
> AFAIK, this the only mechanism to notify a block device to flush its cache.
> Am I wrong? Is there another one?
>

After a:

  $ git grep "REQ_FLUSH"

I discovered there is a document at
Documentation/block/writeback_cache_control.txt
wich is an excellent resource on block driver's writeback caches.

So "git grep" is my new favorite tool ;-) credit goes to Thomas Petazzoni [1].

Hope this helps,

    Ezequiel

[1] http://elinux.org/Tim's_Tips_and_Tricks
