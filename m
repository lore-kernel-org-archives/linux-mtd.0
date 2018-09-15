Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g14nx-0001dL-ED
 for linux-mtd@lists.infradead.org; Sat, 15 Sep 2018 07:15:47 +0000
Received: by mail-wr1-x444.google.com with SMTP id a108-v6so12503777wrc.13
 for <linux-mtd@lists.infradead.org>; Sat, 15 Sep 2018 00:15:34 -0700 (PDT)
MIME-Version: 1.0
References: <fd473abd-58d2-076f-675a-fb1ac06aa984@ncentric.com>
 <20180913094630.GB634@kroah.com>
In-Reply-To: <20180913094630.GB634@kroah.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Sat, 15 Sep 2018 09:15:20 +0200
Message-ID: <CAFLxGvyz6oPbeS4KmG-O6vs26P4kB8rMwbukRVgbN-PKvcgcTA@mail.gmail.com>
Subject: Re: ubifs: regression since "ubifs: xattr: Don't operate on deleted
 inodes"
To: Greg KH <gregkh@linuxfoundation.org>
Cc: koen.vandeputte@ncentric.com,
 "linux-mtd @ lists . infradead . org" <linux-mtd@lists.infradead.org>,
 stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Koen,

On Thu, Sep 13, 2018 at 12:09 PM gregkh@linuxfoundation.org
<gregkh@linuxfoundation.org> wrote:
>
> adding stable@ for stable kernel issues...
>
> On Thu, Sep 13, 2018 at 09:58:35AM +0200, Koen Vandeputte wrote:
> > Hi all,
> >
> > I'm currently in the process of updating the kernel version within OpenWrt.
> > (4.14.68 to 4.14.69)
> >
> > Testing shows some issues on devices using specifically UBIFS.
> > Altering a perfect valid writable file shows weird errors:
> >
> >
> > [ Node 2 | node-2 ] ls -l /root/custom/scripts/banner.sh
> > -rwxr-xr-x    1 root     root           283 Sep 11 09:52
> > /root/custom/scripts/banner.sh
> >
> > [ Node 2 | node-2 ] cat /root/custom/scripts/banner.sh
> > #!/bin/sh
> >
> > if [ ! -f /root/.banner_ok ]
> > then
> >     RELEASE=$(cat /root/build_date)
> >     VERSION=$(cat /root/version)
> >
> >     echo "Generating banner: $VERSION $RELEASE"
> >     sed s/VERSION/$VERSION/g /root/custom/banner > /etc/banner
> >     sed -i s/RELEASE/$RELEASE/g /etc/banner
> >
> >     touch /root/.banner_ok
> > fi
> >
> > [ Node 2 | node-2 ] echo "test" > /root/custom/scripts/banner.sh
> > -ash: can't create /root/custom/scripts/banner.sh: nonexistent directory
> >
> >
> >
> > I'm also noticing other apps fail because /etc doesn't exists yet after
> > UBIFS boot loading.
> > these 2 issues were not seen on 4.14.68.
> >
> > The bootlog doesn't show any error:
> > https://pastebin.com/raw/dJx47uBp
> >
> >
> > I'm only seeing these issues on UBIFS enabled volumes.
> > Reverting ("ubifs: xattr: Don't operate on deleted inodes") fixes these
> > weird issues.

Please see my answer to the other thread.
Always keep the patch author on CC and don't start multiple threads for the
same issue on two mailing lists.
Yes, I didn't answer for three days, I had no internet connection...

-- 
Thanks,
//richard
