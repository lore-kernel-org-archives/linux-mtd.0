Received: from [59.151.112.132] (helo=heian.cn.fujitsu.com)
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZPM1D-00055D-B2
 for linux-mtd@lists.infradead.org; Wed, 12 Aug 2015 02:43:55 +0000
Message-ID: <55CAB181.8030502@cn.fujitsu.com>
Date: Wed, 12 Aug 2015 10:37:53 +0800
From: Dongsheng Yang <yangds.fnst@cn.fujitsu.com>
MIME-Version: 1.0
To: <dedekind1@gmail.com>, <richard@nod.at>, <linux-mtd@lists.infradead.org>
Subject: Re: [PATCH v3] ubifs: make ubifs_[get|set]xattr atomic
References: <55C444EA.7090305@cn.fujitsu.com>	
 <1438927640-14931-1-git-send-email-yangds.fnst@cn.fujitsu.com>
 <1439297835.31419.31.camel@gmail.com>
In-Reply-To: <1439297835.31419.31.camel@gmail.com>
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

On 08/11/2015 08:57 PM, Artem Bityutskiy wrote:
> On Fri, 2015-08-07 at 14:07 +0800, Dongsheng Yang wrote:
>> +	mutex_lock(&ui->ui_mutex);
>>   	kfree(ui->data);
>>   	ui->data = kmemdup(value, size, GFP_NOFS);
>>   	if (!ui->data) {
>> +		mutex_unlock(&ui->ui_mutex);
>>   		err = -ENOMEM;
>>   		goto out_free;
>>   	}
>>   	inode->i_size = ui->ui_size = size;
>>   	ui->data_len = size;
>> +	mutex_unlock(&ui->ui_mutex);
>
>
> Just one note - should kmemdup() be called outside of the critical
> section, to make is shorter (memory allocation is a potentially slow
> operation)?
>
> Something like:
>
> buf = kmemdup()
> mutex_lock()
> kfree(ui->data)
> ui->data = buf
> mutex_unlock()

Good point, will update it.

Yang
>
> Artem.
>
