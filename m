Received: from mail-pa0-f49.google.com ([209.85.220.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TTbwP-0003Gu-Ud
 for linux-mtd@lists.infradead.org; Wed, 31 Oct 2012 17:18:59 +0000
Received: by mail-pa0-f49.google.com with SMTP id bi5so1038594pad.36
 for <linux-mtd@lists.infradead.org>; Wed, 31 Oct 2012 10:18:56 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1351701009.8774.24.camel@shinybook.infradead.org>
References: <1351679539-30651-1-git-send-email-robin@protonic.nl>
 <50914F32.7020605@gmail.com>
 <1351701009.8774.24.camel@shinybook.infradead.org>
Date: Wed, 31 Oct 2012 10:18:55 -0700
Message-ID: <CAN8TOE9epkK8GCbx5KoKKKQna83uWT-sJ9WFob1F3V0LU5h3+Q@mail.gmail.com>
Subject: Re: [PATCH] mtd: nand: Take celltype into account when parsing
 Samsung ext. nand ID's
From: Brian Norris <computersforpeace@gmail.com>
To: David Woodhouse <dwmw2@infradead.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Robin van der Gracht <robin@protonic.nl>, Vipin Kumar <vipin.kumar@st.com>,
 linux-mtd@lists.infradead.org, sjhill@realitydiluted.com, tglx@linutronix.de
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Oct 31, 2012 at 9:30 AM, David Woodhouse <dwmw2@infradead.org> wrote:
> On Wed, 2012-10-31 at 09:17 -0700, Brian Norris wrote:
>> I believe this regression has already been fixed and accepted by David
>> Woodhouse and is awaiting upstream submission - hopefully for the 3.7-rc
>> cycle. This should be its ID, in linux-mtd.git (and linux-next):
>
> Hm, did I not push that to Linus yet? I'll do so shortly. Anything else
> we need to get in to 3.7 while I'm at it?

I don't know of much, but this commit is actually relevant to the same
patch series, since I increased the max OOB size. In l2-mtd-2.6.git:

commit acc6ceeb2ee2f1c7dae1e25914b40f0c294f6b42
mtd: nand: Increase the ecc placement locations to 640

I'll leave it to the author (Vipin), Artem, and you to decide if it
needs to be pushed ahead to 3.7.

Brian
