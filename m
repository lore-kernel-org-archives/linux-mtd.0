Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SUUCw-0005lx-9K
 for linux-mtd@lists.infradead.org; Wed, 16 May 2012 02:43:23 +0000
Received: by bkwj4 with SMTP id j4so235937bkw.36
 for <linux-mtd@lists.infradead.org>; Tue, 15 May 2012 19:43:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4FB2F8A9.6010909@snapgear.com>
References: <1337054928-16228-1-git-send-email-gerg@snapgear.com>
 <CAMjpGUcteBCy7OLVgxF1sDTNi4XqCKsetEQSW-dpG0Ji4mUh2A@mail.gmail.com>
 <4FB2F8A9.6010909@snapgear.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Tue, 15 May 2012 22:42:59 -0400
Message-ID: <CAMjpGUff6=5HhUrt6xRdROb7edFWvZsUDHLZStVQQr55zo6maQ@mail.gmail.com>
Subject: Re: [uClinux-dev] [PATCH] mtd: clean up uclinux.c map driver
To: Greg Ungerer <gerg@snapgear.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: Greg Ungerer <gerg@uclinux.org>, linux-mtd@lists.infradead.org,
 uClinux development list <uclinux-dev@uclinux.org>, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, May 15, 2012 at 8:45 PM, Greg Ungerer <gerg@snapgear.com> wrote:
> On 16/05/12 01:57, Mike Frysinger wrote:
>> On Tue, May 15, 2012 at 12:08 AM,<gerg@snapgear.com> =C2=A0wrote:
>>>
>>> . make the struct uclinux_ram_map static
>>
>>
>> NAK: this breaks Blackfin systems. =C2=A0we specifically don't want this=
 to
>> be static.
>>
>> it should probably get a comment added above it saying as much.
>
> A comment won't fix the sparse warning. You need a proper declaration.

perhaps, but marking it static to fix a warning that people rarely see
whilst simultaneously knowingly breaking an arch doesn't sound like
the correct trade off.
-mike
