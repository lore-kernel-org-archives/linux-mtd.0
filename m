Received: from mail-vc0-x22f.google.com ([2607:f8b0:400c:c03::22f])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRb4H-0007sK-5w
 for linux-mtd@lists.infradead.org; Thu, 03 Oct 2013 05:03:18 +0000
Received: by mail-vc0-f175.google.com with SMTP id ia10so700664vcb.34
 for <linux-mtd@lists.infradead.org>; Wed, 02 Oct 2013 22:02:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1379632757.12963.4.camel@shinybook.infradead.org>
References: <20130919194752.GA19975@quad.lixom.net>
 <1379626776.753.164.camel@shinybook.infradead.org>
 <CAN8TOE8j=oosn-5hAdqoTPcuW-sGvDAHd_nK6BZfJpxMwwpisQ@mail.gmail.com>
 <1379632757.12963.4.camel@shinybook.infradead.org>
Date: Wed, 2 Oct 2013 22:02:54 -0700
Message-ID: <CAN8TOE-AozeOs3N0q4x-cMbvRnSTcJYCRx83K-56UJth_WGp3A@mail.gmail.com>
Subject: Re: [GIT PULL] ARM: SoC fixes for 3.12-rc
From: Brian Norris <computersforpeace@gmail.com>
To: "Woodhouse, David" <david.woodhouse@intel.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(Trimming CC list)

Hi David,

On Thu, Sep 19, 2013 at 4:19 PM, Woodhouse, David
<david.woodhouse@intel.com> wrote:
> On Thu, 2013-09-19 at 15:57 -0700, Brian Norris wrote:
>> Speaking of such process issues: there's an outstanding patch for a
>> (small) memory leak that was introduced in the nand_base.c ONFI code
>> in 3.12-rc1. Can I expect you to attend to these sort of -rcX (where X
>> > 1) issues? Or should I send Linus the patch myself? I don't really
>> want it to wait around until 3.13-rc1 to go to -stable.
>
> I'm aware of it, and will get to it shortly. Was going to round it up
> along with the one that Olof just sent, either some time this week at
> Plumbers or when I get home.

I see that you have queued up some 3.12-rc patches in linux-mtd.git.
This is a reminder to send a pull request...

> If you want to stick it in the linux-mtd.git tree before that and send
> Linus a pull request, I have no objection.

...or else I will just send them myself within a week.

Thanks,
Brian
