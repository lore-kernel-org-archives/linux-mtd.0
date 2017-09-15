Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dsvNk-0006br-Tj
 for linux-mtd@lists.infradead.org; Fri, 15 Sep 2017 18:30:30 +0000
Received: by mail-wm0-x22f.google.com with SMTP id i189so10432731wmf.1
 for <linux-mtd@lists.infradead.org>; Fri, 15 Sep 2017 11:30:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <f91150f4-8aff-1069-afaf-d602c4494fdc@nedap.com>
References: <f91150f4-8aff-1069-afaf-d602c4494fdc@nedap.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Fri, 15 Sep 2017 20:30:05 +0200
Message-ID: <CAFLxGvzz0zvvvVuEJzmzHJH_z-5QzHGEETh6v2HUzLqpB6pJaQ@mail.gmail.com>
Subject: Re: ubi resize shrink volume
To: Jaap de Jong <jaap.dejong@nedap.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Sep 15, 2017 at 8:34 AM, Jaap de Jong <jaap.dejong@nedap.com> wrote:
> Hi All!
>
> I've seen a several (old) posts regarding this subject and I was wondering
> what the status at this moment is.
>
> Is there any implementation available that is able to shrink a ubi volume,
> so that it will move used blocks at the end to the front?

Not sure if I got your use case, but you can do this in userspace.

If you're asking whether it is possible to shrink UBIFS, no, this is
not possible.

-- 
Thanks,
//richard
