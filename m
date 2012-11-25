Received: from mail-ea0-f177.google.com ([209.85.215.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TcWlY-0002XF-Ck
 for linux-mtd@lists.infradead.org; Sun, 25 Nov 2012 07:36:37 +0000
Received: by mail-ea0-f177.google.com with SMTP id c10so2221608eaa.36
 for <linux-mtd@lists.infradead.org>; Sat, 24 Nov 2012 23:36:32 -0800 (PST)
Date: Sun, 25 Nov 2012 09:36:21 +0200
From: Shmulik Ladkani <shmulik.ladkani@gmail.com>
To: Ezequiel Garcia <elezegarcia@gmail.com>
Subject: Re: [RFC/PATCH 0/1] ubi: Add ubiblock driver
Message-ID: <20121125093621.47f9cb25@pixies.home.jungo.com>
In-Reply-To: <CALF0-+W-Ont1bhn_Go4YRBEpEk46=cXWGJPckAeKPgqwy+QUFw@mail.gmail.com>
References: <CALF0-+WuaUn5b=2XrzqW7pvM=N1MfQf=sFwLFOrokTkHbOXh3w@mail.gmail.com>
 <alpine.DEB.2.00.1211210626110.357@lnxricardw.se.axis.com>
 <20121121105636.4c8687e0@skate>
 <alpine.DEB.2.00.1211211059540.21683@lnxricardw.se.axis.com>
 <20121121110518.3147bd34@skate>
 <CALF0-+W-Ont1bhn_Go4YRBEpEk46=cXWGJPckAeKPgqwy+QUFw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Ricard Wanderlof <ricard.wanderlof@axis.com>,
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

Hi Ezequiel,

On Sat, 24 Nov 2012 18:02:59 -0300 Ezequiel Garcia <elezegarcia@gmail.com> wrote:
> I've started working on a workload scenario to measure if ubiblock write
> is useful or just plain nonsense.

Please note eraseblock wear is just one aspect of using a standard r/w
filesystem over ubiblock.

There's another potential hazard of using r/w ubiblock, which is the
lack of power-cut tolerance.
Changing a file atomically in ubifs or jffs2 is tolerant to power
cuts (see [1]).
I'm not sure this is possible in ubiblock case, due to the 1-LEB
writeback cache: if a file (in the mounted fs) is synced, are there any
guarantees the 1-LEB cache is flushed synchronously?
(you mentioned the actual write is only done when a request arrives to
read or write to a different LEB or when the device is released).

> Since read-only ubiblock is less controversial, I'll post a read-only
> version of ubiblock (with an option to use a vmalloced
> buffer to cache reads?).
> We can add write support later, if it's not useless.
> 
> Any thoughts?

Well I was about to suggest that approach :)
I would even split your patch further: the core stuff (with r/o
support), and an additional patch with all the DEBUG stuff. This may
ease reviewer's job.

Regards,
Shmulik

[1] http://www.linux-mtd.infradead.org/faq/ubifs.html#L_atomic_change
