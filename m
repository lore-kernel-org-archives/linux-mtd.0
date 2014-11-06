Received: from mail-ie0-x234.google.com ([2607:f8b0:4001:c03::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XmGRz-0001G9-Mu
 for linux-mtd@lists.infradead.org; Thu, 06 Nov 2014 06:21:44 +0000
Received: by mail-ie0-f180.google.com with SMTP id y20so2278270ier.25
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 22:21:22 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20141106010920.GA19065@shldeISGChi005.sh.intel.com>
References: <1407804896-1808-1-git-send-email-shijie.huang@intel.com>
 <1407804896-1808-2-git-send-email-shijie.huang@intel.com>
 <20141105111631.GJ22361@norris-Latitude-E6410>
 <CACna6ryvN_Srwt-JgxWht4aQfjgo0DhjqPicN8kyhJCJ91NUhw@mail.gmail.com>
 <20141106010920.GA19065@shldeISGChi005.sh.intel.com>
Date: Thu, 6 Nov 2014 07:21:22 +0100
Message-ID: <CACna6rzCuZZjarTD+YGVFoUtR-+VhLOVR0UwVroy7s1ZU4hCVQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: remove the jedec_id/ext_id
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Huang Shijie <shijie.huang@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>,
 David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 6 November 2014 02:09, Huang Shijie <shijie.huang@intel.com> wrote:
>> 1) Do we need the if (info->id_len) check?
> yes. some chips may have short info->id_len, some chips may have long
> info->id_len.

Right, thanks.


>> 2) Shouldn't we use memcmp in the if (!strncmp(info->id, id, info->id_le=
n))
> I prefer to memcmp too. But i misused with strncmp.
> You can send a patch to fix it. I can give you my Ack. :)

Well, you were sending V2 2 hours later anyway... you could fix that in it =
:|

--=20
Rafa=C5=82
