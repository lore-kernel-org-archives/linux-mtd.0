Received: from mail-oa0-f49.google.com ([209.85.219.49])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VRcw2-0001sD-DR
 for linux-mtd@lists.infradead.org; Thu, 03 Oct 2013 07:02:54 +0000
Received: by mail-oa0-f49.google.com with SMTP id i4so1918730oah.36
 for <linux-mtd@lists.infradead.org>; Thu, 03 Oct 2013 00:02:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20131002202031.GU23337@ld-irv-0074.broadcom.com>
References: <1376300447-7126-1-git-send-email-sachin.kamat@linaro.org>
 <20131002202031.GU23337@ld-irv-0074.broadcom.com>
Date: Thu, 3 Oct 2013 12:32:31 +0530
Message-ID: <CAK9yfHwgPE5tOZV53gLk-QKJbKSnuBLKWWMuSzspQXAT9qq_PQ@mail.gmail.com>
Subject: Re: [PATCH 1/1] mtd: diskonchip: Fix incorrect placement of __initdata
From: Sachin Kamat <sachin.kamat@linaro.org>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: artem.bityutskiy@linux.intel.com, linux-mtd@lists.infradead.org,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 3 October 2013 01:50, Brian Norris <computersforpeace@gmail.com> wrote:
> On Mon, Aug 12, 2013 at 03:10:47PM +0530, Sachin Kamat wrote:
>> -static unsigned long __initdata doc_locations[] = {
>> +static unsigned long doc_locations[] __initdata = {
>>  #if defined (__alpha__) || defined(__i386__) || defined(__x86_64__)
>>  #ifdef CONFIG_MTD_NAND_DISKONCHIP_PROBE_HIGH
>>       0xfffc8000, 0xfffca000, 0xfffcc000, 0xfffce000,
>

> Pushed to l2-mtd.git.

Thanks.

> If you're really interested in seeing this
> changed, there are a few other similar places in drivers/mtd/. Feel free
> to send a patch.
>

Sure. I will take a look at remaining instances and send the necessary patches.
Thanks.

-- 
With warm regards,
Sachin
