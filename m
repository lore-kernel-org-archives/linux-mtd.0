Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZRxM1-0001yc-AF
 for linux-mtd@lists.infradead.org; Wed, 19 Aug 2015 07:00:10 +0000
Subject: Re: [kernel.org bug 103071] Dead "security.*" xattr code in ubifs
To: Sheng Yong <shengyong1@huawei.com>,
 =?UTF-8?Q?Andreas_Gr=c3=bcnbacher?= <andreas.gruenbacher@gmail.com>
References: <CAHpGcM+bkFA-UDM0FKwH=FkS9+TWv_Br7nWJXSpKDquo5n_gFw@mail.gmail.com>
 <CAFLxGvxPGZoRX3Ft_g59fzfLhoOmEES=q-oPBmYuGVBzn-dRUA@mail.gmail.com>
 <55D3D6BB.3030307@huawei.com> <55D3DDD1.8060405@huawei.com>
Cc: snijsure@grid-net.com, Artem Bityutskiy <dedekind1@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 mkl@pengutronix.de, gratian.crisan@ni.com, brad.mouring@ni.com
From: Richard Weinberger <richard@nod.at>
Message-ID: <55D42959.5070605@nod.at>
Date: Wed, 19 Aug 2015 08:59:37 +0200
MIME-Version: 1.0
In-Reply-To: <55D3DDD1.8060405@huawei.com>
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

Am 19.08.2015 um 03:37 schrieb Sheng Yong:
> 
> 
> On 8/19/2015 9:07 AM, Sheng Yong wrote:
>> Hi,
>>
>> On 8/19/2015 4:55 AM, Richard Weinberger wrote:
>>> Andreas,
>>>
>>> On Tue, Aug 18, 2015 at 2:15 PM, Andreas Grünbacher
>>> <andreas.gruenbacher@gmail.com> wrote:
>>>> Hello,
>>>>
>>>> FYI, I've filed the following bug report against ubifs:
>>>>
>>>>> ubifs sets sb->s_xattr to ubifs_xattr_handlers which contains a handler for
>>>>> "security.*" xattrs. The s_xattr handlers are never used because ubifs uses
>>>>> its own ubifs_{get,set,list,remove}xattr inode operations instead of
>>>>> generic_{get,set,list,remove}xattr inode operations though.
>>>>
>>>> https://bugzilla.kernel.org/show_bug.cgi?id=103071
>>>
>>> Thanks for reporting.
> My bad for didn't reply at the right line :(
>> This is because UBIFS did not implement extended attribute in the geneirc way
>> (by calling generic_*xattr()). We could create an xattr_handler to have these
>> dead functions called (in fact, I did that), but doing this seems just another
>> encapsulation and makes no sense. So I think we could remove these dead code
>> directly.

So, that would be a revert of commit d7f0b70d30ffb9bbe6b8a3e1035cf0b79965ef53?
I don't get what d7f0b70d30ffb9bbe6b8a3e1035cf0b79965ef53 was supposed to do
as it seems to be a no-op. :-)

Thanks,
//richard
