Received: from mail-it0-x243.google.com ([2607:f8b0:4001:c0b::243])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dWiQ9-0001aq-KH
 for linux-mtd@lists.infradead.org; Sun, 16 Jul 2017 12:13:12 +0000
Received: by mail-it0-x243.google.com with SMTP id v193so15911868itc.2
 for <linux-mtd@lists.infradead.org>; Sun, 16 Jul 2017 05:12:46 -0700 (PDT)
MIME-Version: 1.0
Sender: geert.uytterhoeven@gmail.com
In-Reply-To: <cd4c5713-d091-3445-071e-d880c40710d9@nod.at>
References: <20170209212837.14197-1-richard@nod.at>
 <20170209212837.14197-2-richard@nod.at>
 <20170309070439.GA31469@sebu> <cd4c5713-d091-3445-071e-d880c40710d9@nod.at>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sun, 16 Jul 2017 14:12:44 +0200
Message-ID: <CAMuHMdUHF-YSZ8=E3u6GRudJfvgpcGHjoEitf6YvrkHqT6guBg@mail.gmail.com>
Subject: Re: [PATCH 2/4] ubifs: Fix unlink code wrt. double hash lookups
To: Richard Weinberger <richard@nod.at>
Cc: Hyunchul Lee <hyc.lee@gmail.com>, kernel-team@lge.com,
 Artem Bityutskiy <dedekind1@gmail.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 david.oberhollenzer@sigma-star.at,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Richard,

On Sun, Mar 19, 2017 at 9:46 PM, Richard Weinberger <richard@nod.at> wrote:
> Am 09.03.2017 um 08:04 schrieb Hyunchul Lee:
>>> -    int n, err, type =3D key_type(c, key);
>>> -    struct ubifs_znode *znode;
>>> +    int err;

    fs/ubifs/tnc.c: In function =E2=80=98search_dh_cookie=E2=80=99:
    fs/ubifs/tnc.c:1893: warning: =E2=80=98err=E2=80=99 is used uninitializ=
ed in this function

None of Hyunchul's review comments below ended up in commit 781f675e2d7ec12=
0
("ubifs: Fix unlink code wrt. double hash lookups")?

>> i guess that err should be initialized with -ENOENT to avoid the first c=
all of
>> tnc_next(c, &znode, n).
>
> Yes. err is used unitialized. Happened most likely while moving the code =
block around.

The initialization can easily be avoided by moving the first call of
tnc_next() to the end of the for-loop.

>>>  /**
>>> + * ubifs_tnc_remove_dh - remove an index entry for a "double hashed" n=
ode.
>>> + * @c: UBIFS file-system description object
>>> + * @key: key of node
>>> + * @cookie: node cookie for collision resolution
>>> + *
>>> + * Returns %0 on success or negative error code on failure.
>>> + */
>>> +int ubifs_tnc_remove_dh(struct ubifs_info *c, const union ubifs_key *k=
ey,
>>> +                    uint32_t cookie)
>>> +{
>>> +    int n, err;
>>> +    struct ubifs_znode *znode;
>>> +    struct ubifs_dent_node *dent;
>>> +    struct ubifs_zbranch *zbr;
>>> +
>>> +    if (!c->double_hash)
>>> +            return -EOPNOTSUPP;
>>> +
>>> +    mutex_lock(&c->tnc_mutex);
>>> +    err =3D lookup_level0_dirty(c, key, &znode, &n);
>>> +    if (err <=3D 0)
>>> +            goto out_unlock;

break? :-)
Or return err?

>>> +
>>> +    zbr =3D &znode->zbranch[n];
>>> +    dent =3D kmalloc(UBIFS_MAX_DENT_NODE_SZ, GFP_NOFS);
>>> +    if (!dent) {
>>> +            err =3D -ENOMEM;
>>> +            goto out_unlock;

break?
Or return err?

>>> +    }
>>> +
>>> +    err =3D tnc_read_hashed_node(c, zbr, dent);
>>> +    if (err)
>>> +            goto out_free;
>>> +
>>> +    /* If the cookie does not match, we're facing a hash collision. */
>>> +    if (le32_to_cpu(dent->cookie) !=3D cookie) {
>>> +            union ubifs_key start_key;
>>> +
>>> +            lowest_dent_key(c, &start_key, key_inum(c, key));
>>> +
>>> +            err =3D ubifs_lookup_level0(c, &start_key, &znode, &n);
>>> +            if (unlikely(err < 0))
>>> +                    goto out_unlock;
>>
>> i guess that out_unlock should be replaced with out_free to free dent.
>>
>
> Ohhh, correct.
>
>>> +
>>> +            err =3D search_dh_cookie(c, key, dent, cookie, &znode, &n)=
;
>>> +            if (err)
>>> +                    goto out_free;
>>> +    }
>>> +
>>> +    if (znode->cnext || !ubifs_zn_dirty(znode)) {
>>> +            znode =3D dirty_cow_bottom_up(c, znode);
>>> +            if (IS_ERR(znode)) {
>>> +                    err =3D PTR_ERR(znode);
>>> +                    goto out_unlock;
>>
>> this out_unlock should also be.
>
> Yep. Both are copy&paste errors. :-(
>
> Thanks a lot for pointing this out, your help is much appreciated!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
