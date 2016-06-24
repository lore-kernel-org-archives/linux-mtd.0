Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bGTgH-0004uG-Rn
 for linux-mtd@lists.infradead.org; Fri, 24 Jun 2016 16:10:11 +0000
Date: Fri, 24 Jun 2016 18:09:58 +0200
From: Anatolij Gustschin <agust@denx.de>
To: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: Is UBI volume update broken?
Message-ID: <20160624180958.202fff24@crub>
In-Reply-To: <CAAEAJfAsqm3YJ+mKPyuqe6nZoXJ5LuV7Cv+1yNv9+JVXeJN9tQ@mail.gmail.com>
References: <20160624153307.13d1c850@crub>
 <CAAEAJfAsqm3YJ+mKPyuqe6nZoXJ5LuV7Cv+1yNv9+JVXeJN9tQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Ezequiel,

On Fri, 24 Jun 2016 12:36:05 -0300
Ezequiel Garcia ezequiel@vanguardiasur.com.ar wrote:

>Anatolij.
>
>On 24 June 2016 at 10:33, Anatolij Gustschin <agust@denx.de> wrote:
>[..]
>>
>> # ubiupdatevol /dev/ubi0_0 data.ubi
>> # echo $?
>> 0
>>
>
>It seems you are you writing a UBI *volume*, with an image
>prepared for a UBI *device*.

yes, now I see it. Thanks for the pointer.

[...]
>If you wrote down your exact steps, then it's clear this
>is wrong:
>
>ubiformat /dev/mtd4 -f data.ubi
>ubiupdatevol /dev/ubi0_0 data.ubi

I extracted the commands from some old script and this script was
obviously wrong.

>You probably want "ubiupdatevol /dev/ubi0_0 data.img".

Exactly! And that works as expected.

Thanks,

Anatolij
