Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCr21-0006NC-SS
 for linux-mtd@lists.infradead.org; Tue, 14 Jun 2016 16:17:38 +0000
Received: by mail-oi0-x22e.google.com with SMTP id d132so160381659oig.1
 for <linux-mtd@lists.infradead.org>; Tue, 14 Jun 2016 09:17:16 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <57513CDD.8090006@novero.com>
References: <574EC86D.8030002@novero.com>
 <CAFLxGvxZS_aqoR059M3aE9zz+TZ-VNhh9vpMNRJYL-97ZFrgZA@mail.gmail.com>
 <57513CDD.8090006@novero.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 14 Jun 2016 18:17:14 +0200
Message-ID: <CAFLxGvx8mXHNq=Ug6bRWszybhfLvGAfVi0p06kRCe_ZyrW0vEw@mail.gmail.com>
Subject: Re: Data not freed after remove?
To: Sven Eisenberg <sven.eisenberg@novero.com>
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

Sven,

On Fri, Jun 3, 2016 at 10:16 AM, Sven Eisenberg
<sven.eisenberg@novero.com> wrote:
>> Yes, remount can fail if the volume is busy. That's why i wonder what
>> the return code is.
>
> Yes the volume is busy:
> mount -o remount,ro /mnt/point  = -1 EBUSY (Device or resource busy)
>
> I could not yet identify why it is in busy state.
>
> I added some code to check for open file descriptors. I built a test
> application which simulates the sequence. But it runs without a problem.
> Can i get informations from the kernel, what file or state causes the
> busy state?

EBUSY can have many reasons. I'd guess an open file in RW mode.
Did you try lsof?

-- 
Thanks,
//richard
