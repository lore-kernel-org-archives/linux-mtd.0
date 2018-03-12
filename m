Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1evRGb-0004Fb-Mn
 for linux-mtd@lists.infradead.org; Mon, 12 Mar 2018 17:29:49 +0000
Received: by mail-wr0-x242.google.com with SMTP id n12so5395669wra.2
 for <linux-mtd@lists.infradead.org>; Mon, 12 Mar 2018 10:29:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5AA6AA84.6040001@gmail.com>
References: <fa970be78de11dee1a217c9a75ab0850f1780e0c.1520591977.git.arvind.yadav.cs@gmail.com>
 <20180312.104323.14368638452528082.davem@davemloft.net>
 <5AA6AA84.6040001@gmail.com>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Mon, 12 Mar 2018 18:29:32 +0100
Message-ID: <CAFLxGvw1U2OZn4kU1O6uJ17yWYf1deE=+Cr56Foffdq7Q=5u3A@mail.gmail.com>
Subject: Re: [PATCH] net: hns: use put_device() if device_register fail
To: arvindY <arvind.yadav.cs@gmail.com>
Cc: David Miller <davem@davemloft.net>, yisen.zhuang@huawei.com,
 salil.mehta@huawei.com,
 linyunsheng@huawei.com, LKML <linux-kernel@vger.kernel.org>,
 netdev@vger.kernel.org, linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 12, 2018 at 5:27 PM, arvindY <arvind.yadav.cs@gmail.com> wrote:
>
>
> On Monday 12 March 2018 08:13 PM, David Miller wrote:
>>
>> From: Arvind Yadav <arvind.yadav.cs@gmail.com>
>> Date: Fri,  9 Mar 2018 16:11:17 +0530
>>
>>> if device_register() returned an error! Always use put_device()
>>> to give up the reference initialized.
>>>
>>> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
>>
>> I do not see anything giving cls_dev an initial non-zero reference
>> count before this device_register() call.
>
> Yes,  you are correct there is nothing to release (hnae_release).

Wait, this is not what DaveM said.
Since you sent also patches to MTD I care about this too.

Do we have to call put_device() in any case after a failure of
device_register() or not?
In this case the release function is empty, so nothing is going to released.
But technically a put_device() is needed and correct according to your
change log.

I have to admit I don't know all details of the driver core, maybe you
can help me.
device_register() calls device_initialize() followed by device_add().
device_initialize() does a kobject_init() which again sets the
reference counter to 1 via kref_init().
In the next step device_add() does a get_device() --> reference
counter goes up to 2.
But in the exit path of the function a put_device() is done, also in
case of an error.
So device_register() always returns with reference count 1.

If I understand this correctly a put_device() is mandatory.
Also in this driver.
Can you please enlighten me? :-)

-- 
Thanks,
//richard
