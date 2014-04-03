Received: from mail-wi0-f172.google.com ([209.85.212.172])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WVjX9-0006GG-GB
 for linux-mtd@lists.infradead.org; Thu, 03 Apr 2014 15:26:27 +0000
Received: by mail-wi0-f172.google.com with SMTP id hi2so7987857wib.5
 for <linux-mtd@lists.infradead.org>; Thu, 03 Apr 2014 08:26:05 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CALnQHM1VLY=t6CaQtHGtp=enNCCj=Xz_QN7sj20hUCd8ZJjKpA@mail.gmail.com>
References: <1396308537-16013-1-git-send-email-davidm@egauge.net>
 <1396308537-16013-2-git-send-email-davidm@egauge.net>
 <20140401063958.GA6400@brian-ubuntu>
 <CALnQHM1Z048h0BvbhAwussYH27mdV9kO6Q=74Wqa1CHpsbi4+w@mail.gmail.com>
 <20980858CB6D3A4BAE95CA194937D5E73EAC059F@DBDE04.ent.ti.com>
 <CACwUX0O2NZYU+FysS46Rtvpm2C5G06yee1C1rSM2CEm0XEo-_A@mail.gmail.com>
 <20140402164933.GC11339@book.gsilab.sittig.org>
 <CALnQHM3B=-159u1BesCbEN=XQuosG0mkGb-emQUJJFETR7gd=g@mail.gmail.com>
 <20140403071058.GF11339@book.gsilab.sittig.org>
 <CALnQHM1VLY=t6CaQtHGtp=enNCCj=Xz_QN7sj20hUCd8ZJjKpA@mail.gmail.com>
Date: Thu, 3 Apr 2014 09:26:05 -0600
Message-ID: <CALnQHM20UFV+ezNsP0qffDrHQnSk=Bym65YnED-m2pPkBi8CCw@mail.gmail.com>
Subject: Re: [PATCH v4 1/5] mtd: nand: Detect Micron flash with on-die ECC
 (aka "internal ECC") enabled.
From: David Mosberger <davidm@egauge.net>
To: Gerhard Sittig <gsi@denx.de>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, "Gupta,
 Pekon" <pekon@ti.com>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[Resend in plain text, sorry...]

On Thu, Apr 3, 2014 at 9:24 AM, David Mosberger <davidm@egauge.net> wrote:
>
> Gerhard,
>
> On Thu, Apr 3, 2014 at 1:10 AM, Gerhard Sittig <gsi@denx.de> wrote:
>>
>> I really don't see that enabling on-die-ECC in one stage requires
>> all other stages to follow.  It's one apparent approach, but need
>> not be the only one.  That's what previous messages tried to say.
>
>
>>
>> Does this explanation help answer your question?
>
>
> Yes, that helps, thanks for taking the time to answer!
>
> Leaving on-die ECC on is certainly not the only way to do it,
> but I still think it's a reasonable way.
>
> I doubt it's reasonable to modify each and every platform-driver
> to be able to decide whether to use on-die ECC or the best
> ECC mode it can supply.
>
> Maybe it's possible to use the new(ish) ecc_strength_ds/ecc_step_ds
> to chose whether or not to keep on-die ECC on?  Say, if the driver's
> ECC is stronger, turn on-die ECC off, otherwise leave it on?
>
> Again, I think the present patch is safe and reasonable, but I'm certainly
> open to better suggestions.
>
>   --david
> --
> eGauge Systems LLC, http://egauge.net/, 1.877-EGAUGE1, fax 720.545.9768




-- 
eGauge Systems LLC, http://egauge.net/, 1.877-EGAUGE1, fax 720.545.9768
