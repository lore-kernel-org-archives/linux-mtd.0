Received: from mail-vc0-f177.google.com ([209.85.220.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1T2cPK-0008PB-77
 for linux-mtd@lists.infradead.org; Sat, 18 Aug 2012 06:21:14 +0000
Received: by vcbfl13 with SMTP id fl13so3799835vcb.36
 for <linux-mtd@lists.infradead.org>; Fri, 17 Aug 2012 23:21:12 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1345207610.27859.71.camel@sauron.fi.intel.com>
References: <1342434747-27622-1-git-send-email-sachin.kamat@linaro.org>
 <1345207610.27859.71.camel@sauron.fi.intel.com>
Date: Sat, 18 Aug 2012 11:51:12 +0530
Message-ID: <CAK9yfHx_m0yNQmNWuFjtzhfwzstGf4Qb_+eUsx558JzaGa-SFw@mail.gmail.com>
Subject: Re: [PATCH 1/6] mtd: s3c2410: Use module_platform_driver()
From: Sachin Kamat <sachin.kamat@linaro.org>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 David.Woodhouse@intel.com, ben-linux@fluff.org, patches@linaro.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Artem,

Thank you for your interest in testing these patches.

On 17 August 2012 18:16, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Mon, 2012-07-16 at 16:02 +0530, Sachin Kamat wrote:
>> This makes the code simpler by eliminating module_init() and
>> module_exit().
>>
>> Signed-off-by: Sachin Kamat <sachin.kamat@linaro.org>
>
> Could you please send me a defconfig which I can use to compile-test
> this?

This patch along with other 5 patches in this series can be tested
using the s3c6400_defconfig (it is available in the mainline).
Please let me know how it works for you.

>
> --
> Best Regards,
> Artem Bityutskiy



-- 
With warm regards,
Sachin
