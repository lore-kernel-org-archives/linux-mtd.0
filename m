Received: from mail-pa0-x22e.google.com ([2607:f8b0:400e:c03::22e])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VYrhe-0004fD-Co
 for linux-mtd@lists.infradead.org; Wed, 23 Oct 2013 06:13:59 +0000
Received: by mail-pa0-f46.google.com with SMTP id rd3so173224pab.33
 for <linux-mtd@lists.infradead.org>; Tue, 22 Oct 2013 23:13:35 -0700 (PDT)
Message-ID: <5267690C.9080005@gmail.com>
Date: Tue, 22 Oct 2013 23:13:32 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: "Gupta, Pekon" <pekon@ti.com>
Subject: Re: [PATCH v10 04/10] mtd: nand: omap: fix device scan:
 NAND_CMD_READID, NAND_CMD_RESET, CMD_CMD_PARAM use only x8 bus
References: <1382172254-12448-1-git-send-email-pekon@ti.com>
 <1382172254-12448-5-git-send-email-pekon@ti.com>
 <20131022201624.GL23337@ld-irv-0074.broadcom.com>
 <20980858CB6D3A4BAE95CA194937D5E73EA29DB8@DBDE04.ent.ti.com>
In-Reply-To: <20980858CB6D3A4BAE95CA194937D5E73EA29DB8@DBDE04.ent.ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "arnd@arndb.de" <arnd@arndb.de>, "Pawel.Moll@arm.com" <Pawel.Moll@arm.com>,
 "ijc+devicetree@hellion.org.uk" <ijc+devicetree@hellion.org.uk>,
 "tony@atomide.com" <tony@atomide.com>,
 "jp.francois@cynove.com" <jp.francois@cynove.com>,
 "dedekind1@gmail.com" <dedekind1@gmail.com>,
 "avinashphilipk@gmail.com" <avinashphilipk@gmail.com>, "Balbi,
 Felipe" <balbi@ti.com>, "robherring2@gmail.com" <robherring2@gmail.com>,
 "bcousson@baylibre.com" <bcousson@baylibre.com>,
 "swarren@wwwdotorg.org" <swarren@wwwdotorg.org>,
 "olof@lixom.net" <olof@lixom.net>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "ivan.djelic@parrot.com" <ivan.djelic@parrot.com>,
 "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/22/2013 10:07 PM, Gupta, Pekon wrote:
>> From: Brian Norris [mailto:computersforpeace@gmail.com]
>> On Sat, Oct 19, 2013 at 02:14:08PM +0530, Pekon Gupta wrote:
> [...]
> 
>>>
>>> Thus this patch run nand_scan_ident() with driver configured as x8 device.
>>
>> So are you saying that the driver currently doesn't work if you started
>> in x16 buswidth? Are you having problems with a particular setup? What
>> sort of devices are you testing?
>>
> No, I'm saying that you cannot read ONFI params in x16 mode.
> And, that is what was pointed out in following commit log also ..
> (Reference to 3.3.2. Target Initialization: given above)
> So, if I run nand_scan_ident() in x16 mode, my ONFI detection would 
> fail for sure ..

But you cannot just run nand_scan_ident() with !(chip->options &
NAND_BUSWIDTH_16) when your devices is x16. You need to solve the ONFI
detection problem while correctly specifying NAND_BUSWIDTH_16.

Since you didn't answer the other 2 questions there: are you testing any
x16 devices?

>> Running nand_scan_ident() with x8 when the device is actualy x16 will
>> just cause nand_scan_ident() to abort with an error. It doesn't help you
>> with the fact that RESET/READID/PARAM need special 8-bit handling on x16
>> devices, so you're not solving the problem alluded to by Matthieu.
>>
> Yes, absolutely agree.. 
> The original code was calling nand_scan_ident() twice, without taking
> into consideration whether the first nand_scan_ident() failed because
> of bus-width mismatch or something else.
> 
> I'm also calling nand_scan_ident() twice, but only when the failure may
> be due to bus-width mis-match. I'm just avoiding an extra call to
> nand_scan_ident() if the failure was genuine.

You NEVER need to call nand_scan_ident() twice for the same chip.
Period. I will reject any patch that retains this pattern. It is wrong,
and I seriously doubt the code does what you think it does when you do this.

I think nand_scan_ident() may have a weak point where it won't support
ONFI properly for x16 devices. I believe NAND_BUSWIDTH_AUTO was added to
help with this fact. (I don't have any x16 devices to test it.) But if
this is a problem for you, fix it. Don't work around it.

>> What is your patch trying to solve? It seems like it's just a distortion
>> of the same code that existed previously. It tries running
>> nand_scan_ident() in one buswidth configuration, and then it tries the
>> other if it failed. You still aren't doing either of the options we
>> talked about previously. I'll repeat them:
>>
> Absolutely.. probably you missed my replies in [PATCH v9 4/9]...

No, I did not. I just don't see how you think that your code matches the
options (1) or (2) that I described. Perhaps it's a failure in
communication. I will try to be absolutely clear.

>> (1) You specify the buswidth given by device-tree/platform-data; if this
>>     is incorrect, you fail
>>
> Absolutely this is what I'm doing.

No it isn't. You are ignoring the provided buswidth information and
UNCONDITIONALLY trying x8. If/when that fails, you then error out or
retry in x16 (depending on the DT/platform-data).

This is plain wrong.

nand_base is designed (and it's documented in the comments) that the
driver must set the buswidth correctly BEFORE calling nand_scan_ident().
You may not use nand_scan_ident() as a trial-and-error identification
function.

So, to properly do (1), you should only have something like this, just
like all the other NAND drivers:

  nand_chip->options = pdata->devsize & NAND_BUSWIDTH_16;

  ret = nand_scan_ident(...);
  if (ret) {
      // exit with error code...
  }

If there is a problem with this, then you have to fix your driver or
nand_scan_ident(). Perhaps you have to adjust your readbuf() or
cmdfunc() callbacks to do this. But do not add complicated workaround
logic in your driver.

> But tell me how would you know the actual device-width if
> nand_scan_ident()  fails 

If you are not using NAND_BUSWIDTH_AUTO, then you MUST know the correct
buswidth before calling nand_scan_ident(). If your
device-tree/platform-data is wrong, then fix that.

> (a) to probe ONFI params and 
> - your device is  not in nand_ids[]
> So get the actual device width, I call the first nand_scan_ident() in x8 mode.
> so that ONFI params are read.

You don't call nand_scan_ident() with !(chip->options &
NAND_BUSWIDTH_16) when you have an x16 device.

Now, if this causes NAND_CMD_PARAM to fail, then you have a *different*
problem to solve. But you are not solving this problem.

[snipping the rest]

I read your patch, and I gave you my review. I will not accept this
patch, nor any patch that works around nand_scan_ident() by calling it
twice. Fix the framework if the framework is giving you problems.

I believe that this patch is not integral to the rest of the series, so
I will repeat: separate this patch out so I can take the rest of this
series without it.

Brian
