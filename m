Message-ID: <54536834.1020005@huawei.com>
Date: Fri, 31 Oct 2014 18:45:08 +0800
From: hujianyang <hujianyang@huawei.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>
Subject: Re: [PATCH] UBI: vtbl: Use ubi_eba_atomic_leb_change()
References: <1414259021-5691-1-git-send-email-richard@nod.at>
 <1414659349.23185.27.camel@sauron.fi.intel.com> <54530A29.9070208@huawei.com>
 <545343CA.7080507@nod.at>
In-Reply-To: <545343CA.7080507@nod.at>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014/10/31 16:09, Richard Weinberger wrote:
> Hujianyang,
> 
> Am 31.10.2014 um 05:03 schrieb hujianyang:
>> Hi Artem and Richard,
>>
>> We are using atomic operation, leb_change(), for master_node
>> in ubifs-level. We use two lebs for master_node even if they
>> are changed with atomic operation.
>>
>> I think volume_table and master_node play similar roles. Do
>> you think changing VTBL record into one peb is OK? I just
>> what to know if I missed something. Could you please take
>> some time to explain that?
> 
> I'm not sure if I correctly understand your question.
> 
> If we use only one PEB for the VTBL existing UBI implementations
> would break as they assume we have two.
> 
> Thanks,
> //richard
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 

This question is basing on your comment for this patch:

"""
we can guarantee that the first VTBL record is always
correct and we don't really need the second one anymore.
"""

I think that means one PEB is enough in your considering.
So I want to know if you are sure about this. Because
we use two leb for master_node in ubifs-level. So maybe
VTBL is like super_node, not master_node, right?
