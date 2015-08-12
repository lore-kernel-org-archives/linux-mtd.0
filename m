Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPM0y-00051K-OG
 for linux-mtd@lists.infradead.org; Wed, 12 Aug 2015 02:43:41 +0000
Message-ID: <55CAB16A.7070307@cn.fujitsu.com>
Date: Wed, 12 Aug 2015 10:37:30 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>, <richard@nod.at>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3] ubifs: make ubifs_[get|set]xattr atomic
References: <55C444EA.7090305@cn.fujitsu.com>		
 <1438927640-14931-1-git-send-email-yangds.fnst@cn.fujitsu.com>	
 <1439193902.26877.96.camel@gmail.com> <55C96CBD.6070303@cn.fujitsu.com>
 <1439297201.31419.25.camel@gmail.com>
In-Reply-To: <1439297201.31419.25.camel@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 08/11/2015 08:46 PM, Artem Bityutskiy wrote:
> On Tue, 2015-08-11 at 11:32 +0800, Dongsheng Yang wrote:
>> So, I think fields in host are all protected by host->ui_mutex and
>> fields in xattr inodes are all protected by individual ui_mutex.
>>
>> Am I missing something?
>
> OK, on a second look, your patch is probably fine.
>
>> BTW, I found I have to add ui_mutex in create_xattr() even if you
>> agree with it. :)
>
> I am not sure about this. I thought xattrs are not visible to anyone
> while they are being created, so you do not need any locking there,
> since you do not have anyone to race with you.

Makes sense.

Yang
>
> Artem/
>
>
>
