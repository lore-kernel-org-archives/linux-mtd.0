Received: from mail-vn0-f51.google.com ([209.85.216.51])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z0mow-0006oc-Ag
 for linux-mtd@lists.infradead.org; Fri, 05 Jun 2015 08:17:42 +0000
Received: by vnbg7 with SMTP id g7so2100892vnb.1
 for <linux-mtd@lists.infradead.org>; Fri, 05 Jun 2015 01:16:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1433479201.3379.10.camel@cyril>
References: <1433219169-5115-1-git-send-email-cyrilbur@gmail.com>
 <1433479201.3379.10.camel@cyril>
Date: Fri, 5 Jun 2015 10:16:34 +0200
Message-ID: <CAFLxGvxM1V8EMmZotqhSUG-q0cy+NpufeksChjJrD0qSJCSB0g@mail.gmail.com>
Subject: Re: [PATCH V3] drivers/mtd: add powernv flash MTD abstraction driver
From: Richard Weinberger <richard.weinberger@gmail.com>
To: Cyril Bur <cyrilbur@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: linuxppc-dev@ozlabs.org, Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Jun 5, 2015 at 6:40 AM, Cyril Bur <cyrilbur@gmail.com> wrote:
> On Tue, 2015-06-02 at 14:26 +1000, Cyril Bur wrote:
>> Powerpc powernv platforms allow access to certain system flash devices
>> through a firmwarwe interface. This change adds an mtd driver for these
>> flash devices.
>>
>> Minor updates from Jeremy Kerr and Joel Stanley.
>>
>> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
>> ---
>> Hello Brian and MTD folk,
>> Could I please get an ACK for Michael to take this through the powerpc
>> tree.
>> Thanks.
>>
>
> Hello Brian,
>
> As we have some deadlines approaching, I am getting pressure to ensure
> this gets merged upstream as quickly as possible, please let me know if
> there is anything more which can be done.

FYI, Brian is not available for the next 1.5 weeks.
So I fear this driver has to wait for the next merge window.

-- 
Thanks,
//richard
