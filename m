Received: from mail-lb0-x22a.google.com ([2a00:1450:4010:c04::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZQ9Nv-0004RK-On
 for linux-mtd@lists.infradead.org; Fri, 14 Aug 2015 07:26:40 +0000
Received: by lbbtg9 with SMTP id tg9so40734816lbb.1
 for <linux-mtd@lists.infradead.org>; Fri, 14 Aug 2015 00:26:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8AC930D6-9BEE-4AA8-99AC-962027CCF336@sigma-star.at>
References: <CAPcvp5GZi0gV=J2Zbz_Sp+NmZNKnA38JAsYtbuNiwsq84yMDfg@mail.gmail.com>
 <8AC930D6-9BEE-4AA8-99AC-962027CCF336@sigma-star.at>
From: Michal Suchanek <hramrach@gmail.com>
Date: Fri, 14 Aug 2015 09:25:38 +0200
Message-ID: <CAOMqctQUgbukQ-h9vznwu2JrNBaZJeuL1jQiAgG59s9qHzS14Q@mail.gmail.com>
Subject: Re: [RFC] mtd: ubi: UBI Encryption
To: David Gstir <david@sigma-star.at>
Cc: Andrew Murray <amurray@embedded-bits.co.uk>,
 MTD Maling List <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

On 12 August 2015 at 19:19, David Gstir <david@sigma-star.at> wrote:
> Hi!
>

>> - Encryption in UBI was preferred as it removed the complexity from userspace,
>>   though I suppose there is no reason why this can't be done within the MTD
>>   layer rather than in UBI and thus benefit all MTD users.
>
> Generally speaking, I'd argue for moving encryption to the highest layer possible. So, if you exclusively use UBIFS and need encryption, add it to UBIFS or even your userspace application.
> The main reason for this is that disk encryption on lower layers (e.g block-level) has fewer security guarantees, like no authentication of encrypted data for example. So it cannot prevent "evil maid" attacks.
> There is a nice writeup on this topic here: [2], which focuses on the commonly used XTS mode, but makes valid points for disk encryption in general.
>
> So, when you do encryption in UBI or MTD, be aware of the security implications and know your thread model.
>
> [2] http://sockpuppet.org/blog/2014/04/30/you-dont-want-xts/

Thanks for the pointers.

Obviously, full disk encryption is not ideal but it's also last resort
in the sense that you can cut & paste state of the art solution and it
works on any kind of disk with minimum requirements on the implementor
and reviewer.

>From the notes about internal and external flash it seems that this is
upposed to protect against removing an external flash memory which is
attached to a device. This is probably a decent solution for the
problem. Knowing more details would help here.

Adding encryption to UBIFS itself is much more difficult.

Adding encryption to every application is not really feasible unless
you have a single-purpose device with one application.

Thanks

Michal
