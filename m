Received: from mail-vb0-x232.google.com ([2607:f8b0:400c:c02::232])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VdqLh-00006Y-FO
 for linux-mtd@lists.infradead.org; Tue, 05 Nov 2013 23:47:54 +0000
Received: by mail-vb0-f50.google.com with SMTP id x16so2991559vbf.9
 for <linux-mtd@lists.infradead.org>; Tue, 05 Nov 2013 15:47:32 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20131105144328.fb5a6a1d423776b324771706@linux-foundation.org>
References: <C3050A4DBA34F345975765E43127F10F1C0643B8@szxeml512-mbx.china.huawei.com>
 <20131020120603.GA18678@localhost>
 <C3050A4DBA34F345975765E43127F10F1C084C81@szxeml512-mbs.china.huawei.com>
 <20131105144328.fb5a6a1d423776b324771706@linux-foundation.org>
Date: Tue, 5 Nov 2013 15:47:31 -0800
Message-ID: <CAN8TOE8CoSsUSGaLG5Z_-xVLhhnm052Hp2Rqzs3Hr3cU8Lp-8g@mail.gmail.com>
Subject: Re: [PATCH 2/2] mtd: cmdlinepart: use cmdline partition parser lib
From: Brian Norris <computersforpeace@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 Caizhiyong <caizhiyong@hisilicon.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Karel Zak <kzak@redhat.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Shmulik Ladkani <shmulik.ladkani@gmail.com>,
 Ezequiel Garcia <ezequiel.garcia@free-electrons.com>,
 "Wanglin \(Albert\)" <albert.wanglin@hisilicon.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 5, 2013 at 2:43 PM, Andrew Morton <akpm@linux-foundation.org> wrote:
> On Tue, 22 Oct 2013 13:14:17 +0000 Caizhiyong <caizhiyong@hisilicon.com> wrote:
>
>> In the previous version, adjust the cmdline parser code to library-style
>> code, and move it to a separate file "block/cmdline-parser.c", we can use
>> it in some client code. there is no any functionality change in the adjusting.
>>
>> this patch use cmdline parser lib.
>>
>> For further information, see "https://lkml.org/lkml/2013/8/6/550"
>
> Thanks for doing this.  Could we please get some acked-by's or,
> preferably, tested-by's from the MTD people?

Nobody has had time to test this on MTD, it seems, and as such, I
strongly recommend you do not force it through -mm. We are perfectly
capable of merging it through the MTD tree if it ever gets proper
vetting by people in MTD (not just on block devices), and I am well
aware of this patch set's existence.

However, the patch really provides little to no benefit to the MTD
subsystem at the moment, at the added cost of reviewing the small
differences in parsing. For some reason, Cai decided to make small
differences in the parser between drivers/mtd/cmdlinepart.c and
block/cmdline-parser.c, and it is not obvious that these differences
retain the same parsing. For instance, according to my code
read-through, the block device parser seems to accept multiple
partitions to be specified with "-" (meaning "fill the remaining
device"). MTD already has code that rejects such a parser string
outright.

So, I'd recommend one of the following:
(1) We (MTD users) make more time to properly test this patch and post
relevant results (i.e., tested partition strings) or
(2) Somebody (Cai?) spend time to actually make block/cmdline-parser.c
fully equivalent to the parser in drivers/mtd/cmdlinepart.c. That
means it should be trivial to compare the two and say "yes, these are
equivalent". That is currently not the case, AFAICT.

Without one of those two, I will give my NAK.

Brian
