Received: from mail-ob0-x22c.google.com ([2607:f8b0:4003:c01::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZDHml-0006Px-VV
 for linux-mtd@lists.infradead.org; Thu, 09 Jul 2015 19:47:08 +0000
Received: by obbkm3 with SMTP id km3so178165134obb.1
 for <linux-mtd@lists.infradead.org>; Thu, 09 Jul 2015 12:46:46 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <02855DE82B1CA94A9115CCD637A13256CF6CC4F15B@goemail-server>
References: <02855DE82B1CA94A9115CCD637A13256CF6CC4EF02@goemail-server>
 <CAFLxGvxB5OCU_Afr_7vQ-3h8HLWNO63AK+U3gUZNX3Ry+k0U0w@mail.gmail.com>
 <02855DE82B1CA94A9115CCD637A13256CF6CC4F15B@goemail-server>
Date: Thu, 9 Jul 2015 21:46:46 +0200
Message-ID: <CAFLxGvxCQFmt=JEnMez7Wc+SyGW6sCCsgvOWuiZj+mnhsiOrxw@mail.gmail.com>
Subject: Re: Reading from UBI volume character device did not work.
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Stelling Carsten <Carsten.Stelling@goerlitz.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Carsten,

On Thu, Jul 9, 2015 at 8:39 PM, Stelling Carsten
<Carsten.Stelling@goerlitz.com> wrote:
> Thank you for your hint. After creating the volume device with ubimkvol it works.
> You are right, this approach is suboptimal, since it covers approx. 96% of the
> available pages.

But it misses the most important ones. The pages containing the headers.
Especially if Fastmap is used these pages are not even read upon attach time.

> What's the timeline for your work on the bitrot patch?

When it is done, it is done.

> Additionally, here're some of my thoughts related to the crawler:
> The crawler process might be a very long running task of several days or
> even longer. This depends on the size of the flash and the CPU load allowed
> for this task.
> The background process should not introduce high CPU load (max. 2-3%,
> but short peaks for scrubbing may be ok).
> Thus, the user wants to control the speed of reading (idle time between
> subsequent page reads).
> It is ok for the background process to sequentially process UBI volumes.
> There must not exist one crawler thread per volume.
> The crawler should terminate itself in a clean way, without accessing the flash,
> if the device is switching to runlevel 6 (shutdown). Power fail conditions are
> handled by the low level flash driver, blocking write or erase operations (not
> to be handled by UBI).
> From time to time, the user might want to persist information about the actual
> volume and PEB the crawler is working on. This, in addition to the capability to
> set the PEB to start from, this can avoid repeated processing from start, if the
> device is powered off and on repeatedly. Otherwise, PEBs at the end would
> never be reached, read and scrubbed in the process.
> It would be great, if the user can determine the status of the crawler via sysfs
> or ioctl. sysfs might be better in the sense of event driven programs. Setting
> the starting point (volume and PEB) might be helpful as said above. Thus,
> the user can persist the actual crawler status, and set the starting point to the
> PEB by himself where processing was left off at shutdown.

Yeah, this is exactly what my big plan is.
I call it ubi-healthd.
All it needs is a proper kernel interface to check any PEB for
bitflips, schedule
re-write and gathering read/write counters.
Especially for MLC nand we need it.

-- 
Thanks,
//richard
