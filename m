Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Taxix-000129-MW
 for linux-mtd@lists.infradead.org; Tue, 20 Nov 2012 23:59:28 +0000
Received: by mail-bk0-f49.google.com with SMTP id jm19so1451065bkc.36
 for <linux-mtd@lists.infradead.org>; Tue, 20 Nov 2012 15:59:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1353451183-18807-1-git-send-email-elezegarcia@gmail.com>
References: <1353451183-18807-1-git-send-email-elezegarcia@gmail.com>
Date: Wed, 21 Nov 2012 00:59:22 +0100
Message-ID: <CAFLxGvxuRtbvTob0j-YgfK6Ydz9TVCdjD5NOToyyKQb2S7bC9Q@mail.gmail.com>
Subject: Re: [RFC/PATCH 1/1] ubi: Add ubiblock driver
From: richard -rw- weinberger <richard.weinberger@gmail.com>
To: Ezequiel Garcia <elezegarcia@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 michael.opdenacker@free-electrons.com, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, Tim Bird <tim.bird@am.sony.com>,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 20, 2012 at 11:39 PM, Ezequiel Garcia <elezegarcia@gmail.com> wrote:
> Block device emulation on top of ubi volumes with read/write support.
> Block devices get automatically created for each ubi volume present.
>
> Each ubiblock is fairly cheap since it's based on workqueues
> and not on threads.
>
> Read/write access is expected to work fairly well because the
> request queue at block elevator orders block transfers to be space-effective.
> In other words, it's expected that reads and writes gets ordered
> to point to the same LEB.
>
> To help this and reduce access to the UBI volume, a 1-LEB size
> write-back cache has been implemented.
> Every read and every write, goes through this cache and the write is
> only done when a request arrives to read or write to a different LEB
> or when the device is released, when the last file handle is closed.

Did you also benchmark your driver with two caches?
(One for reading and one for writing.)
By using two caches you can lower the amount of atomic LEB changes.

Maybe it would be also good to ensure that an cache entry becomes not too old.

-- 
Thanks,
//richard
