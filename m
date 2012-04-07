Received: from mail-bk0-f49.google.com ([209.85.214.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SGZ25-0001C3-Qf
 for linux-mtd@lists.infradead.org; Sat, 07 Apr 2012 17:02:38 +0000
Received: by bkcjk13 with SMTP id jk13so3493397bkc.36
 for <linux-mtd@lists.infradead.org>; Sat, 07 Apr 2012 10:02:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAN8TOE9P9NvD+sRB8MurCkETDKmKUmvkq_M-3kCF+0zaZgsjTg@mail.gmail.com>
References: <071A08F2C6A57E4E94D980ECA553F8745E82D5@039-SN1MPN1-005.039d.mgd.msft.net>
 <CAN8TOE-0GPgbfgrps-ieQb9NYnOFv79TZdxhTyd_ydPboP_8Pg@mail.gmail.com>
 <071A08F2C6A57E4E94D980ECA553F8745EEA99@039-SN1MPN1-005.039d.mgd.msft.net>
 <CAN8TOE9P9NvD+sRB8MurCkETDKmKUmvkq_M-3kCF+0zaZgsjTg@mail.gmail.com>
From: Mike Frysinger <vapier.adi@gmail.com>
Date: Sat, 7 Apr 2012 13:02:14 -0400
Message-ID: <CAMjpGUf+nEV09MWb5e2kzjJq0SAQGq=iqce2rzt9UON6wkji8w@mail.gmail.com>
Subject: Re: Query mtd-utils v1.4.9 : flash_erase.c
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Wood Scott-B07421 <B07421@freescale.com>,
 Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Kushwaha Prabhakar-B32579 <B32579@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Apr 6, 2012 at 20:52, Brian Norris wrote:
> On Thu, Apr 5, 2012 at 5:44 PM, Kushwaha Prabhakar-B32579 wrote:
>> Is there any plan to support MTD_OPS_AUTO_OOB in future in-case somebody send patch?
>
> At this point, I'd hope others might speak up. Personally, I don't see
> why we couldn't accept patch(es) if they are reviewed and tested
> properly. I don't know of a "plan."

if you cc-ed me in case of a plan, then i don't know of any ;)

mtd (kernel and user) has always seemed like it moves forward as
people have needs and send [good] patches to fulfill those needs
-mike
