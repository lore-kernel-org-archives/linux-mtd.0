Received: from mail-lpp01m010-f49.google.com ([209.85.215.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T5wQg-0002XN-VH
 for linux-mtd@lists.infradead.org; Mon, 27 Aug 2012 10:20:23 +0000
Received: by lagu2 with SMTP id u2so2293507lag.36
 for <linux-mtd@lists.infradead.org>; Mon, 27 Aug 2012 03:20:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1346060377.2848.345.camel@sauron.fi.intel.com>
References: <1345651477-5301-1-git-send-email-richard.genoud@gmail.com>
 <1345651477-5301-4-git-send-email-richard.genoud@gmail.com>
 <1345714184.2848.220.camel@sauron.fi.intel.com>
 <CACQ1gAi4uJkiYyfUsnv-k9M8Me1ROzCbe6msoLV=4qn=gL0tTA@mail.gmail.com>
 <1346060377.2848.345.camel@sauron.fi.intel.com>
From: Richard Genoud <richard.genoud@gmail.com>
Date: Mon, 27 Aug 2012 12:19:58 +0200
Message-ID: <CACQ1gAhUFSK-a2cL-Bp-nf2RFNC_hH7u3dSmTq5u+61jUt35mw@mail.gmail.com>
Subject: Re: [PATCH MTD-UTILS v2 3/4] ubiattach: introduce max_beb_per1024 in
 UBI_IOCATT
To: dedekind1@gmail.com
Content-Type: text/plain; charset=UTF-8
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/8/27 Artem Bityutskiy <dedekind1@gmail.com>:
> On Mon, 2012-08-27 at 09:23 +0200, Richard Genoud wrote:
>> Could you push your git to mtd-utils so that I can test the final
>> version, please ?
>
> It is pushed, the latest commit is:
>
> commit 9d8751b3f5c6358b6167c38899f1e41498d24a45
> Author: Richard Genoud <richard.genoud@gmail.com>
> Date:   Wed Aug 22 18:04:37 2012 +0200
>
>     ubiattach: fail if kernel ignores max_beb_per1024
>
>     If the kernel doesn't know the max_beb_per1024 parameter in the attach
>     ioctl, but the call still succeeded ubi_attach and ubi_attach_mtd will
>     return 1 instead of 0.
>
>     In this case, the ubiattach command will detach the device and fail with
>     an error message.
>
>     Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
>     Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

hum.... I must be looking at the wrong git tree.
I had this one : http://git.infradead.org/mtd-utils.git
with the last commit "UBI: sync ubi-user.h with kernel v3.6-rc1"
312e784fb06eaafff4cfebe29c74b8d0ecc09167
