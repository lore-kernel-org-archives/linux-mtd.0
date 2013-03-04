Received: from mail-ve0-f181.google.com ([209.85.128.181])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCbTL-0004wK-Vf
 for linux-mtd@lists.infradead.org; Mon, 04 Mar 2013 19:54:56 +0000
Received: by mail-ve0-f181.google.com with SMTP id d10so5006952vea.40
 for <linux-mtd@lists.infradead.org>; Mon, 04 Mar 2013 11:54:54 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1362425367.155383507@f92.mail.ru>
References: <1362415349-7107-1-git-send-email-dedekind1@gmail.com>
 <1362415349-7107-7-git-send-email-dedekind1@gmail.com>
 <1362425367.155383507@f92.mail.ru>
Date: Mon, 4 Mar 2013 11:54:54 -0800
Message-ID: <CAN8TOE9yNs5orCz39P_oEuMj_8_TABM6WSKUn3jkGVFsO1hauQ@mail.gmail.com>
Subject: Re: Re[2]: [PATCH 06/12] mtd: nand: remove a bunch of unused commands
From: Brian Norris <computersforpeace@gmail.com>
To: Alexander Shiyan <shc_work@mail.ru>
Content-Type: text/plain; charset=ISO-8859-1
Cc: Huang Shijie <b32955@freescale.com>, Mike Dunn <mikedunn@newsguy.com>,
 MTD Maling List <linux-mtd@lists.infradead.org>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Mar 4, 2013 at 11:29 AM, Alexander Shiyan <shc_work@mail.ru> wrote:
>> On Mon, Mar 4, 2013 at 8:42 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
>> > From: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>> >
>> > Signed-off-by: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>> > ---
>> >  drivers/mtd/nand/cafe_nand.c   |    6 ------
>> >  drivers/mtd/nand/nand_base.c   |   10 ----------
>> >  drivers/mtd/nand/nandsim.c     |    8 --------
>> >  drivers/mtd/nand/nuc900_nand.c |    9 ---------
>> >  include/linux/mtd/nand.h       |   20 --------------------
>> >  5 files changed, 53 deletions(-)
>> >
>>
>> ... trimmed ...
> ...
>> > - * Note: the command for NAND_CMD_DEPLETE1 is really 0x00 but
>> > - *       there is no way to distinguish that from NAND_CMD_READ0
>> > - *       until the remaining sequence of commands has been completed
>> > - *       so add a high order bit and mask it off in the command.
>> > - */
>> > -#define NAND_CMD_DEPLETE1      0x100
>>
>> Perhaps this is the reason for the "unnecessary command masking" noted
>> by Alexander? There is one instance of a command function which masks
>> command & 0xff. Maybe Alexander's patch can be updated to mention this
>> likely cause for the original masking and can be applied on top of
>> Artem's cleanup series? Anyway, the mask was likely not used anyway,
>> since (as Artem mentions in this patch series) AG-AND had very little
>> general use (or none?).
>
> My patch is cleanup only. I think that the mask was originally included to
> limit the byte boundaries. However, this is not necessary because callback
> functions "cmd_ctrl" use writeb/iowrite8 for send command, ie do not allow
> the use of the wrong size. Address also passed to "cmd_ctrl" via "cmd"
> parameter, which is not masked but only shifted, i.e. we have a values
> above 0xff, so that is not a problem.

To be clear, I'm referring to your patch:

  [PATCH 1/3] mtd: nand_base: Removed unnecessary command masking

The function that you are editing (nand_command_lp) can be used for
AG-AND devices. The driver (rtc_from4.c - slated for removal in this
series) can send NAND_CMD_DEPLETE1, which according to the comments in
nand.h that I highlight above, should be "mask[ed] ... off in the
command". So without Artem's change, your patch is actually breaking
rtc_from4.c. Unforunately, no one bothered to actually document this
within nand_command_lp, but such is life.

Brian
