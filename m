Received: from mail-bn1on0132.outbound.protection.outlook.com
 ([157.56.110.132] helo=na01-bn1-obe.outbound.protection.outlook.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YvG16-0006k9-33
 for linux-mtd@lists.infradead.org; Thu, 21 May 2015 02:15:25 +0000
Message-ID: <1432174491.27761.168.camel@freescale.com>
Subject: Re: [PATCH 1/1] [RESEND] IFC: Change IO accessor based on endianness
From: Scott Wood <scottwood@freescale.com>
To: Brian Norris <computersforpeace@gmail.com>
Date: Wed, 20 May 2015 21:14:51 -0500
In-Reply-To: <CAN8TOE_YD1-j8TCOoJWQ7xNDA-gAu17H8ORWiRKxDH8DSDLcSw@mail.gmail.com>
References: <1431420591-20453-1-git-send-email-r65777@rhuath.am.freescale.net>
 <1431438951.16357.490.camel@freescale.com>
 <20150519220124.GA11598@ld-irv-0074>
 <1432172966.27761.153.camel@freescale.com>
 <1432173713.27761.157.camel@freescale.com>
 <CAN8TOE_YD1-j8TCOoJWQ7xNDA-gAu17H8ORWiRKxDH8DSDLcSw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
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

On Wed, 2015-05-20 at 19:04 -0700, Brian Norris wrote:
> On Wed, May 20, 2015 at 7:01 PM, Scott Wood <scottwood@freescale.com> wrote:
> > On Wed, 2015-05-20 at 20:49 -0500, Scott Wood wrote:
> >> > I don't mind either tree. I don't think fsl_ifc_nand.c will have
> >> > anything noisy in linux-mtd for this release cycle.
> >>
> >> OK.  I'll resend the patch, as my e-mails seem to get through; please
> >> either ack or apply (assuming no problems with it).
> >
> > ...and now it's telling me my last e-mail was held for moderation due to
> > being a non-member, even though I'm subscribed to linux-mtd using this
> > e-mail address. :-(
> 
> I got the same. But if you read carefully, it's because you sent to
> mailman@llists.infradead.org. That's either not a valid email, or it's
> actually a mailing list that you're not subscribed to.

I looked carefully at the e-mails in my sent folder and I don't see
"llists".

I CCed mailmain@lists.infradead.org because
http://lists.infradead.org/mailman/listinfo says, "If you are having
trouble using the lists, please contact mailman@lists.infradead.org."  I
didn't realize that was a mailing list rather than an admin contact
address.

-Scott
