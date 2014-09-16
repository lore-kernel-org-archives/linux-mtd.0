Received: from mail-la0-f45.google.com ([209.85.215.45])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XTv7H-0002k0-PN
 for linux-mtd@lists.infradead.org; Tue, 16 Sep 2014 15:56:32 +0000
Received: by mail-la0-f45.google.com with SMTP id b17so62388lan.32
 for <linux-mtd@lists.infradead.org>; Tue, 16 Sep 2014 08:56:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1410882828.28850.69.camel@sauron.fi.intel.com>
References: <1409348550-27768-1-git-send-email-ezequiel.garcia@free-electrons.com>
 <1409348550-27768-3-git-send-email-ezequiel.garcia@free-electrons.com>
 <1410173657.10764.148.camel@sauron.fi.intel.com>
 <20140908111832.GA1676@arch.hh.imgtec.org>
 <1410180460.10764.163.camel@sauron.fi.intel.com>
 <20140908182750.GA9222@arch.hh.imgtec.org>
 <1410880524.28850.49.camel@sauron.fi.intel.com>
 <CAAEAJfDnXe2Yb5OeVb07vsofrdDCV-h0umpYF-mukG+FyNP4LQ@mail.gmail.com>
 <1410882828.28850.69.camel@sauron.fi.intel.com>
Date: Tue, 16 Sep 2014 16:56:06 +0100
Message-ID: <CAAEAJfDL_+dahDrYB=3JAVASQDfzPLbVuA+AVRbqnHig3-KtPA@mail.gmail.com>
Subject: Re: [PATCH 2/3] UBI: block: Add support for the UBI_VOLUME_UPDATED
 notification
From: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: =?UTF-8?Q?Guido_Mart=C3=ADnez?= <guido@vanguardiasur.com.ar>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 16 September 2014 16:53, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Tue, 2014-09-16 at 16:32 +0100, Ezequiel Garcia wrote:
>> 4fda380 UBI: Dispatch update notification if the volume is updated
>> 46a5b80 UBI: block: Add support for the UBI_VOLUME_UPDATED notification
>> db95429 UBI: block: Fix block device size setting
>> 3170403 UBI: block: Avoid disk size integer overflow
>> b6c7b28 UBI: block: Set disk_capacity out of the mutex
>> 1860e37 Linux 3.15
>>
>> I just got delayed thinking if it was OK to pick so many commits into
>> stable. As an alternative,
>> we can mark only the ones on this patchset, namely:
>>
>> 4fda380 UBI: Dispatch update notification if the volume is updated
>> 46a5b80 UBI: block: Add support for the UBI_VOLUME_UPDATED notification
>> db95429 UBI: block: Fix block device size setting
>
> Yeah, these 3 look like the more important ones. So do we put
>
> Cc: stable@vger.kernel.org # v3.16+
>
> or
>
> Cc: stable@vger.kernel.org # v3.15+
>

Cc: stable@vger.kernel.org # v3.15+

I'll backport them when -stable guys ask to.

--=20
Ezequiel Garc=C3=ADa, VanguardiaSur
www.vanguardiasur.com.ar
