Received: from mail-ig0-x22a.google.com ([2607:f8b0:4001:c05::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YSohS-0007AR-IA
 for linux-mtd@lists.infradead.org; Tue, 03 Mar 2015 15:25:35 +0000
Received: by igbhl2 with SMTP id hl2so28633007igb.3
 for <linux-mtd@lists.infradead.org>; Tue, 03 Mar 2015 07:25:10 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1425367912.26652.47.camel@sauron.fi.intel.com>
References: <CALupW3CugdN+cwMZzePAhZSHbGhd9gfjk==DH=7Ezu54Y1BXUA@mail.gmail.com>
 <1425367912.26652.47.camel@sauron.fi.intel.com>
Date: Tue, 3 Mar 2015 07:25:10 -0800
Message-ID: <CALupW3ByNuS6HgU3LQR-W4jt7xKhG7j_6OrvQ=tyWdHKV20f6Q@mail.gmail.com>
Subject: Re: "corrupt empty space" error on boot?!?
From: Steve deRosier <derosier@gmail.com>
To: Artem Bityutskiy <dedekind1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Thanks Artem.

On Mon, Mar 2, 2015 at 11:31 PM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> Yes, you are right, if there is a corruption, UBIFS can:
>
> 1. Try to understand if this is a corruption in empty space or not.
> 2. If yes, recover the LEB.
>
> But this is not implemented. People keep hitting this issue, but no one
> contributed fixes yet.
>
>> A unit not mounting the rootfs because of a bit-flip in _empty_space_
>> is unacceptable to us, so I've got to figure out a way to deal with
>> this rare event.
>
> Well, improving UBIFS would be one of the possible solutions.
>

OK, two questions then:

1. Is there anything I can do from userspace, or uboot, to recover
this filesystem?  We've got mirrored filesystems, so we actually can
detect the failure and mount the other one and fix the first from
there.  Or maybe I can mount it ro and switch to the other filesystem
and reboot?

2. I'd like to be able to replicate the problem so I can fix it, but
simply poking a random bit to a random empty PEB won't do the trick.
I've actually tried this before when doing other investigations and
nothing bad happened, likely because the empty page I hit was never
looked at by UBIFS.  I know there's got to be a way to map LEB to PEB,
how do I do that/where is the table?  Specifically, how to map "LEB
4:3918" to a physical block and page on the flash device?

I'll give fixing it and contributing the patch a try. I'm up against a
project deadline with a board-bring-up right now (they wanted it done
2 weeks ago and I'm having to report on it each day now), so I
probably won't have time on it till next week.

- Steve
