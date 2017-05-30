Received: from mail-qk0-x235.google.com ([2607:f8b0:400d:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dFeug-0001kl-Gi
 for linux-mtd@lists.infradead.org; Tue, 30 May 2017 11:02:12 +0000
Received: by mail-qk0-x235.google.com with SMTP id d14so25165130qkb.1
 for <linux-mtd@lists.infradead.org>; Tue, 30 May 2017 04:01:49 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170530115959.4244924a@bbrezillon>
References: <CAJbz7-0+WijkdxuwL_xvjwTWfzWcqL5PHAqSwGbwV=txQVnnAA@mail.gmail.com>
 <20170530115959.4244924a@bbrezillon>
From: =?UTF-8?Q?Honza_Petrou=C5=A1?= <jpetrous@gmail.com>
Date: Tue, 30 May 2017 13:01:48 +0200
Message-ID: <CAJbz7-1Y=__8GdjzkD5oRjCq=NWUfyYT8qfz+XjU6iWoAyBxBA@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] mtd:nor:ppb_unlock fixes
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: David Woodhouse <dwmw2@infradead.org>,
 Brian Norris <computersforpeace@gmail.com>,
 Marek Vasut <marek.vasut@gmail.com>, Richard Weinberger <richard@nod.at>,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>, linux-mtd@lists.infradead.org
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

Hi Boris

2017-05-30 11:59 GMT+02:00 Boris Brezillon <boris.brezillon@free-electrons.=
com>:
> Hi Honza,
>
> On Tue, 30 May 2017 11:51:07 +0200
> Honza Petrou=C5=A1 <jpetrous@gmail.com> wrote:
>
>> Hi Boris,
>> as you advised I come back with v2 patch, now it is the series
>> of three fixes I found them during the testing of the original fix.
>
> Just a few things before I start reviewing the patches:
>
> 1/ commit title prefix should be "mtd: cfi: " not "mtd:nor:"
> 2/ Don't know how you send your patches, but patches 1 to 3 should be
>    "In-Reply-To" your cover letter, which is not the case here.
>    Normally, git send-email does that automatically.
>

OK, let me make v3 to fix that.

/Honza
