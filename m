Received: from moutng.kundenserver.de ([212.227.126.171])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Ti0he-0003nC-1r
 for linux-mtd@lists.infradead.org; Mon, 10 Dec 2012 10:35:16 +0000
Message-ID: <50C5BAD6.2010500@corscience.de>
Date: Mon, 10 Dec 2012 11:35:02 +0100
From: =?UTF-8?B?QW5kcmVhcyBCaWXDn21hbm4=?=
 <andreas.biessmann@corscience.de>
MIME-Version: 1.0
To: jean-philippe francois <jp.francois@cynove.com>
Subject: Re: U-boot bch4_sw vs omap bch4_hw
References: <CAGGh5h23djGTUynnoVUaGAQCuWVCDAW=PLQsvnyBVKGDfwERAQ@mail.gmail.com>
 <20121208082935.GA17392@parrot.com>
 <CAGGh5h2CoQTbOL32+f3jhtvUwCbFp7EPhL7g61PFkVGtXwAd-w@mail.gmail.com>
In-Reply-To: <CAGGh5h2CoQTbOL32+f3jhtvUwCbFp7EPhL7g61PFkVGtXwAd-w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Ivan Djelic <ivan.djelic@parrot.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ivan Djelic and Jean-Philippe Francois,

On 10.12.2012 10:41, jean-philippe francois wrote:
> 2012/12/8 Ivan Djelic <ivan.djelic@parrot.com>:
>> On Fri, Dec 07, 2012 at 03:26:06PM +0000, jean-philippe francois wrote=
:
>>> Hi Ivan,
>>>
>>> I have applied your patches for hardware bch ecc support on
>>> OMAP. On the linux side, everything is fine. However I have some trou=
ble
>>> when it comes to u-boot and kernel interoperability.
>>>
>>> A nand page written with bch4_sw ecc by U-boot fails the ecc step whe=
n
>>> read by the kernel. Looking at a nanddump, OOB placement and size of
>>> the ecc data are the same.
>>>
>>> Do you know of any patch for u-boot that would make the  bch4_sw ecc
>>> identical to the kernel one ?

can you both please have a loot at
http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/147698

>> Hi Jean-Philippe,
>>
>> If you point me to a git repo with the exact u-boot version you are us=
ing,
>> I can probably provide a patch (or at least understand the problem).
>> BR,
>> --
>> Ivan
> I am using an u-boot from the arago project :
> http://arago-project.org/git/projects/?p=3Du-boot-omap3.git;a=3Dtags
>=20
> So it is quite old.
> I will probably have to modify x-loader, too.

current u-boot do not need x-loader any more.

> Both implementation use very similar file for hardware assisted
> bch decoding.
>=20
> If this code is too old for you to look at, could you help me find an o=
map
> project that "new ecc" all the way up from x-loader to u-boot + kernel =
?
>=20
> If I understands things correctly, I have two options if I want to use
> Nand that needs
> 4-bit ecc :
> - Stick with the old ecc scheme in x-loader and u-boot, and use
> software 4-bit bch in the kernel.
>   Is this compatible with using ubifs ?
> - Implement new ecc scheme in x-loader and u-boot, and use hardware
> assisted bch-4 in the kernel.
> Is this correct ?

 * use 1-bit hamming 'ROM-layout' for SPL mtd and 4-bit BCH8 in all
other sections, see my u-boot patches.

Would be great to have some testers for these patches.

Best regards

Andreas Bie=C3=9Fmann
