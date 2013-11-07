Received: from mail-qe0-x22a.google.com ([2607:f8b0:400d:c02::22a])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VeTVd-00068d-QO
 for linux-mtd@lists.infradead.org; Thu, 07 Nov 2013 17:36:46 +0000
Received: by mail-qe0-f42.google.com with SMTP id gc15so788319qeb.29
 for <linux-mtd@lists.infradead.org>; Thu, 07 Nov 2013 09:36:21 -0800 (PST)
Message-ID: <527BCF93.6030207@gmail.com>
Date: Thu, 07 Nov 2013 12:36:19 -0500
From: Matthew Gabeler-Lee <fastcat@gmail.com>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>
Subject: Re: [PATCH] mtd: nandsim: Allow nandsim to re-use persisted data
References: <alpine.DEB.2.10.1309251518370.22371@cheetah.fastcat.org>
 <CAFLxGvydWpQr_hMN8G=YViqgOOpJ=iSUu1sY0Eiurp-z=X55gQ@mail.gmail.com>
In-Reply-To: <CAFLxGvydWpQr_hMN8G=YViqgOOpJ=iSUu1sY0Eiurp-z=X55gQ@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: pratibha@codeaurora.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 Tanya Brokhman <tlinder@codeaurora.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 11/07/2013 10:12 AM, Richard Weinberger wrote:
> Hi!

Hi! Thanks for taking a look at this.  PS: First kernel patch I've ever
done...

> On Wed, Sep 25, 2013 at 9:25 PM, Matthew Gabeler-Lee <fastcat@gmail.com> wrote:
>> @@ -592,6 +595,9 @@ static int alloc_device(struct nandsim *ns)
>>                         err = -ENOMEM;
>>                         goto err_close;
>>                 }
>> +               if (cache_file_written) {
>> +                       memset(ns->pages_written, 0xFF, ns->geom.pgnum);
>> +               }
> 
> Hmm, that's a very ugly hack.
> It will slow down nandsim because now it will ask the file cache every time.
> 
> If you want persistent storage we'd need a sane file format with header
> which contains the page_written bitmask, the nand geometry, etc....

Agreed that it's a hack.  My thought process was to a) minimize the
changes and b) have the resulting persisted image be usable to write to
a real flash device, if that was desired.  I'm not sure if the OOB data
would make part b not actually work, though.  I agree that a real file
format (or split files) that tracks metadata would be better overall.
It would beg for some userspace tools to work with it.

As far as performance is concerned, if considering a real file format,
in my testing it appeared that the non-aligned writes resulting from the
OOB bytes may also have been a problem.  AFAICT my application (UBI/FS)
never actually accesses those OOB bytes, so getting creative with where
they are stored in a file format could have some benefits.
