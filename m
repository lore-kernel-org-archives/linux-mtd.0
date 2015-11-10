Received: from smtprelay0038.hostedemail.com ([216.40.44.38]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZwDvv-0001S5-Lw
 for linux-mtd@lists.infradead.org; Tue, 10 Nov 2015 18:46:20 +0000
Message-ID: <1447181155.2701.72.camel@perches.com>
Subject: Re: [PATCH] mtd: phram: error handling
From: Joe Perches <joe@perches.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: Saurabh Sengar <saurabh.truth@gmail.com>, andy.shevchenko@gmail.com,
 joern@lazybastard.org, dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 linux-kernel@vger.kernel.org
Date: Tue, 10 Nov 2015 10:45:55 -0800
In-Reply-To: <20151110183956.GQ12143@google.com>
References: <CAHp75VeUie1VdWUgXfFD6XqU5t_9j-40papME3-8MUvjMh1iMw@mail.gmail.com>
 <1447050198-20562-1-git-send-email-saurabh.truth@gmail.com>
 <20151110182047.GP12143@google.com> <1447180387.2701.68.camel@perches.com>
 <20151110183956.GQ12143@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2015-11-10 at 10:39 -0800, Brian Norris wrote:
> On Tue, Nov 10, 2015 at 10:33:07AM -0800, Joe Perches wrote:
> > Expand parse_err macro with hidden flow in-place.
> > Remove the now unused parse_err macro.
[]
> I think -EINVAL makes more sense than 1. That
> could be a subsequent patch, I suppose.

That means you have to trace all the callers
to verify that converting 1 to -22 is acceptable.

Maybe Saurabh wants to do that.
