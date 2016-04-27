Received: from mail-qk0-x232.google.com ([2607:f8b0:400d:c09::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1avNt7-0002Mh-9x
 for linux-mtd@lists.infradead.org; Wed, 27 Apr 2016 11:44:14 +0000
Received: by mail-qk0-x232.google.com with SMTP id r184so17077064qkc.1
 for <linux-mtd@lists.infradead.org>; Wed, 27 Apr 2016 04:43:52 -0700 (PDT)
Subject: Re: MTK Smart Device Gen1 NAND Driver - Testing on MT7623
To: John Crispin <blogic@openwrt.org>,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 xiaolei li <xiaolei.li@mediatek.com>
References: <e397161c-2fe8-7e9d-c34f-adf5e91a99d7@openwrt.org>
 <20160427100627.63b148c3@bbrezillon>
 <869e6090-04fd-0f99-f248-af68e948362e@openwrt.org>
Cc: linux-mtd@lists.infradead.org, linux-mediatek@lists.infradead.org,
 erin.lo@mediatek.com, =?UTF-8?B?U3RldmVuIExpdSAo5YqJ5Lq66LGqKQ==?=
 <steven.liu@mediatek.com>, =?UTF-8?B?U2VhbiBXYW5nICjnjovlv5fkupgp?=
 <sean.wang@mediatek.com>
From: Jorge Ramirez <jorge.ramirez-ortiz@linaro.org>
Message-ID: <5720A5F5.8060602@linaro.org>
Date: Wed, 27 Apr 2016 07:43:49 -0400
MIME-Version: 1.0
In-Reply-To: <869e6090-04fd-0f99-f248-af68e948362e@openwrt.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>



On 04/27/2016 04:41 AM, John Crispin wrote:
> thanks for the info. i tried that aswell as some other settings but none
> makes the flash work. lets see if Jorge has some ideas. otherwise i will
> wait for V4.

we are about to post v4 (need another day or two); we have major 
differences as to how the bad blocks are being marked and some other 
optimizations. if you don't mind upgrading to that version then we can 
help you debug on your side.

btw, does any of the mtd tests pass? oobtest, pagetest..?

I am also adding Xiaolei to the thread (we have been working together on 
this driver)
