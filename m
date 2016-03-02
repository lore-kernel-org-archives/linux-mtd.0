Received: from smtprelay0051.hostedemail.com ([216.40.44.51]
 helo=smtprelay.hostedemail.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1abBN8-0004Y7-Gt
 for linux-mtd@lists.infradead.org; Wed, 02 Mar 2016 18:19:43 +0000
Message-ID: <1456942752.4044.22.camel@perches.com>
Subject: Re: [PATCH V2] ubifs: Add logging functions for ubifs_msg,
 ubifs_err and ubifs_warn
From: Joe Perches <joe@perches.com>
To: Artem Bityutskiy <dedekind1@gmail.com>, Adrian Hunter
 <adrian.hunter@intel.com>
Cc: linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, Richard
 Weinberger <richard@nod.at>
Date: Wed, 02 Mar 2016 10:19:12 -0800
In-Reply-To: <6f81fc68890afcdf53defe70df9b182be9f26df8.1456258476.git.joe@perches.com>
References: <6f81fc68890afcdf53defe70df9b182be9f26df8.1456258476.git.joe@perches.com>
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

On Tue, 2016-02-23 at 12:21 -0800, Joe Perches wrote:
> The existing logging macros are fairly large and converting the
> macros to functions make the object code smaller.

Artem and Adrian are the nominal maintainers for ubifs.

Artem last had a sign-off on a ubifs patch 6 months ago and
Adrian's
last one was over 3 years ago.

Is there an expected ack/nack/applied handling time for a
ubifs patch like this?

Should this patch go to someone else?

Should the MAINTAINERS entry for ubifs be changed to orphan?
