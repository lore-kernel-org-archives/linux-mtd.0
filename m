Received: from mail-oi0-x232.google.com ([2607:f8b0:4003:c06::232])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cipHx-0002fP-3G
 for linux-mtd@lists.infradead.org; Tue, 28 Feb 2017 21:26:31 +0000
Received: by mail-oi0-x232.google.com with SMTP id 2so12721389oif.0
 for <linux-mtd@lists.infradead.org>; Tue, 28 Feb 2017 13:26:08 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAPDE7Z9-ZF7s=RMHbqM-KZD7m+Zh5m+orFi4F6zDKOzPWbzDeg@mail.gmail.com>
References: <CAPDE7Z8=Xo=Ko4CKRNL=EsGZ+bLoU1CCgebNv-aqXrtnihX2wA@mail.gmail.com>
 <CAPDE7Z9-ZF7s=RMHbqM-KZD7m+Zh5m+orFi4F6zDKOzPWbzDeg@mail.gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Tue, 28 Feb 2017 22:26:07 +0100
Message-ID: <CAFLxGvxc49kvDKZ18Z+McSnRNMY3jXVciAaTf9bk30cSpwXMcw@mail.gmail.com>
Subject: Re: Why UBIFS mount partition showing already mounted on reboot?
To: Pankaj <getpankaj.joshi@gmail.com>
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

Pankaj,

On Tue, Feb 28, 2017 at 5:15 AM, Pankaj <getpankaj.joshi@gmail.com> wrote:
> Hi,
>
> I am having kernel version: 3.3.8-2.5. I have one ubifs volume.
> Everytime i do clean/unclean reboot, i do a ubiattach and then mount
> using below commands.
>
> ubiattach /dev/ubi_ctrl -m 14
> mount -t ubifs ubi1:app0 /mnt/fsm0/
>
> Sometimes, mount is failed saying
> mount: ubi1:app0 already mounted or /mnt/fsm0 busy

Maybe some automount magic mounts it in between? (systemd?)

-- 
Thanks,
//richard
