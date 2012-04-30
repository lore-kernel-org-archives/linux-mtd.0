Received: from mail-gy0-f177.google.com ([209.85.160.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SOyTR-0006G6-IB
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2012 21:49:38 +0000
Received: by ghbf11 with SMTP id f11so1854935ghb.36
 for <linux-mtd@lists.infradead.org>; Mon, 30 Apr 2012 14:49:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4F9EF447.6060506@freescale.com>
References: <1335576594-25267-1-git-send-email-computersforpeace@gmail.com>
 <1335576594-25267-10-git-send-email-computersforpeace@gmail.com>
 <20120429154707.01c7be55@pixies.home.jungo.com>
 <CAN8TOE-+4FP1rR82L2Kfg__MgmsmMQZuZ_BO_FCcvSZDasChNw@mail.gmail.com>
 <4F9EF447.6060506@freescale.com>
Date: Mon, 30 Apr 2012 14:49:35 -0700
Message-ID: <CAN8TOE80t39VYw328p1O8Hh6XdjGn5JLuG3ZftqH3e7u+JQp2Q@mail.gmail.com>
Subject: Re: [PATCH v3 09/10] mtd: nand: utilize oob_required parameter
From: Brian Norris <computersforpeace@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Apr 30, 2012 at 1:21 PM, Scott Wood <scottwood@freescale.com> wrote:
> On 04/30/2012 02:59 PM, Brian Norris wrote:
>> I see. This is the kind of issue I was alluding to back in v2:
>>
>> "For instance, is there any sort of hardware that expects the whole
>> page + OOB to be read via chip->read_buf() for all reads..."
>>
>> This situation comes up if NAND_NO_AUTOINCR is not set. But really, it
>> looks like we *always* have NAND_NO_AUTOINCR enabled, and so we
>> *always* send a new READ cmd. I know that it's possible for some board
>> driver to override this, but I don't see that anywhere...
>
> If it's never used, maybe just remove autoincrement support altogether
> and simplify the code?

Fine with me. I'd like some word from a Artem or David though.

I've started a patch for this and will send it before I send a v4 if
killing autoincrement is acceptable. Otherwise, I'll just work around
autoincrement for this series with the previously-posted snippet.

Brian
