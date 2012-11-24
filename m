Received: from mail-ia0-f177.google.com ([209.85.210.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TcMsP-0002Ex-Qr
 for linux-mtd@lists.infradead.org; Sat, 24 Nov 2012 21:03:02 +0000
Received: by mail-ia0-f177.google.com with SMTP id u21so6814695ial.36
 for <linux-mtd@lists.infradead.org>; Sat, 24 Nov 2012 13:02:59 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20121121110518.3147bd34@skate>
References: <CALF0-+WuaUn5b=2XrzqW7pvM=N1MfQf=sFwLFOrokTkHbOXh3w@mail.gmail.com>
 <alpine.DEB.2.00.1211210626110.357@lnxricardw.se.axis.com>
 <20121121105636.4c8687e0@skate>
 <alpine.DEB.2.00.1211211059540.21683@lnxricardw.se.axis.com>
 <20121121110518.3147bd34@skate>
Date: Sat, 24 Nov 2012 18:02:59 -0300
Message-ID: <CALF0-+W-Ont1bhn_Go4YRBEpEk46=cXWGJPckAeKPgqwy+QUFw@mail.gmail.com>
Subject: Re: [RFC/PATCH 0/1] ubi: Add ubiblock driver
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Ricard Wanderlof <ricard.wanderlof@axis.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
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

Hi Thomas and everyone,

On Wed, Nov 21, 2012 at 7:05 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Ricard Wanderlof,
>
> On Wed, 21 Nov 2012 11:00:49 +0100, Ricard Wanderlof wrote:
>
>> > The idea, when David Wagner implemented this, was to be able to use
>> > read-only block filesystems such as squashfs on top of a UBI volume.
>> > squashfs provides an excellent compression ratio, which makes it
>> > interesting.
>>
>> Yes, I agree, that would be useful.
>
> Yes, but only the read-only side of ubiblock. The write side is
> dangerous and useless, IMO.
>

I've started working on a workload scenario to measure if ubiblock write
is useful or just plain nonsense.

This scenario is based on qemu + nandsim, and the workloads
consists on mounting a fs over nandsim and untaring an armstrong distribution.
I plan to compare eraseblock wear on ubifs, jffs2, ubiblock+ext2, ubiblock+f2fs.

To get eraseblock wear I've patched nandsim to output wear report
on a debugfs entry, instead of printing it.
I'll post this patch in case because it may turn out to be useful.

Since read-only ubiblock is less controversial, I'll post a read-only
version of ubiblock (with an option to use a vmalloced
buffer to cache reads?).
We can add write support later, if it's not useless.

Any thoughts?

Thanks,

    Ezequiel
