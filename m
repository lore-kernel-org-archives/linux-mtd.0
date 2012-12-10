Received: from moutng.kundenserver.de ([212.227.17.9])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Ti1Gg-0002ce-P4
 for linux-mtd@lists.infradead.org; Mon, 10 Dec 2012 11:11:27 +0000
Received: from mail.er.corscience.de (mail.er.corscience.de [192.168.1.6])
 by corscience.de (Postfix) with ESMTP id 30B4551EAF
 for <linux-mtd@lists.infradead.org>; Mon, 10 Dec 2012 12:11:24 +0100 (CET)
Received: from [192.168.102.103] (azuregos.2og.er.corscience.de
 [192.168.102.103])
 by mail.er.corscience.de (Postfix) with ESMTPSA id E62F3347A147
 for <linux-mtd@lists.infradead.org>; Mon, 10 Dec 2012 12:11:24 +0100 (CET)
Message-ID: <50C5C35C.4050804@corscience.de>
Date: Mon, 10 Dec 2012 12:11:24 +0100
From: =?UTF-8?B?QW5kcmVhcyBCaWXDn21hbm4=?=
 <andreas.biessmann@corscience.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: U-boot bch4_sw vs omap bch4_hw
References: <CAGGh5h23djGTUynnoVUaGAQCuWVCDAW=PLQsvnyBVKGDfwERAQ@mail.gmail.com>
 <20121208082935.GA17392@parrot.com>
 <CAGGh5h2CoQTbOL32+f3jhtvUwCbFp7EPhL7g61PFkVGtXwAd-w@mail.gmail.com>
 <50C5BAD6.2010500@corscience.de>
In-Reply-To: <50C5BAD6.2010500@corscience.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10.12.2012 11:35, Andreas Bie=C3=9Fmann wrote:
> Hi Ivan Djelic and Jean-Philippe Francois,
>=20
> On 10.12.2012 10:41, jean-philippe francois wrote:
>> 2012/12/8 Ivan Djelic <ivan.djelic@parrot.com>:

<snip>

>=20
>  * use 1-bit hamming 'ROM-layout' for SPL mtd and 4-bit BCH8 in all
> other sections, see my u-boot patches.

it is in fact 8-bit BCH (not 4-bit). I have chosen BCH8 here cause some
OMAP3 seem to have broken BCH4. The kernel also recommends to use BCH8
for the same cause. However this can be made configurable in u-boot.

best regards

Andreas Bie=C3=9Fmann
