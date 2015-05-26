Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YxAva-00060z-Uo
 for linux-mtd@lists.infradead.org; Tue, 26 May 2015 09:13:40 +0000
Message-ID: <55643922.5060203@nod.at>
Date: Tue, 26 May 2015 11:13:06 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Sheng Yong <shengyong1@huawei.com>
Subject: Re: [RFC PATCH 4/4] UBI: Fastmap: Do not add vol if it already exists
References: <1432202165-22351-1-git-send-email-shengyong1@huawei.com>
 <1432202165-22351-5-git-send-email-shengyong1@huawei.com>
 <555DB062.5070701@nod.at> <555E3DDA.1090405@nod.at>
 <55643471.7090307@huawei.com>
In-Reply-To: <55643471.7090307@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 26.05.2015 um 10:53 schrieb Sheng Yong:
> Hi, Richard
> 
> On 5/22/2015 4:19 AM, Richard Weinberger wrote:
>> Am 21.05.2015 um 12:16 schrieb Richard Weinberger:
>>> Am 21.05.2015 um 11:56 schrieb Sheng Yong:
>>>> When writing fastmap, there is no guarantee that two same vol ID are
>>>> written to flash by mistake. Although this unlikely happens, we still
>>>> should check it when attaching.
>>>
>>> Not sure if I understand the error scenario.
>>> How can this happen?
> I didn't hit the case, this was just found by codewalking. After I read
> more code and though about more unclean reboot and ECC scenario, I agree
> with you that there is no way to have two same vol_id saved in different
> slots in ubi->volumes[], unless modify it by hand :( .  Thank you for
> pointing it out.

Okay. :)
Please resend your patch with a proper changelog where you explain
that this issue can only be triggered by manually editing the on-flash
data.

Thanks,
//richard
