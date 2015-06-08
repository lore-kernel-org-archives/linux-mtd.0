Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z1tqa-0000s1-A1
 for linux-mtd@lists.infradead.org; Mon, 08 Jun 2015 10:00:00 +0000
Message-ID: <5575667F.5020604@cn.fujitsu.com>
Date: Mon, 8 Jun 2015 17:55:11 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>
Subject: Re: [PATCH] ubifs: Introduce a mount option of force_atime.
References: <1433752038-17276-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1433755985.28854.3.camel@sauron.fi.intel.com>
In-Reply-To: <1433755985.28854.3.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: richard@nod.at, linux-mtd@lists.infradead.org, adrian.hunter@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 06/08/2015 05:33 PM, Artem Bityutskiy wrote:
> On Mon, 2015-06-08 at 16:27 +0800, Dongsheng Yang wrote:
>> Currently, ubifs does not support access time anyway. I understand
>> that there is a overhead to update inode in each access from user.
>>
>> But for the following two reasons, I think we can make it optional
>> to user.
>>
>> (1). More and more flash storage in server are trying to use ubifs,
>> it is not only for a device such as mobile phone any more, we want
>> to use it in more and more generic way. Then we need to compete
>> with some other main filesystems. From this point, access time is
>> necessary to us, at least as a choice to user currently.
>
> Hi,
>
> Could you please re-send this patch with the following list in CC:
>
> linux-fsdevel@vger.kernel.org

Okey, thanx
>
> This patch will probably need VFS-scope discussion, this is why I am
> asking to CC the general linux file-systems development mailing list.
>

> Thanks!
>
> .
>
