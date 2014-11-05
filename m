Received: from mga01.intel.com ([192.55.52.88])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xm2vi-00074n-3U
 for linux-mtd@lists.infradead.org; Wed, 05 Nov 2014 15:55:30 +0000
Message-ID: <1415202877.958.131.camel@sauron.fi.intel.com>
Subject: Re: [PATCH 06/35] UBI: Fastmap: Ensure that all fastmap work is
 done upon WL shutdown
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
To: Richard Weinberger <richard@nod.at>
Date: Wed, 05 Nov 2014 17:54:37 +0200
In-Reply-To: <545A46F0.7030805@nod.at>
References: <1414586758-9972-1-git-send-email-richard@nod.at>
 <1414586758-9972-7-git-send-email-richard@nod.at>
 <1415202307.958.125.camel@sauron.fi.intel.com> <545A46F0.7030805@nod.at>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 tlinder@codeaurora.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2014-11-05 at 16:49 +0100, Richard Weinberger wrote:
> If you want I can rebase.

That would be very helpful.

> I did all fixes first and then the cleanups.

Well, the first patch adds debugging stuff - not exactly a fix ;-)
