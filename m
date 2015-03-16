Received: from mail-ig0-x231.google.com ([2607:f8b0:4001:c05::231])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXeKa-0007pT-Px
 for linux-mtd@lists.infradead.org; Mon, 16 Mar 2015 23:21:57 +0000
Received: by igbue6 with SMTP id ue6so57733087igb.1
 for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2015 16:21:35 -0700 (PDT)
In-Reply-To: <55076362.7040705@vanguardiasur.com.ar>
References: <1426539315-17392-1-git-send-email-dehrenberg@chromium.org>
 <55076362.7040705@vanguardiasur.com.ar>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain;
 charset=UTF-8
Subject: Re: [PATCH] UBI: block: Add option for dynamic minor number
From: Nicholas Krause <xerofoify@gmail.com>
Date: Mon, 16 Mar 2015 19:21:28 -0400
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Dan Ehrenberg <dehrenberg@chromium.org>, computersforpeace@gmail.com,
 linux-mtd@lists.infradead.org
Message-ID: <7CF353E4-64F1-4340-90B6-4BE8A11349AA@gmail.com>
Cc: Richard Weinberger <richard@nod.at>, gwendal@chromium.org,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 dynamic in nature. 
Nick 

On March 16, 2015 7:12:34 PM EDT, Ezequiel Garcia <ezequiel@vanguardiasur.com.ar> wrote:
>(Adding UBI maintainers)
>
>On 03/16/2015 05:55 PM, Dan Ehrenberg wrote:
>> This patch adds a new config option, MTD_UBI_BLOCK_DYNAMIC_MINOR,
>which
>> makes minor numbers dynamically allocated for ubiblock devices,
>starting
>> at 0.
>> 
>> From the new Kconfig:
>>     This option makes ubiblock devices have minor numbers beginning
>from
>>     0, allocated dynamically independently of the ubi device/volume
>>     number. For users who don't refer to an ubiblock device directly
>by
>>     the major:minor number (e.g., with udev and/or devtmpfs), this
>option
>>     is useful if the device number is rather high (>1) and when
>executing
>>     on a 32-bit platform without LFS enabled in all userspace
>binaries.
>> 
>
>Hm, I'm wondering if there are any users relying on a specific minor.
>
>I'm not fond of the new option, and I'm not fond of the ifdefs you
>bring
>in. Can't we just change minors to be dynamic?
Richard, 
I have to agree and was going to point out the ugliness of adding these macros. Furthermore I second the vote for just making minor device numbers given to 
Uni fs

-- 
Sent from my Android device with K-9 Mail. Please excuse my brevity.
