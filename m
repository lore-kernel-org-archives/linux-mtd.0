Received: from mail-ob0-x22f.google.com ([2607:f8b0:4003:c01::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvFqS-00016I-Jo
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 02:04:25 +0000
Received: by obbea2 with SMTP id ea2so15912085obb.3
 for <linux-mtd@lists.infradead.org>; Wed, 20 May 2015 19:04:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1432173713.27761.157.camel@freescale.com>
References: <1431420591-20453-1-git-send-email-r65777@rhuath.am.freescale.net>
 <1431438951.16357.490.camel@freescale.com>
 <20150519220124.GA11598@ld-irv-0074>
 <1432172966.27761.153.camel@freescale.com>
 <1432173713.27761.157.camel@freescale.com>
Date: Wed, 20 May 2015 19:04:03 -0700
Message-ID: <CAN8TOE_YD1-j8TCOoJWQ7xNDA-gAu17H8ORWiRKxDH8DSDLcSw@mail.gmail.com>
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

On Wed, May 20, 2015 at 7:01 PM, Scott Wood <scottwood@freescale.com> wrote:
> On Wed, 2015-05-20 at 20:49 -0500, Scott Wood wrote:
>> > I don't mind either tree. I don't think fsl_ifc_nand.c will have
>> > anything noisy in linux-mtd for this release cycle.
>>
>> OK.  I'll resend the patch, as my e-mails seem to get through; please
>> either ack or apply (assuming no problems with it).
>
> ...and now it's telling me my last e-mail was held for moderation due to
> being a non-member, even though I'm subscribed to linux-mtd using this
> e-mail address. :-(

I got the same. But if you read carefully, it's because you sent to
mailman@llists.infradead.org. That's either not a valid email, or it's
actually a mailing list that you're not subscribed to.

Brian
