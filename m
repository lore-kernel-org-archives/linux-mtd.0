Received: from mail-wi0-f177.google.com ([209.85.212.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rpmmr-0004p7-Er
 for linux-mtd@lists.infradead.org; Tue, 24 Jan 2012 20:16:14 +0000
Received: by wico1 with SMTP id o1so855784wic.36
 for <linux-mtd@lists.infradead.org>; Tue, 24 Jan 2012 12:16:11 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <201201241024.22372.brian.foster@maxim-ic.com>
References: <201201241024.22372.brian.foster@maxim-ic.com>
Date: Tue, 24 Jan 2012 12:16:11 -0800
Message-ID: <CAN8TOE-Jp50bmpn-c_zWgB7KHXZ54y3LM9BTSA6yiEnF3nkkGA@mail.gmail.com>
Subject: Re: [BUG v1.4.6] `ubinfo -a' confused about non-consecutive UBI
 device numbers
From: Brian Norris <computersforpeace@gmail.com>
To: Brian Foster <brian.foster@maxim-ic.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Jan 24, 2012 at 1:24 AM, Brian Foster <brian.foster@maxim-ic.com> w=
rote:
> =A0Using mtd-utils v1.4.6 with a v2.6.36 Linux kernel,
> =A0if I have non-consecutive UBI device numbers (in the
> =A0example below, =91ubi0=92 and =91ubi10=92), then =91ubinfo -a=92,
> =A0after printing the info for =91ubi0=92, errors with:
>
> =A0 =A0ubinfo: error!: cannot get information about UBI device 1
> =A0 =A0 =A0 =A0 =A0 =A0error 2 (No such file or directory)
...
> =A0I have not investigated, nor tried other/recent versions.

Still present on current git. The fix doesn't look too bad. I'll
probably send a fix in the next few days.

Brian
