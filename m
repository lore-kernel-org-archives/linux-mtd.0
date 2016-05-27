Received: from mail-pa0-x244.google.com ([2607:f8b0:400e:c03::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1b6PKl-0002kf-GL
 for linux-mtd@lists.infradead.org; Fri, 27 May 2016 21:30:20 +0000
Received: by mail-pa0-x244.google.com with SMTP id yl2so13722901pac.1
 for <linux-mtd@lists.infradead.org>; Fri, 27 May 2016 14:29:59 -0700 (PDT)
Subject: Re: [PATCH V2, 3/4] arm: dts: Add bcm-nsp and bcm958625k support
To: Brian Norris <computersforpeace@gmail.com>
References: <1464380097-25125-1-git-send-email-kdasu.kdev@gmail.com>
 <1464380097-25125-3-git-send-email-kdasu.kdev@gmail.com>
 <5748ADDE.2090402@broadcom.com>
 <CAGVrzcZQMSVo4LvbqJ1jcx-f7M+psWQeHQfiRS3-L7JN+C_zuw@mail.gmail.com>
 <CAGVrzcYfNTZWDAK8tW-HaALYXJo5zPjiWOxsB0mntCVdjnUwUg@mail.gmail.com>
 <CAGVrzcbhoD1zDtvBXdm8DgzzXeP0MxAMtXduZMYv+BwpiwtgkQ@mail.gmail.com>
 <20160527204731.GA121328@google.com>
Cc: Scott Branden <scott.branden@broadcom.com>, linux-spi@vger.kernel.org,
 Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
 Vikram Prakash <vikram.prakash@broadcom.com>,
 Kamal Dasu <kdasu.kdev@gmail.com>, Jon Mason <jon.mason@broadcom.com>,
 Andy Fung <andy.fung@broadcom.com>,
 bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
 linux-mtd@lists.infradead.org
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <5748BC55.5080507@gmail.com>
Date: Fri, 27 May 2016 14:29:57 -0700
MIME-Version: 1.0
In-Reply-To: <20160527204731.GA121328@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 05/27/2016 01:47 PM, Brian Norris wrote:
> Hi Florian,
> 
> (HTML mail. What is this??)

Made the mistake to reply with the Gmail application on my cellphone,
does not look like they addressed my feature request ;)


>>    > The partitions are applications specific so should be passed on the
>>    boot command line rather than embedded in the dts file.
> 
> Scott kinda has a point; they can be application specific, and so in
> some cases, you might want to avoid putting this description in DT, at
> least if there are good alternatives. The command line may or may not be
> a good alternative (I don't think it's a very good one).

Fair enough

> 
>>    Partitions are typically part of the platform definition and are
>>    suitable for being in Device Tree. AFAICT there is not a good way to
>>    supply partitions in an OF configuration other than putting them in DT
>>    at the moment. There is also a lot of platform inconsistency whether
>>    the command line is appended, extended or overrides the command line in
>>    the Device Tree, so I would not really consider this an issue here.
> 
> My intention is to allow cmdline to take priority, so you could have
> application-specific overrides. If that doesn't work correctly, then
> I'd consider it a bug. I know that has irked some people (e.g.,
> OpenWRT?), where they deal with products where they may not control the
> command line. But that's a separate issue IMO.

I think this behavior makes sense, my problem is more with the fact that
different architecture behave differently with respect to providing the
command line to the kernel, some support taking the bootloader argument
and merging it with the built-in/Device Tree bootargs command line, some
do not, it's not always obvious.

> 
> You might want to take a look at supporting a partition parser, if this
> really is so application-specific. I had all the pieces working late
> last year:
> 
> https://lkml.org/lkml/2015/12/5/9
> 
> but I unfortunately got distracted once the conversation on bindings
> derailed:
> 
> https://lkml.org/lkml/2015/12/12/31
> 
> I should probably revive that...
> 
> Anyway, if you utilize that, then you can specify which parser(s) are
> valid for your platform, rather than specifying the exact partition
> layout.

/me goes reading, thanks!
-- 
Florian
