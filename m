Received: from mail-ig0-x229.google.com ([2607:f8b0:4001:c05::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm8El-0000OL-ER
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 21:35:32 +0000
Received: by mail-ig0-f169.google.com with SMTP id hn18so9102558igb.2
 for <linux-mtd@lists.infradead.org>; Wed, 05 Nov 2014 13:35:09 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20141105111631.GJ22361@norris-Latitude-E6410>
References: <1407804896-1808-1-git-send-email-shijie.huang@intel.com>
 <1407804896-1808-2-git-send-email-shijie.huang@intel.com>
 <20141105111631.GJ22361@norris-Latitude-E6410>
Date: Wed, 5 Nov 2014 22:35:09 +0100
Message-ID: <CACna6ryvN_Srwt-JgxWht4aQfjgo0DhjqPicN8kyhJCJ91NUhw@mail.gmail.com>
Subject: Re: [PATCH 2/3] mtd: spi-nor: remove the jedec_id/ext_id
From: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Huang Shijie <shijie.huang@intel.com>,
 =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 5 November 2014 12:16, Brian Norris <computersforpeace@gmail.com> wrote:
> On Tue, Aug 12, 2014 at 08:54:55AM +0800, Huang Shijie wrote:
>> The "id" array contains all the information about the JEDEC and the
>> manufacturer ID info, this patch remove the jedec_id/ext_id from the
>> flash_info.
>>
>> Signed-off-by: Huang Shijie <shijie.huang@intel.com>
>
> This patch does not apply any more. Can you rebase?

Hm, I've just noticed that my patch:
"prefer more specific entries from chips database"
http://patchwork.ozlabs.org/patch/401907/
conflicts with this one.

I think the final solution (after somehow applying both patches)
should be something like:
for (len =3D 6; i >=3D 4; len--) {
    for (tmp =3D 0; tmp < ARRAY_SIZE(spi_nor_ids) - 1; tmp++) {
        if (tmp->id_len =3D=3D len && !strncmp(info->id, id, info->id_len)
            return &spi_nor_ids[tmp];
    }
}

Does it make sense to you?

Huang: I think it'll be the most optimal to me rebase my patch on top
on your ones.

Btw. I have two comments regarding 1/3 (can't find it to reply properly):

1) Do we need the if (info->id_len) check?
2) Shouldn't we use memcmp in the if (!strncmp(info->id, id, info->id_len))

--=20
Rafa=C5=82
