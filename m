Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T1u8J-00072x-O8
 for linux-mtd@lists.infradead.org; Thu, 16 Aug 2012 07:04:45 +0000
Received: by pbbrq8 with SMTP id rq8so1161111pbb.36
 for <linux-mtd@lists.infradead.org>; Thu, 16 Aug 2012 00:04:39 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345024951.3393.119.camel@sauron.fi.intel.com>
References: <1341838545-25328-1-git-send-email-akinobu.mita@gmail.com>
 <1345024951.3393.119.camel@sauron.fi.intel.com>
Date: Thu, 16 Aug 2012 16:04:39 +0900
Message-ID: <CAC5umyifCfTohutFcmeEvL3G2_HZ_G1oMVc-6ivrbKsxHqSL5g@mail.gmail.com>
Subject: Re: [PATCH] mtd: mtd_nandecctest: add more tests
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

2012/8/15 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>:
> On Mon, 2012-07-09 at 21:55 +0900, Akinobu Mita wrote:
>> Current mtd nand ecc test module tests only single error correcting.
>>
>> This adds tests with possible corruption pattern as listed below and
>> overall rewrite for minimizing duplication of each test as much as
>> possible.
>
> This patch is very big, could you please split it on smaller patches
> which could be reviewed with less efforts?

Thanks for the feedback. I'll resubmit it.
