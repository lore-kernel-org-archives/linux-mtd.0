Received: from szxga03-in.huawei.com ([119.145.14.66])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xk3Sh-0006zM-4n
 for linux-mtd@lists.infradead.org; Fri, 31 Oct 2014 04:05:20 +0000
Message-ID: <54530A29.9070208@huawei.com>
Date: Fri, 31 Oct 2014 12:03:53 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH] UBI: vtbl: Use ubi_eba_atomic_leb_change()
References: <1414259021-5691-1-git-send-email-richard@nod.at>
 <1414659349.23185.27.camel@sauron.fi.intel.com>
In-Reply-To: <1414659349.23185.27.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: Richard Weinberger <richard@nod.at>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/10/30 16:55, Artem Bityutskiy wrote:
> On Sat, 2014-10-25 at 19:43 +0200, Richard Weinberger wrote:
>> This is more a cosmetic change than a fix.
>> By using ubi_eba_atomic_leb_change()
>> we can guarantee that the first VTBL record is always
>> correct and we don't really need the second one anymore.
>> But we have to keep the second one to not break anything.
>>
>> Signed-off-by: Richard Weinberger <richard@nod.at>
> 
> Yeah, this atomic change stuff was added later, and we had not
> envisioned originally. Your patch adds robustness, but makes volume
> creation slower, which is probably not a problem.
> 
> I've added a small comment and pushed it, thanks!
> 
> Artem
> 
> 

Hi Artem and Richard,

We are using atomic operation, leb_change(), for master_node
in ubifs-level. We use two lebs for master_node even if they
are changed with atomic operation.

I think volume_table and master_node play similar roles. Do
you think changing VTBL record into one peb is OK? I just
what to know if I missed something. Could you please take
some time to explain that?

Thanks very much~!

Hu
