Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZiRlE-0005dx-Rj
 for linux-mtd@lists.infradead.org; Sat, 03 Oct 2015 18:42:21 +0000
Subject: Re: [Resend PATCH 0/2] UBIFS: two trivial fix
To: dedekind1@gmail.com, Sheng Yong <shengyong1@huawei.com>
References: <1442999500-5343-1-git-send-email-shengyong1@huawei.com>
 <56024416.6090806@nod.at> <1442990709.19983.189.camel@gmail.com>
Cc: linux-mtd@lists.infradead.org
From: Richard Weinberger <richard@nod.at>
Message-ID: <56102173.8020606@nod.at>
Date: Sat, 3 Oct 2015 20:41:55 +0200
MIME-Version: 1.0
In-Reply-To: <1442990709.19983.189.camel@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 23.09.2015 um 08:45 schrieb Artem Bityutskiy:
> On Wed, 2015-09-23 at 08:17 +0200, Richard Weinberger wrote:
>> Am 23.09.2015 um 11:11 schrieb Sheng Yong:
>>> Sheng Yong (2):
>>>   UBIFS: call dbg_is_power_cut() instead of reading c->dbg
>>> ->pc_happened
>>>   UBIFS: print verbose message when rescanning a corrupted node
>>>
>>>  fs/ubifs/debug.c    | 8 ++++----
>>>  fs/ubifs/recovery.c | 2 +-
>>>  2 files changed, 5 insertions(+), 5 deletions(-)
>>
>> Patches look good to me. :-)
>> Artem, I'd queue them for v4.4, ok?
> 
> Yes, thanks,
> 
> Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>

Applied!

Thanks,
//richard
