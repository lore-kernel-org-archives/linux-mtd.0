Received: from smtprelay0030.hostedemail.com ([216.40.44.30]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XNjLq-0005PB-0S
 for linux-mtd@lists.infradead.org; Sat, 30 Aug 2014 14:09:58 +0000
Message-ID: <1409407766.2664.0.camel@joe-AO725>
Subject: Re: [PATCH] mtd: denali: fix include guard and license block of
 denali.h
From: Joe Perches <joe@perches.com>
To: Josh Triplett <josh@joshtriplett.org>
Date: Sat, 30 Aug 2014 07:09:26 -0700
In-Reply-To: <20140829183050.GA1532@thin>
References: <1409310051-25726-1-git-send-email-yamada.m@jp.panasonic.com>
 <20140829183050.GA1532@thin>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: Huang Shijie <shijie8@gmail.com>, linux-kernel@vger.kernel.org,
 Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-mtd@lists.infradead.org,
 apw@canonical.com, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2014-08-29 at 11:30 -0700, Josh Triplett wrote:
> (Side note: could we get checkpatch to complain about comment headers
> containing the name of the file they appear in?  They're always either
> redundant or wrong.)

Sure, if you can write a regex to determine an
incorrect filename.

Good luck with that.
