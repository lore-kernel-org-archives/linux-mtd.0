Received: from mail-pf0-x232.google.com ([2607:f8b0:400e:c00::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b6Ofj-0004qv-KP
 for linux-mtd@lists.infradead.org; Fri, 27 May 2016 20:47:56 +0000
Received: by mail-pf0-x232.google.com with SMTP id 62so662673pfd.1
 for <linux-mtd@lists.infradead.org>; Fri, 27 May 2016 13:47:35 -0700 (PDT)
Date: Fri, 27 May 2016 13:47:31 -0700
From: Brian Norris <computersforpeace@gmail.com>
To: Florian Fainelli <f.fainelli@gmail.com>
Cc: Scott Branden <scott.branden@broadcom.com>, linux-spi@vger.kernel.org,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
 Vikram Prakash <vikram.prakash@broadcom.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Jon Mason <jon.mason@broadcom.com>,
 Andy Fung <andy.fung@broadcom.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 linux-mtd@lists.infradead.org
Subject: Re: [PATCH V2, 3/4] arm: dts: Add bcm-nsp and bcm958625k support
Message-ID: <20160527204731.GA121328@google.com>
References: <1464380097-25125-1-git-send-email-kdasu.kdev@gmail.com>
 <1464380097-25125-3-git-send-email-kdasu.kdev@gmail.com>
 <5748ADDE.2090402@broadcom.com>
 <CAGVrzcZQMSVo4LvbqJ1jcx-f7M+psWQeHQfiRS3-L7JN+C_zuw@mail.gmail.com>
 <CAGVrzcYfNTZWDAK8tW-HaALYXJo5zPjiWOxsB0mntCVdjnUwUg@mail.gmail.com>
 <CAGVrzcbhoD1zDtvBXdm8DgzzXeP0MxAMtXduZMYv+BwpiwtgkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGVrzcbhoD1zDtvBXdm8DgzzXeP0MxAMtXduZMYv+BwpiwtgkQ@mail.gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Florian,

(HTML mail. What is this??)

On Fri, May 27, 2016 at 01:33:20PM -0700, Florian Fainelli wrote:
>    On May 27, 2016 1:28 PM, "Scott Branden"
>    <[1]scott.branden@broadcom.com> wrote:
> 
>    >> +&qspi {
>    >> +       bspi-sel = <0>;
>    >> +       flash: m25p80@0 {
>    >> +               #address-cells = <1>;
>    >> +               #size-cells = <1>;
>    >> +               compatible = "m25p80";
>    >> +               reg = <0x0>;
>    >> +               spi-max-frequency = <12500000>;
>    >> +               m25p,fast-read;
>    >> +               spi-cpol;
>    >> +               spi-cpha;
>    >> +
>    >> +               partition@0 {
>    >> +                       label = "boot";
>    >> +                       reg = <0x00000000 0x000a0000>;
>    >> +               };
>    >> +
>    >> +               partition@1 {
>    >> +                       label = "env";
>    >> +                       reg = <0x000a0000 0x00060000>;
>    >> +               };
>    >> +
>    >> +               partition@2 {
>    >> +                       label = "system";
>    >> +                       reg = <0x00100000 0x00600000>;
>    >> +               };
>    >> +
>    >> +               partition@3 {
>    >> +                       label = "rootfs";
>    >> +                       reg = <0x00700000 0x01900000>;
>    >> +               };
>    >
>    >
>    > The partitions are applications specific so should be passed on the
>    boot command line rather than embedded in the dts file.

Scott kinda has a point; they can be application specific, and so in
some cases, you might want to avoid putting this description in DT, at
least if there are good alternatives. The command line may or may not be
a good alternative (I don't think it's a very good one).

>    Partitions are typically part of the platform definition and are
>    suitable for being in Device Tree. AFAICT there is not a good way to
>    supply partitions in an OF configuration other than putting them in DT
>    at the moment. There is also a lot of platform inconsistency whether
>    the command line is appended, extended or overrides the command line in
>    the Device Tree, so I would not really consider this an issue here.

My intention is to allow cmdline to take priority, so you could have
application-specific overrides. If that doesn't work correctly, then
I'd consider it a bug. I know that has irked some people (e.g.,
OpenWRT?), where they deal with products where they may not control the
command line. But that's a separate issue IMO.

You might want to take a look at supporting a partition parser, if this
really is so application-specific. I had all the pieces working late
last year:

https://lkml.org/lkml/2015/12/5/9

but I unfortunately got distracted once the conversation on bindings
derailed:

https://lkml.org/lkml/2015/12/12/31

I should probably revive that...

Anyway, if you utilize that, then you can specify which parser(s) are
valid for your platform, rather than specifying the exact partition
layout.

Brian
