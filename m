Received: from szxga02-in.huawei.com ([119.145.14.65])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRsL2-0006xG-IH
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 01:38:50 +0000
Message-ID: <55D3DDD1.8060405@huawei.com>
Date: Wed, 19 Aug 2015 09:37:21 +0800
From: Sheng Yong <shengyong1@huawei.com>
MIME-Version: 1.0
To: Richard Weinberger <richard.weinberger@gmail.com>, =?UTF-8?B?QW5kcmVh?=
 =?UTF-8?B?cyBHcsO8bmJhY2hlcg==?= <andreas.gruenbacher@gmail.com>
CC: <snijsure@grid-net.com>, Artem Bityutskiy <dedekind1@gmail.com>,
 <ben.shelton@ni.com>, <terry.wilcox@ni.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 <mkl@pengutronix.de>, <gratian.crisan@ni.com>, <brad.mouring@ni.com>
Subject: Re: [kernel.org bug 103071] Dead "security.*" xattr code in ubifs
References: <CAHpGcM+bkFA-UDM0FKwH=FkS9+TWv_Br7nWJXSpKDquo5n_gFw@mail.gmail.com>
 <CAFLxGvxPGZoRX3Ft_g59fzfLhoOmEES=q-oPBmYuGVBzn-dRUA@mail.gmail.com>
 <55D3D6BB.3030307@huawei.com>
In-Reply-To: <55D3D6BB.3030307@huawei.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 8/19/2015 9:07 AM, Sheng Yong wrote:
> Hi,
> 
> On 8/19/2015 4:55 AM, Richard Weinberger wrote:
>> Andreas,
>>
>> On Tue, Aug 18, 2015 at 2:15 PM, Andreas Grünbacher
>> <andreas.gruenbacher@gmail.com> wrote:
>>> Hello,
>>>
>>> FYI, I've filed the following bug report against ubifs:
>>>
>>>> ubifs sets sb->s_xattr to ubifs_xattr_handlers which contains a handler for
>>>> "security.*" xattrs. The s_xattr handlers are never used because ubifs uses
>>>> its own ubifs_{get,set,list,remove}xattr inode operations instead of
>>>> generic_{get,set,list,remove}xattr inode operations though.
>>>
>>> https://bugzilla.kernel.org/show_bug.cgi?id=103071
>>
>> Thanks for reporting.
My bad for didn't reply at the right line :(
> This is because UBIFS did not implement extended attribute in the geneirc way
> (by calling generic_*xattr()). We could create an xattr_handler to have these
> dead functions called (in fact, I did that), but doing this seems just another
> encapsulation and makes no sense. So I think we could remove these dead code
> directly.
> 
> thanks,
> Sheng
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
