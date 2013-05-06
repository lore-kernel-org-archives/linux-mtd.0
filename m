Received: from mail-we0-x22b.google.com ([2a00:1450:400c:c03::22b])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UZNHI-000789-J2
 for linux-mtd@lists.infradead.org; Mon, 06 May 2013 15:24:37 +0000
Received: by mail-we0-f171.google.com with SMTP id u7so3114648wey.30
 for <linux-mtd@lists.infradead.org>; Mon, 06 May 2013 08:24:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1BB4A15D-C030-4CDC-B5C6-8C687572ACB7@gmail.com>
References: <1367801267-15659-1-git-send-email-bapper@gmail.com>
 <CAFLxGvzqysw2ABxA9Mz6b6LOdQdGS4y+fN=UeJ0tuk=KPYO55Q@mail.gmail.com>
 <1BB4A15D-C030-4CDC-B5C6-8C687572ACB7@gmail.com>
Date: Mon, 6 May 2013 17:17:43 +0200
Message-ID: <CAFLxGvy2icxuGx9+VaiTgFxPwL3pHOEXo6S2UG-tJvoB+GdRCg@mail.gmail.com>
Subject: Re: [PATCH] UBI: fastmap convert used list to rb tree
From: richard -rw- weinberger <richard.weinberger@gmail.com>
To: Brian Pomerantz <bapper@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
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

On Mon, May 6, 2013 at 5:04 PM, Brian Pomerantz <bapper@gmail.com> wrote:
>
> On May 6, 2013, at 6:45 AM, richard -rw- weinberger <richard.weinberger@g=
mail.com> wrote:
>
>> On Mon, May 6, 2013 at 2:47 AM, Brian Pomerantz <bapper@gmail.com> wrote=
:
>>> After some profiling of the attach process, it was found that
>>> a considerable amount of time was spent spinning through the list of
>>> used PEBs in ubi_attach_fastmap().  This patch converts the list into
>>> a RB tree saving considerable time when the volumes fill up.
>>>
>>> Signed-off-by: Brian Pomerantz <bapper@gmail.com>
>>
>> Nice!
>> Looks good so far, but this week I'm on the road.
>> As soon as I the have time to test it, I'll ack your patch.
>>
>> Do you have some numbers?
>> I'm interested in how much faster the rbtree is compared to list in this=
 case...
>>
>
> Using a Samsung 1GB NAND with 3958 PEBs and only 510 left available (near=
ly full), without the patch I get around a 300ms attach time and with the p=
atch it is around 50ms attach time.  I made the same change in u-boot, our =
kernel image is stored in UBI along with a backup image, and saw the same s=
peedup.  So I shaved off 500ms from my boot time with the two changes.  The=
 attach time should be much more constant using the tree, not getting much =
longer as the volumes fill up.  There wasn't a noticeable difference in how=
 long it took to fill the tree verses appending to a list, so with empty vo=
lumes there shouldn't be much overhead.

Sounds good. :)
Did you port fastmap to u-boot?

Thanks,
//richard
