Received: from mx.novero.com ([212.23.138.198])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b8kHl-0007Bf-LS
 for linux-mtd@lists.infradead.org; Fri, 03 Jun 2016 08:16:54 +0000
Received: from novexc01.internal.novero.com ([10.121.42.25]:29594)
 by mx.novero.com with esmtps (TLSv1:AES256-SHA:256)
 (Exim 4.82_1-5b7a7c0-XX) (envelope-from <Sven.Eisenberg@novero.com>)
 id 1b8kHN-0000yB-27
 for linux-mtd@lists.infradead.org; Fri, 03 Jun 2016 10:16:29 +0200
From: Sven Eisenberg <sven.eisenberg@novero.com>
Subject: Re: Data not freed after remove?
To: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <574EC86D.8030002@novero.com>
 <CAFLxGvxZS_aqoR059M3aE9zz+TZ-VNhh9vpMNRJYL-97ZFrgZA@mail.gmail.com>
Message-ID: <57513CDD.8090006@novero.com>
Date: Fri, 3 Jun 2016 10:16:29 +0200
MIME-Version: 1.0
In-Reply-To: <CAFLxGvxZS_aqoR059M3aE9zz+TZ-VNhh9vpMNRJYL-97ZFrgZA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard and all

On 01.06.2016 13:55, Richard Weinberger wrote:
> ...
> What is the return code of mount()?
>
> > Is there any reason/bug known that would cause this behavior?
>
> Hmm, I don't know.
>
> > I know this can happen, when there i an open filedescriptor to the file.
> > So i verified and this is not the case for me.
>
> Yes, remount can fail if the volume is busy. That's why i wonder what
> the return code is.

Yes the volume is busy:
mount -o remount,ro /mnt/point  = -1 EBUSY (Device or resource busy)

I could not yet identify why it is in busy state.

I added some code to check for open file descriptors. I built a test
application which simulates the sequence. But it runs without a problem.
Can i get informations from the kernel, what file or state causes the
busy state?

br, Sven Eisenberg
