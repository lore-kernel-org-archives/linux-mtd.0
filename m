Received: from mail-pz0-f49.google.com ([209.85.210.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T6pUl-0005zp-Nv
 for linux-mtd@lists.infradead.org; Wed, 29 Aug 2012 21:08:16 +0000
Received: by dajq27 with SMTP id q27so701676daj.36
 for <linux-mtd@lists.infradead.org>; Wed, 29 Aug 2012 14:08:13 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1346244570.2848.470.camel@sauron.fi.intel.com>
References: <1345982808-11440-1-git-send-email-akinobu.mita@gmail.com>
 <1345982808-11440-4-git-send-email-akinobu.mita@gmail.com>
 <1346244570.2848.470.camel@sauron.fi.intel.com>
Date: Thu, 30 Aug 2012 06:08:13 +0900
Message-ID: <CAC5umyi7m4BBpFQHOaOBeoNekx_VB=sLKxo+eAc7x_x+1uRF8A@mail.gmail.com>
Subject: Re: [PATCH v2 3/6] mtd: mtd_nandecctest: rewrite the test routine
From: Akinobu Mita <akinobu.mita@gmail.com>
To: artem.bityutskiy@linux.intel.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: David Woodhouse <dwmw2@infradead.org>, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/8/29 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>:
> On Sun, 2012-08-26 at 21:06 +0900, Akinobu Mita wrote:
>> This rewrites the entire test routine in order to make it easy to add more
>> tests by later changes and minimize duplication of each tests as much as
>> possible.
>>
>> Signed-off-by: Akinobu Mita <akinobu.mita@gmail.com>
>> Cc: David Woodhouse <dwmw2@infradead.org>
>> Cc: linux-mtd@lists.infradead.org
>> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>> ---
>>  drivers/mtd/tests/mtd_nandecctest.c | 136 +++++++++++++++++++++++++++---------
>>  1 file changed, 104 insertions(+), 32 deletions(-)
>
> This patch is still too large for me to review. Could you please split
> it further?

OK, I'll try again.
