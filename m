Received: from mail-ob0-x234.google.com ([2607:f8b0:4003:c01::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YEDfy-0000Jm-40
 for linux-mtd@lists.infradead.org; Thu, 22 Jan 2015 09:03:42 +0000
Received: by mail-ob0-f180.google.com with SMTP id uz6so334593obc.11
 for <linux-mtd@lists.infradead.org>; Thu, 22 Jan 2015 01:03:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <54BD7E7D.9060107@users.sourceforge.net>
References: <530CF8FF.8080600@users.sourceforge.net>
 <alpine.DEB.2.02.1402252117150.2047@localhost6.localdomain6>
 <530DD06F.4090703@users.sourceforge.net>
 <alpine.DEB.2.02.1402262129250.2221@localhost6.localdomain6>
 <5317A59D.4@users.sourceforge.net>
 <54BBE87C.9020705@users.sourceforge.net>
 <20150119175835.GH9759@ld-irv-0074>
 <54BD4AB6.70708@users.sourceforge.net>
 <20150119183057.GI9759@ld-irv-0074>
 <54BD55F6.6090609@users.sourceforge.net>
 <20150119203143.GL9759@ld-irv-0074>
 <54BD7E7D.9060107@users.sourceforge.net>
Date: Thu, 22 Jan 2015 01:03:20 -0800
Message-ID: <CAN8TOE9_cHJ+kbWGkaqHujLSWLLAAgXyumG5s9tWYoyrFk-=uQ@mail.gmail.com>
Subject: Re: [PATCH] MTD: Deletion of checks before the function call "iounmap"
From: Brian Norris <computersforpeace@gmail.com>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Content-Type: text/plain; charset=UTF-8
Cc: kernel-janitors@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
 Julia Lawall <julia.lawall@lip6.fr>, Kyungmin Park <kyungmin.park@samsung.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Replying, against my better judgment...

On Mon, Jan 19, 2015 at 2:00 PM, SF Markus Elfring
<elfring@users.sourceforge.net> wrote:
>> Now, have *you* learned anything from this approach?
>
> Yes, of course.   ;-)

Do you have any evidence of this? Details? The only evidence I see is
a long thread of similar patches from the last several months, of
varying (though not increasing) quality. Prior objections to your
approach were met with a distinct lack of self-awareness on your part.

> How would we like to tackle any corresponding software development challenges?

I don't really see many challenges here to tackle, except for the
social issue of dealing with patch bots like you. Your automated
patches are generally not solving real problems, but they are at times
introducing bugs. So the most efficient "solution" to this "challenge"
may simply be to ignore your patches.

Brian
