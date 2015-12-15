Received: from mail-out.m-online.net ([2001:a60:0:28:0:1:25:1])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a8jSe-0001jX-5B
 for linux-mtd@lists.infradead.org; Tue, 15 Dec 2015 06:51:49 +0000
Subject: Re: [PATCH for-4.4] mtd: fix cmdlinepart parser, early naming for
 auto-filled MTD
To: Brian Norris <computersforpeace@gmail.com>
References: <1449878281-94986-1-git-send-email-computersforpeace@gmail.com>
 <566BA661.9000407@denx.de> <20151212053918.GA19361@brian-ubuntu>
 <20151214192402.GA124396@google.com>
Cc: linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 Boris Brezillon <boris.brezillon@free-electrons.com>,
 Frans Klaver <fransklaver@gmail.com>
Reply-To: hs@denx.de
From: Heiko Schocher <hs@denx.de>
Message-ID: <566FB860.4080900@denx.de>
Date: Tue, 15 Dec 2015 07:51:12 +0100
MIME-Version: 1.0
In-Reply-To: <20151214192402.GA124396@google.com>
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

Hello Brian,

Am 14.12.2015 um 20:24 schrieb Brian Norris:
> On Fri, Dec 11, 2015 at 09:39:18PM -0800, Brian Norris wrote:
>> On Sat, Dec 12, 2015 at 05:45:21AM +0100, Heiko Schocher wrote:
>>> Am 12.12.2015 um 00:58 schrieb Brian Norris:
>>>> Commit 807f16d4db95 ("mtd: core: set some defaults when dev.parent is
>>>> set") attempted to provide some default settings for MTDs that
>>>>   (a) assign the parent device and
>>>>   (b) don't provide their own name or owner
>>>>
>>>> However, this isn't a perfect drop-in replacement for the boilerplate
>>>> found in some drivers, because the MTD name is used by partition
>>>> parsers like cmdlinepart, but the name isn't set until add_mtd_device(),
>>>> after the parsing is completed. This means cmdlinepart sees a NULL name
>>>> and therefore will not work properly.
>>>>
>>>> Fix this by moving the default name and owner assignment to be first in
>>>> the MTD registration process.
>>>>
>>>> Fixes: 807f16d4db95 ("mtd: core: set some defaults when dev.parent is set")
>>>> Reported-by: Heiko Schocher <hs@denx.de>
>>>> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>>>> Cc: Heiko Schocher <hs@denx.de>
>>>> Cc: Frans Klaver <fransklaver@gmail.com>
>>>> ---
>>>> Heiko, can you provide testing feedback (e.g., 'Tested-by: ...')?
>>>
>>> Sorry, does not work for me:
>>>
>>> Based on:
>>> pollux:linux hs [20151212] $ git describe master
>>> v4.4-rc4-135-gb9d8545
>>>
>>> and this patch, shows the same problem,
>>
>> [...]
>
> BTW, can you please include the relevant log snippets when replying in
> the future?

Uh, Sorry for that, yes of course ...

>> Ugh, I see the problem. In nand_base.c, nand_get_flash_type():
>>
>> 	if (!mtd->name)
>> 		mtd->name = type->name;
>
> Specifically, I think we could hack around this with something like the
> following additional patch. Untested:
>
> diff --git a/drivers/mtd/nand/nand_base.c b/drivers/mtd/nand/nand_base.c
> index ece544efccc3..9f169566fba4 100644
> --- a/drivers/mtd/nand/nand_base.c
> +++ b/drivers/mtd/nand/nand_base.c
> @@ -3826,6 +3826,9 @@ static struct nand_flash_dev *nand_get_flash_type(struct mtd_info *mtd,
>   	if (!type)
>   		type = nand_flash_ids;
>
> +	if (!mtd->name && mtd->dev.parent)
> +		mtd->name = dev_name(mtd->dev.parent);
> +
>   	for (; type->name != NULL; type++) {
>   		if (is_full_id_nand(type)) {
>   			if (find_full_id_nand(mtd, chip, type, id_data, &busw))
>

Sorry, I had not yet the time to look into the issue deeper, Thanks for
digging into it. I tried therefore your patch (automated with tbot see
below [1]) on linux "v4.4-rc5" and

your patch works!

bye,
Heiko

[1] automated test with tbot [2]
http://xeidos.ddns.net/buildbot/builders/mcx/builds/7/steps/shell/logs/tbotlog

as there is a lot of things done automatically, search for
"Micron MT29F4G16ABADAWP"

All you see in the log is done automatically with tbot. The mcx board
is in munich, while I am doing the test from hungary. In my testsetup
tbot is integrated into buildbot, which is used for the webserver
and triggering builds.

What is done:
- get linux code (if it is not already checked out)
- apply patches
   (I have also a testcase, which download all patches from patchwork,
    which are delegated to me (for u-boot), check them with checkpatch
    and apply it ... very helpful, if this is done in a nightly build,
    you have only to look in the morning, if all is green, and you know
    that all patches are checkpatch clean, apply celan, compile clean
    and do not break the boards you have in your nightly build ... also
    there is a testcase which starts a git bisect test [3] ...)

    As I did not mainlined the board yet, there are a bunch of checkpatch
    errors, so I disabled that the testcase fails, if there are errors.

- compile linux
- copy files to tftpdir
- boot them
- execute testcases
   for example check in dmesg some strings with:
   https://github.com/hsdenx/tbot/blob/master/src/tc/tc_lx_dmesg_grep.py

   So detected our current bug ;-)

   check register settings with devmem2:
   https://github.com/hsdenx/tbot/blob/master/src/tc/tc_lx_check_reg_file.py

   Thats very nice, as you can check for example complete pinmux register.
   see as an example [4]

last but not least, tbot (and buildbot incl. webserver) is running on a
raspberry pi at my home! So no expensive hw costs.

[2] https://github.com/hsdenx/tbot
[3] git bisect automated:
     https://github.com/hsdenx/tbot/blob/master/src/tc/tc_board_git_bisect.py
     log as an example for U-Boot:
     http://xeidos.ddns.net/buildbot/builders/tqm5200s/builds/3/steps/shell/logs/tbotlog
[4] register file
     https://github.com/hsdenx/tbot/blob/master/src/files/ccu1_pinmux_scm.reg

-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
