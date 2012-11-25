Received: from blu0-omc1-s30.blu0.hotmail.com ([65.55.116.41])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1Tcg3m-0001K5-D3
 for linux-mtd@lists.infradead.org; Sun, 25 Nov 2012 17:32:03 +0000
Message-ID: <BLU0-SMTP604CA68AAFEE15FBE5CF7DB8580@phx.gbl>
From: Bill Pringlemeir <bpringle@sympatico.ca>
To: dedekind1@gmail.com
Subject: Re: [PATCH 2/2] ubi-tests/integ: Add PRIxxx_t defines.
References: <BLU0-SMTP308EDE3F432519B05D37A0B8640@phx.gbl>
 <1353053478.3618.1.camel@sauron.fi.intel.com>
Date: Sun, 25 Nov 2012 12:33:11 -0500
In-Reply-To: <1353053478.3618.1.camel@sauron.fi.intel.com> (Artem Bityutskiy's
 message of "Fri, 16 Nov 2012 10:11:18 +0200")
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On Mon, 2012-11-05 at 13:04 -0500, Bill Pringlemeir wrote:
>> I doubt this is the 'correct' solution, but it does show the issue.

[snip]

On 16 Nov 2012, dedekind1@gmail.com wrote:
> Instead, I just pushed a huge commit which changes ubi-tests so that
> they use the top-level common.h. Now everything compiles fine. Thanks!

That is what I thought was more appropriate (Ie, 'correct' :).

Regards,
Bill Pringlemeir.
