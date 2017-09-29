Received: from conssluserg-02.nifty.com ([210.131.2.81])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dxwNU-0008PJ-2o
 for linux-mtd@lists.infradead.org; Fri, 29 Sep 2017 14:34:57 +0000
Received: from mail-yw0-f179.google.com (mail-yw0-f179.google.com
 [209.85.161.179]) (authenticated)
 by conssluserg-02.nifty.com with ESMTP id v8TEY9Dc002335
 for <linux-mtd@lists.infradead.org>; Fri, 29 Sep 2017 23:34:09 +0900
Received: by mail-yw0-f179.google.com with SMTP id u205so980132ywa.5
 for <linux-mtd@lists.infradead.org>; Fri, 29 Sep 2017 07:34:09 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170929142635.07d55f77@bbrezillon>
References: <1506681520-13897-1-git-send-email-yamada.masahiro@socionext.com>
 <20170929142635.07d55f77@bbrezillon>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 29 Sep 2017 23:33:28 +0900
Message-ID: <CAK7LNASiker+1_uHXyhdkSJVMCX-TwXLhxD_ibQFLXWR9u0p6w@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] mtd: nand: wait for tWHR, and fix the
 setup_data_interface of Denali
To: Boris Brezillon <boris.brezillon@free-electrons.com>
Cc: linux-mtd@lists.infradead.org,
 Cyrille Pitchen <cyrille.pitchen@wedev4u.fr>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Marek Vasut <marek.vasut@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 Richard Weinberger <richard@nod.at>, David Woodhouse <dwmw2@infradead.org>,
 Marc Gonzalez <marc_gonzalez@sigmadesigns.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

(+CC Marc Gonzalez)

2017-09-29 21:26 GMT+09:00 Boris Brezillon <boris.brezillon@free-electrons.com>:
> On Fri, 29 Sep 2017 19:38:38 +0900
> Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
>
>> 1/2 : add NAND_WAIT_TWHR and nand_whr_delay().
>>       You can set this new flag if you want nand_command(_lp)
>>       to insert tWHR delay where needed.
>>
>> 2/2 : Fix Denali setup_data_interface.
>>       Boris' suggestion in v1 was a good reminder that
>>       made me realize tCCS was missing in the driver.  Fix it now.
>>
>>
>> Changes in v2:
>>   - Add nand_whr_delay() helper
>>     Wait for tWHR only for drivers that explicitly set NAND_WAIT_TWHR flag
>>   - newly added
>>
>> Masahiro Yamada (2):
>>   mtd: nand: wait for tWHR after NAND_CMD_STATUS / NAND_CMD_READID
>
> Hm, I thought you were introducing this to then use it in the denali
> driver. Sorry, but I don't want to apply something that nobody needs.
> If someone ever complains about a missing delay I'll point him to your
> patch, but until then I'll keep the core unchanged.

Perhaps, Marc Gonzalez is the person.


tango_nand.c is the only driver that sets NAND_WAIT_TCCS.

Now, there is completely no delay when reading out the ID.


One safe change might be apply this patch,
then set NAND_WAIT_TWHR to tango_nand.c


I am guessing NAND_WAIT_TCCS was added for it.
Theoretically, I do not see logical difference between tCCS and tWHR.

I am CCing Marc Gonzalez, the author of tango_nand.c




commit 6ea40a3ba93e1b14ffb349e276f9dfefc4334b99
Author: Boris Brezillon <boris.brezillon@free-electrons.com>
Date:   Sat Oct 1 10:24:03 2016 +0200

    mtd: nand: Wait tCCS after a column change

    Drivers implementing ->cmd_ctrl() and relying on the default ->cmdfunc()
    implementation usually don't wait tCCS when a column change (RNDIN or
    RNDOUT) is requested.
    Add an option flag to ask the core to do so (note that we keep this as
    an opt-in to avoid breaking existing implementations), and make use of
    the ->data_interface information is available (otherwise, wait 500ns).

    Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>
    Tested-by: Marc Gonzalez <marc_gonzalez@sigmadesigns.com>


-- 
Best Regards
Masahiro Yamada
