Received: from mga09.intel.com ([134.134.136.24])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZUGTR-0004gi-UB
 for linux-mtd@lists.infradead.org; Tue, 25 Aug 2015 15:49:22 +0000
Message-ID: <1440517736.15510.81.camel@gmail.com>
Subject: Re: [PATCH 2/2] ubifs: Allow O_DIRECT
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Chris Mason <clm@fb.com>, Dave Chinner <david@fromorbit.com>
Cc: Jeff Moyer <jmoyer@redhat.com>, Brian Norris
 <computersforpeace@gmail.com>,  Richard Weinberger <richard@nod.at>,
 Dongsheng Yang <yangds.fnst@cn.fujitsu.com>,
 linux-mtd@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-kernel@vger.kernel.org
Date: Tue, 25 Aug 2015 18:48:56 +0300
In-Reply-To: <20150825012831.GC7176@ret.masoncoding.com>
References: <1440016553-26481-1-git-send-email-richard@nod.at>
 <1440016553-26481-2-git-send-email-richard@nod.at>
 <55D542C5.6040500@cn.fujitsu.com> <1440070300.31419.202.camel@gmail.com>
 <55D5BC92.8050903@nod.at> <20150820204933.GG74600@google.com>
 <1440400405.15510.29.camel@gmail.com> <20150824161837.GA28975@localhost>
 <x49si78bo4j.fsf@segfault.boston.devel.redhat.com>
 <20150824234611.GV3902@dastard> <20150825012831.GC7176@ret.masoncoding.com>
Content-Type: text/plain; charset="UTF-8"
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

On Mon, 2015-08-24 at 21:28 -0400, Chris Mason wrote:
> This is what btrfs already does for O_DIRECT plus compressed, or
> other
> cases where people don't want their applications to break on top of
> new
> features that aren't quite compatible with it.

I do not know how much of direct IO we can do in UBIFS - we have
compression too, there is not block layer under us. But someone should
try and see what could be done.

Artem.
