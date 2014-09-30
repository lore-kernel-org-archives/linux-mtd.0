Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYrOV-0000tw-1U
 for linux-mtd@lists.infradead.org; Tue, 30 Sep 2014 06:58:44 +0000
Message-ID: <542A548A.7040308@nod.at>
Date: Tue, 30 Sep 2014 08:58:18 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/4] UBI: Ensure that all fastmap work is done upon WL
 shutdown
References: <1412029248-22454-1-git-send-email-richard@nod.at>	
 <1412029248-22454-2-git-send-email-richard@nod.at>
 <1412058366.23429.77.camel@sauron.fi.intel.com>
In-Reply-To: <1412058366.23429.77.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 30.09.2014 08:26, schrieb Artem Bityutskiy:
> On Tue, 2014-09-30 at 00:20 +0200, Richard Weinberger wrote:
>> ...otherwise the deferred work might run after datastructures
>> got freed and corrupt memory.
> 
> How can this happend? The background thread is stopped by this time
> already, so what are the other possibilities? And why is this
> fastmap-only?

This has nothing do to with the background thread.
Fastmap has a work queue. If one fastmap work has been
scheuled we have to wait for it.

Thanks,
//richard
