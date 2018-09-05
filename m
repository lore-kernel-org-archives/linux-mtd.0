Received: from martinlund.org ([173.255.130.145]
 helo=slmp-550-86.slc.westdc.net)
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1fxXTw-0003F0-Iz
 for linux-mtd@lists.infradead.org; Wed, 05 Sep 2018 13:04:30 +0000
Received: from mail-oi0-f49.google.com ([209.85.218.49]:43927)
 by slmp-550-86.slc.westdc.net with esmtpsa
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.91)
 (envelope-from <martin.lund@keep-it-simple.com>) id 1fxXT4-004FHi-9e
 for linux-mtd@lists.infradead.org; Wed, 05 Sep 2018 07:03:34 -0600
Received: by mail-oi0-f49.google.com with SMTP id b15-v6so13351871oib.10
 for <linux-mtd@lists.infradead.org>; Wed, 05 Sep 2018 06:03:34 -0700 (PDT)
MIME-Version: 1.0
References: <20180828083113.18198-1-malu@gomspace.com>
 <d2063942-07f2-35f3-d9e3-2929155e8b56@sigma-star.at>
In-Reply-To: <d2063942-07f2-35f3-d9e3-2929155e8b56@sigma-star.at>
From: Martin Lund <martin.lund@keep-it-simple.com>
Date: Wed, 5 Sep 2018 15:03:22 +0200
Message-ID: <CAB7pii01YJmE-ugOYJrHGLQwatg=5NBuajbC1VwYGYnWqswoJA@mail.gmail.com>
Subject: Re: [PATCH mtd-utils] ubi-tests: io_paral: Fix error handling of
 update_volume()
To: david.oberhollenzer@sigma-star.at
Cc: Martin Lund <malu@gomspace.com>, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

You are right - good catch. While my patch is a common solution it
does not apply to all platforms. I'll rework the patch.

Thanks.
Martin
On Tue, Sep 4, 2018 at 9:15 AM David Oberhollenzer
<david.oberhollenzer@sigma-star.at> wrote:
>
> Hi,
>
> generally, your approach seams reasonable. However there is one small issue with
> your patch:
>
> On 08/28/2018 10:31 AM, Martin Lund wrote:
> > @@ -302,7 +302,14 @@ int main(int argc, char * const argv[])
> >       }
> >
> >       for (i = 0; i < THREADS_NUM; i++)
> > -             pthread_join(threads[i], NULL);
> > +     {
> > +             pthread_join(threads[i], (void **) &ret);
> > +             if (ret != 0)
> > +                     error = true;
> > +     }
> > +
>
> "ret" happens to be an integer, you take a pointer to it and cast it to a pointer
> to a void*, which receives the result from the thread function.
>
> There are platforms where sizeof(void*) != sizeof(int)
>
> Minor nit pick: the '{' should be on the same line as the for, similar to the rest
> of the code.
>
> Thanks,
>
> David
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
