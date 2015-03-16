Received: from mail-qg0-x234.google.com ([2607:f8b0:400d:c04::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXesF-0001E8-4D
 for linux-mtd@lists.infradead.org; Mon, 16 Mar 2015 23:56:43 +0000
Received: by qgfa8 with SMTP id a8so55477363qgf.0
 for <linux-mtd@lists.infradead.org>; Mon, 16 Mar 2015 16:56:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <55076362.7040705@vanguardiasur.com.ar>
References: <1426539315-17392-1-git-send-email-dehrenberg@chromium.org>
 <55076362.7040705@vanguardiasur.com.ar>
Date: Mon, 16 Mar 2015 16:56:20 -0700
Message-ID: <CAAK6Zt10FRx38OdSqRZV8xJnOByS3d-BzBCw5z2tyD_Ub=-KmQ@mail.gmail.com>
Subject: Re: [PATCH] UBI: block: Add option for dynamic minor number
From: Daniel Ehrenberg <dehrenberg@google.com>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset=UTF-8
Cc: Richard Weinberger <richard@nod.at>, Gwendal Grignou <gwendal@chromium.org>,
 Brian Norris <computersforpeace@gmail.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

I'd be happy to go that way. Given that the major is dynamic, it'd be
a little surprising for someone to depend on a specific minor (yet).

Dan

On Mon, Mar 16, 2015 at 4:12 PM, Ezequiel Garcia
<ezequiel@vanguardiasur.com.ar> wrote:
> (Adding UBI maintainers)
>
> On 03/16/2015 05:55 PM, Dan Ehrenberg wrote:
>> This patch adds a new config option, MTD_UBI_BLOCK_DYNAMIC_MINOR, which
>> makes minor numbers dynamically allocated for ubiblock devices, starting
>> at 0.
>>
>> From the new Kconfig:
>>     This option makes ubiblock devices have minor numbers beginning from
>>     0, allocated dynamically independently of the ubi device/volume
>>     number. For users who don't refer to an ubiblock device directly by
>>     the major:minor number (e.g., with udev and/or devtmpfs), this option
>>     is useful if the device number is rather high (>1) and when executing
>>     on a 32-bit platform without LFS enabled in all userspace binaries.
>>
>
> Hm, I'm wondering if there are any users relying on a specific minor.
>
> I'm not fond of the new option, and I'm not fond of the ifdefs you bring
> in. Can't we just change minors to be dynamic?
> --
> Ezequiel Garcia, VanguardiaSur
> www.vanguardiasur.com.ar
