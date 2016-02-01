Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aQ9rT-0001vp-9H
 for linux-mtd@lists.infradead.org; Mon, 01 Feb 2016 08:29:29 +0000
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
 <56A9E00E.1070706@nod.at>
 <A765B125120D1346A63912DDE6D8B6310BF66E56@NTXXIAMBX02.xacn.micron.com>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 =?UTF-8?B?UGV0ZXIgUGFuIOa9mOagiyAocGV0ZXJwYW5kb25nKQ==?=
 <peterpandong@micron.com>, =?UTF-8?B?S2FybCBaaGFuZyDlvKDlj4zplKMgKGthcmx6?=
 =?UTF-8?Q?hang=29?= <karlzhang@micron.com>,
 =?UTF-8?B?SmFzb24gVGlhbiDnlLDmmZPlvLogKGphc29udGlhbik=?=
 <jasontian@micron.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <56AF1749.2010806@nod.at>
Date: Mon, 1 Feb 2016 09:28:57 +0100
MIME-Version: 1.0
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF66E56@NTXXIAMBX02.xacn.micron.com>
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

Am 01.02.2016 um 08:17 schrieb Bean Huo »ô±ó±ó (beanhuo):
>> If you can explain in detail why UBIFS' assumptions are wrong and how such
>> corruptions can happen on SLC we can talk.
>> But I think then we'd have to redo a lot of UBI and UBIFS code.
> 
> I will hack my patch again, and double check these strict checks.
> But I still insist on Master node should always be recovered by another good master,
> even if two corrupted pages exist in one block. This is more reasonable and reliable.
> Of course, so far, we did not meet this scenario on SLC NAND.
> Current UBIFS master node recovery mechanism totally can handle with
> Power loss no matter MLC or SLC, why not let UBIFS more reliable? Two master node blocks
> Just for SLC NAND?

Of course, I'm all for improvements. But if you talk about "more reliable" you have to define
first what the issue is.
As I said, we have this strict checks for reasons and they did a very
good service so far.
I've seen a lot UBIFS corruptions where the master node was damaged but not a single time
it was UBIFS' fault. It was always a subtle MTD driver issue.

Thanks,
//richard
