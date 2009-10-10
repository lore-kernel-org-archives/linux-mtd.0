Date: Sat, 10 Oct 2009 17:19:46 +0100 (BST)
From: David Woodhouse <dwmw2@infradead.org>
To: Mike Frysinger <vapier.adi@gmail.com>
Subject: Re: broken dependency of drivers/mtd/maps/gpio-addr-flash.o
In-Reply-To: <8bd0f97a0910100842o43956200w6bc644346d7c3eb9@mail.gmail.com>
Message-ID: <alpine.LFD.2.00.0910101718530.3182@mercury.infradead.org>
References: <a5d587fb0910100756i1ed21291u2aea66ba06247844@mail.gmail.com>
	<8bd0f97a0910100842o43956200w6bc644346d7c3eb9@mail.gmail.com>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed
Cc: linux-mtd@lists.infradead.org, Michal Suchanek <hramrach@centrum.cz>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sat, 10 Oct 2009, Mike Frysinger wrote:

> On Sat, Oct 10, 2009 at 10:56, Michal Suchanek wrote:
>> It tried building the 2.6.32-rc3 kernel for i386.
>>
>> This file fails to compile if gpiolib is not configured but it is
>> possible to select compilation of that file without selecting gpiolib.
>>
>> I guess I do not need this file because I do not have gpio and it
>> really depends on it but drivers in the MTD section seemed to be
>> mostly enabled in distribution config and this was a new driver since
>> 2.6.30.
>
> patches have already been posted for the issue

Have they? I thought the x86 gpio implementation was still broken?

-- 
dwmw2
