Received: from mail-ie0-f177.google.com ([209.85.223.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tb7Q1-0005ap-Ho
 for linux-mtd@lists.infradead.org; Wed, 21 Nov 2012 10:20:34 +0000
Received: by mail-ie0-f177.google.com with SMTP id e14so9726710iej.36
 for <linux-mtd@lists.infradead.org>; Wed, 21 Nov 2012 02:20:31 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAFLxGvxuRtbvTob0j-YgfK6Ydz9TVCdjD5NOToyyKQb2S7bC9Q@mail.gmail.com>
References: <1353451183-18807-1-git-send-email-elezegarcia@gmail.com>
 <CAFLxGvxuRtbvTob0j-YgfK6Ydz9TVCdjD5NOToyyKQb2S7bC9Q@mail.gmail.com>
Date: Wed, 21 Nov 2012 07:20:30 -0300
Message-ID: <CALF0-+UVNwAcEe5UVK9MdKYGwwubCi70DRXdWaojEUDg3uR+Xg@mail.gmail.com>
Subject: Re: [RFC/PATCH 1/1] ubi: Add ubiblock driver
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: richard -rw- weinberger <richard.weinberger@gmail.com>
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

On Tue, Nov 20, 2012 at 8:59 PM, richard -rw- weinberger
<richard.weinberger@gmail.com> wrote:
> On Tue, Nov 20, 2012 at 11:39 PM, Ezequiel Garcia <elezegarcia@gmail.com> wrote:
>> Block device emulation on top of ubi volumes with read/write support.
>> Block devices get automatically created for each ubi volume present.
>>
>> Each ubiblock is fairly cheap since it's based on workqueues
>> and not on threads.
>>
>> Read/write access is expected to work fairly well because the
>> request queue at block elevator orders block transfers to be space-effective.
>> In other words, it's expected that reads and writes gets ordered
>> to point to the same LEB.
>>
>> To help this and reduce access to the UBI volume, a 1-LEB size
>> write-back cache has been implemented.
>> Every read and every write, goes through this cache and the write is
>> only done when a request arrives to read or write to a different LEB
>> or when the device is released, when the last file handle is closed.
>
> Did you also benchmark your driver with two caches?
> (One for reading and one for writing.)
> By using two caches you can lower the amount of atomic LEB changes.
>
> Maybe it would be also good to ensure that an cache entry becomes not too old.
>

Yes, I thought of this.

For now, I decided to keep the implementation as simple as possible.

Regards,

    Ezequiel
