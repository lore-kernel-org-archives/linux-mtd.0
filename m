Received: from mail-oi0-x233.google.com ([2607:f8b0:4003:c06::233])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bhYDY-00013u-Kn
 for linux-mtd@lists.infradead.org; Wed, 07 Sep 2016 08:28:33 +0000
Received: by mail-oi0-x233.google.com with SMTP id m11so15804829oif.1
 for <linux-mtd@lists.infradead.org>; Wed, 07 Sep 2016 01:28:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACna6rwSGU6WLZwVnd+x1iOjHOoNmhrBOCcvS-b1KDXs9gVF0Q@mail.gmail.com>
References: <58c7c482-9a51-73d1-7694-e1928f3bedb0@gmail.com>
 <d56ee9a9-5246-a609-b8ca-1c8dee322f46@nod.at>
 <CAJfpegt_Rw0O7mmP4scNPObAokwiNGs7m9ez1-tmjndOZDMXBg@mail.gmail.com>
 <CACna6rzJi37CYg86YgT+age8ebWX6BtpoEbz7uM18-QiWFvDxQ@mail.gmail.com>
 <CACna6rwSGU6WLZwVnd+x1iOjHOoNmhrBOCcvS-b1KDXs9gVF0Q@mail.gmail.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 7 Sep 2016 10:28:02 +0200
Message-ID: <CAJfpegv9EwrZJnAi45ck4Cy+UiPQX1L4ztNjdAn-TzGCJqkk7g@mail.gmail.com>
Subject: Re: overlayfs + ubifs: power cut results in "failed to create
 directory /overlay/work/work (errno: 17); mounting read-only"
To: =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc: Richard Weinberger <richard@nod.at>,
 "linux-unionfs@vger.kernel.org" <linux-unionfs@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 LEDE Development List <lede-dev@lists.infradead.org>
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

On Tue, Sep 6, 2016 at 5:53 PM, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:
> On 6 September 2016 at 14:56, Rafa=C5=82 Mi=C5=82ecki <zajec5@gmail.com> =
wrote:
>> On 6 September 2016 at 14:50, Miklos Szeredi <miklos@szeredi.hu> wrote:
>>> On Tue, Sep 6, 2016 at 1:59 PM, Richard Weinberger <richard@nod.at> wro=
te:
>>>> overlayfs does not issue a recursive rm on workdir, AFAICT you are sup=
posed to cleanup
>>>> workdir yourself before mounting.
>>>> Miklos?
>>>
>>> Fixed in 4.8-rc5 by
>>>
>>> eea2fb4851e9 ("ovl: proper cleanup of workdir")
>>>
>>> I think it's better if kernel does the cleanup, but if it's easier to
>>> upgrade userspace, then that's a valid workaround.
>>
>> Oh, this should solve my problem! It seems it didn't git stable
>> kernels yet, but I can backport it on my own for now.
>
> I tried backporting it to 4.4, but it appears it won't be that
> trivial. Your patch ("ovl: proper cleanup of workdir") uses e.g.
> inode_lock_nested which is available in 4.5+. Commit that added this
> function: 5955102c9984f ("wrappers for ->i_mutex access") wasn't
> marked for stable, so I guess your patch won't go into 4.4 at all.
>
> I don't expect any magic solution for this, just saying, leaving a
> note for reference.

Conversion is trivial, in fact:

#define inode_lock(inode) mutex_lock(&(inode)->i_mutex)
#define inode_unlock(inode) mutex_unlock(&(inode)->i_mutex)
#define inode_trylock(inode) mutex_trylock(&(inode)->i_mutex)
#define inode_lock_nested(inode, subclass)
mutex_lock_nested(&(inode)->i_mutex, subclass)

And Greg promised to put these defines into -stable for easier
backport experience.

Thanks,
Miklos
