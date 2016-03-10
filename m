Received: from smtprelay0176.hostedemail.com ([216.40.44.176]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ae6MD-0003wb-Ad
 for linux-mtd@lists.infradead.org; Thu, 10 Mar 2016 19:34:49 +0000
Message-ID: <1457638462.3433.21.camel@perches.com>
Subject: Re: checkpatch.pl false positive: FSF mailing address
From: Joe Perches <joe@perches.com>
To: Brian Norris <computersforpeace@gmail.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>, Linux
 Kernel <linux-kernel@vger.kernel.org>
Date: Thu, 10 Mar 2016 11:34:22 -0800
In-Reply-To: <20160310192818.GA9902@google.com>
References: <20160310190023.GB2545@google.com>
 <1457636880.3433.12.camel@perches.com>
 <CAN8TOE-dOUsuPfm8cp6c3k94XRzyyCb1g7sAaPeOdaxS9zG-uA@mail.gmail.com>
 <1457637955.3433.17.camel@perches.com> <20160310192818.GA9902@google.com>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2016-03-10 at 11:28 -0800, Brian Norris wrote:
> On Thu, Mar 10, 2016 at 11:25:55AM -0800, Joe Perches wrote:
> > On Thu, 2016-03-10 at 11:15 -0800, Brian Norris wrote:
> > > On Thu, Mar 10, 2016 at 11:08 AM, Joe Perches <joe@perches.com> wrote:
> > > > checkpatch is stupid, false positives will always exist.
> > I'd almost rather have people understand this.
> Then perhaps I'll also patch this note out:
> 
> NOTE: If any of the errors are false positives, please report
>       them to the maintainer, see CHECKPATCH in MAINTAINERS.

Maybe add: "but remember, CHECKPATCH is stupid, you're not".
