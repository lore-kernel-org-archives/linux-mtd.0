Received: from mail-ia0-f171.google.com ([209.85.210.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1ThzrN-0006ik-0a
 for linux-mtd@lists.infradead.org; Mon, 10 Dec 2012 09:41:14 +0000
Received: by mail-ia0-f171.google.com with SMTP id k27so3737842iad.2
 for <linux-mtd@lists.infradead.org>; Mon, 10 Dec 2012 01:41:11 -0800 (PST)
MIME-Version: 1.0
Sender: jphilippe.francois@gmail.com
In-Reply-To: <20121208082935.GA17392@parrot.com>
References: <CAGGh5h23djGTUynnoVUaGAQCuWVCDAW=PLQsvnyBVKGDfwERAQ@mail.gmail.com>
 <20121208082935.GA17392@parrot.com>
Date: Mon, 10 Dec 2012 10:41:10 +0100
Message-ID: <CAGGh5h2CoQTbOL32+f3jhtvUwCbFp7EPhL7g61PFkVGtXwAd-w@mail.gmail.com>
Subject: Re: U-boot bch4_sw vs omap bch4_hw
From: jean-philippe francois <jp.francois@cynove.com>
To: Ivan Djelic <ivan.djelic@parrot.com>
Content-Type: text/plain; charset=UTF-8
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

2012/12/8 Ivan Djelic <ivan.djelic@parrot.com>:
> On Fri, Dec 07, 2012 at 03:26:06PM +0000, jean-philippe francois wrote:
>> Hi Ivan,
>>
>> I have applied your patches for hardware bch ecc support on
>> OMAP. On the linux side, everything is fine. However I have some trouble
>> when it comes to u-boot and kernel interoperability.
>>
>> A nand page written with bch4_sw ecc by U-boot fails the ecc step when
>> read by the kernel. Looking at a nanddump, OOB placement and size of
>> the ecc data are the same.
>>
>> Do you know of any patch for u-boot that would make the  bch4_sw ecc
>> identical to the kernel one ?
>
> Hi Jean-Philippe,
>
> If you point me to a git repo with the exact u-boot version you are using=
,
> I can probably provide a patch (or at least understand the problem).
> BR,
> --
> Ivan
I am using an u-boot from the arago project :
http://arago-project.org/git/projects/?p=3Du-boot-omap3.git;a=3Dtags

So it is quite old.
I will probably have to modify x-loader, too.
Both implementation use very similar file for hardware assisted
bch decoding.

If this code is too old for you to look at, could you help me find an omap
project that "new ecc" all the way up from x-loader to u-boot + kernel ?

If I understands things correctly, I have two options if I want to use
Nand that needs
4-bit ecc :
- Stick with the old ecc scheme in x-loader and u-boot, and use
software 4-bit bch in the kernel.
  Is this compatible with using ubifs ?
- Implement new ecc scheme in x-loader and u-boot, and use hardware
assisted bch-4 in the kernel.
Is this correct ?

Thank you for your interest,

Jean-Philippe Fran=C3=A7ois.
