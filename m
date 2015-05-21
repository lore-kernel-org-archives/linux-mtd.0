Received: from mail-ob0-x22a.google.com ([2607:f8b0:4003:c01::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvG5g-0001N9-Bk
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 02:20:09 +0000
Received: by obcus9 with SMTP id us9so50656714obc.2
 for <linux-mtd@lists.infradead.org>; Wed, 20 May 2015 19:19:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1432174491.27761.168.camel@freescale.com>
References: <1431420591-20453-1-git-send-email-r65777@rhuath.am.freescale.net>
 <1431438951.16357.490.camel@freescale.com>
 <20150519220124.GA11598@ld-irv-0074>
 <1432172966.27761.153.camel@freescale.com>
 <1432173713.27761.157.camel@freescale.com>
 <CAN8TOE_YD1-j8TCOoJWQ7xNDA-gAu17H8ORWiRKxDH8DSDLcSw@mail.gmail.com>
 <1432174491.27761.168.camel@freescale.com>
Date: Wed, 20 May 2015 19:19:46 -0700
Message-ID: <CAN8TOE-PYdAzeE1Fgb16Y4gSq98461GsU6sri3GtQeou8rBnkw@mail.gmail.com>
Subject: Re: [PATCH 1/1] [RESEND] IFC: Change IO accessor based on endianness
From: Brian Norris <computersforpeace@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Content-Type: text/plain; charset=UTF-8
Cc: Bharat Bhushan <Bharat.Bhushan@freescale.com>,
 David Woodhouse <dwmw2@infradead.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "prabhakar@freescale.com" <prabhakar@freescale.com>,
 Jaiprakash Singh <b44839@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, May 20, 2015 at 7:14 PM, Scott Wood <scottwood@freescale.com> wrote:
> On Wed, 2015-05-20 at 19:04 -0700, Brian Norris wrote:
>> On Wed, May 20, 2015 at 7:01 PM, Scott Wood <scottwood@freescale.com> wrote:
>> > On Wed, 2015-05-20 at 20:49 -0500, Scott Wood wrote:
>> >> > I don't mind either tree. I don't think fsl_ifc_nand.c will have
>> >> > anything noisy in linux-mtd for this release cycle.
>> >>
>> >> OK.  I'll resend the patch, as my e-mails seem to get through; please
>> >> either ack or apply (assuming no problems with it).
>> >
>> > ...and now it's telling me my last e-mail was held for moderation due to
>> > being a non-member, even though I'm subscribed to linux-mtd using this
>> > e-mail address. :-(
>>
>> I got the same. But if you read carefully, it's because you sent to
>> mailman@llists.infradead.org. That's either not a valid email, or it's
>> actually a mailing list that you're not subscribed to.
>
> I looked carefully at the e-mails in my sent folder and I don't see
> "llists".

Ugh, typo, sorry :( Should have been "lists"

> I CCed mailmain@lists.infradead.org because
> http://lists.infradead.org/mailman/listinfo says, "If you are having
> trouble using the lists, please contact mailman@lists.infradead.org."  I
> didn't realize that was a mailing list rather than an admin contact
> address.

Ah, OK. I have no idea what that mailing list is doing.

BTW, the linux-mtd page:

http://lists.infradead.org/mailman/listinfo/linux-mtd

says "linux-mtd list run by postmaster at lists.infradead.org", but
that address actually links to
"mailto:linux-mtd-owner@lists.infradead.org". This is all highly
confusing.

Perhaps David can shed light on this?

Brian
