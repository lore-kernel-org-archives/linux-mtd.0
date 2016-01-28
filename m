Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aOiwI-0007c0-20
 for linux-mtd@lists.infradead.org; Thu, 28 Jan 2016 09:32:31 +0000
Subject: Re: [PATCH 1/1] fs:ubifs:recovery:fixup UBIFS cannot recover master
 node issue
To: =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?=
 <beanhuo@micron.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 Adrian Hunter <adrian.hunter@intel.com>,
 Brian Norris <computersforpeace@gmail.com>
References: <A765B125120D1346A63912DDE6D8B6310BF53F90@NTXXIAMBX02.xacn.micron.com>
 <566A9378.4070900@nod.at>
 <A765B125120D1346A63912DDE6D8B6310BF54200@NTXXIAMBX02.xacn.micron.com>
 <566F03AC.90305@nod.at>
 <A765B125120D1346A63912DDE6D8B6310BF65A47@NTXXIAMBX02.xacn.micron.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 =?UTF-8?B?UGV0ZXIgUGFuIOa9mOagiyAocGV0ZXJwYW5kb25nKQ==?=
 <peterpandong@micron.com>, =?UTF-8?B?S2FybCBaaGFuZyDlvKDlj4zplKMgKGthcmx6?=
 =?UTF-8?Q?hang=29?= <karlzhang@micron.com>,
 =?UTF-8?B?SmFzb24gVGlhbiDnlLDmmZPlvLogKGphc29udGlhbik=?=
 <jasontian@micron.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56A9E00E.1070706@nod.at>
Date: Thu, 28 Jan 2016 10:31:58 +0100
MIME-Version: 1.0
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF65A47@NTXXIAMBX02.xacn.micron.com>
Content-Type: text/plain; charset=gbk
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bean,

Am 28.01.2016 um 03:42 schrieb Bean Huo »ô±ó±ó (beanhuo):
>> This needs a much more detailed explanation.
>> In which scenarios on SLC NAND can you get such an unmountable UBIFS?
> 
> 
> It is my mistake involved SLC NAND.
> Definitely, SLC NAND does not exist two pages being damaged within one block.
> I mean that master should be recovered as long as one good master block exists.
> I think, at least this method is more reasonable.
> My question is that why UBI doesn't recover master node for this scenario?

UBIFS assumes that on SLC NAND already written pages must not
corrupt. It can deal with the fact that pages can get damaged while writing them (think of a power cut).
But if page X is written and UBIFS moves over to X + 1, X must never corrupt.

If this happens, something very nasty happened and UBIFS cannot operate correctly.
With your patch it may mount somehow but *will* die or lose data soon or later as the same assumptions
apply to all other UBIFS operations. It is not just about master nodes.
Master nodes are the messenger.

UBIFS' strict checks turned out to be very valuable in the past to identify driver/MTD issues.
This is why I like them so much.

>> Maybe UBIFS is too strict and NAND behaves differently than UBIFS expects
>> but we need to understand it in depth.
> For this, I think, maybe MLC NAND had not been released yet when UBI initial design.
> I would like to send my version 2 patch based on your suggestion.

If you can explain in detail why UBIFS' assumptions are wrong and how such corruptions can happen
on SLC we can talk.
But I think then we'd have to redo a lot of UBI and UBIFS code.

Thanks,
//richard
