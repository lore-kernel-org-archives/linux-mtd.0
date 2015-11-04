Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Ztt3C-0001l2-W0
 for linux-mtd@lists.infradead.org; Wed, 04 Nov 2015 08:04:12 +0000
Subject: Re: master node can not be recovered
To: =?UTF-8?B?QmVhbiBIdW8g6ZyN5paM5paMIChiZWFuaHVvKQ==?=
 <beanhuo@micron.com>, "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
References: <A765B125120D1346A63912DDE6D8B6310BF4FB2A@NTXXIAMBX02.xacn.micron.com>
 <5637934D.5000503@nod.at> <1446541937.6126.125.camel@gmail.com>
 <A765B125120D1346A63912DDE6D8B6310BF4FE9E@NTXXIAMBX02.xacn.micron.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <5639BBDE.5000604@nod.at>
Date: Wed, 4 Nov 2015 09:03:42 +0100
MIME-Version: 1.0
In-Reply-To: <A765B125120D1346A63912DDE6D8B6310BF4FE9E@NTXXIAMBX02.xacn.micron.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 04.11.2015 um 08:43 schrieb Bean Huo 霍斌斌 (beanhuo):
> 
>> On Mon, 2015-11-02 at 17:46 +0100, Richard Weinberger wrote:
>>> ubifs_recover_master_node() is very strict.
>>
>> Just like the rest of the recovery code, the master node part is consistent with
>> that.
>>
>>> Can it be that in your case more than the last written page is
>>> corrupted?
>>
>> I suspect so too.
> 
> Hi, Artem
> 	The second master node not be corrupted. I will test again later, and send it out.

UBIFS uses two LEBs to store master nodes.
If UBIFS was interrupted (unclean reboot) while writing a master node it will double check
whether only this last written page is corrupted and then copy the node from the
second LEB.
But if two or more pages are corrupted UBIFS will give up as this most not happen
from UBIFS's point of view.

Thanks,
//richard
