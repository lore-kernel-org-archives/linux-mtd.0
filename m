Received: from arroyo.ext.ti.com ([192.94.94.40])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VbPYu-00010C-EF
 for linux-mtd@lists.infradead.org; Wed, 30 Oct 2013 06:47:29 +0000
Message-ID: <5270AB5F.8060800@ti.com>
Date: Wed, 30 Oct 2013 12:16:55 +0530
From: Sourav Poddar <sourav.poddar@ti.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>
Subject: Re: [PATCH] drivers: mtd: m25p80: Add quad read support.
References: <1382693145-15750-1-git-send-email-sourav.poddar@ti.com>
 <201310291627.34003.marex@denx.de> <526FE7B9.3000602@ti.com>
 <201310291808.58939.marex@denx.de> <526FEC7D.6060403@ti.com>
 <526FFFA0.8040800@ti.com> <5270A6EF.2020208@freescale.com>
In-Reply-To: <5270A6EF.2020208@freescale.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Marek Vasut <marex@denx.de>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org, balbi@ti.com, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang,
On Wednesday 30 October 2013 11:57 AM, Huang Shijie wrote:
> 于 2013年10月30日 02:34, Sourav Poddar 写道:
>> I think it will be better to take the above recommended cleanup as a 
>> seperate patch
>> on top of $subject patch? Since, read_sr is not only used by the 
>> pieces added in this patch.
>> There are other already available apis in the driver which make use 
>> of this function. 
> yes, I also think use a seperate patch to fix the read_sr() (If you 
> want to change it.)
>
> Btw, please add the version info, such "PATCH V3", in the title of 
> your new patch.
>
So done, I will try to clean up Marek's suggestion as a seperate patch 
once the $subject patch
is done and dusted.

There was a small comment by Marek on chaning the error print info, If 
there are no
further comments on $subject patch, I will go ahead and fix that small 
comments and resend
the series.
I did prefer to name it as V2 to have consistency with this thread. ?
> thanks
> Huang Shijie
>
