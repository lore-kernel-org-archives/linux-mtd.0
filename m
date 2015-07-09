Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZD960-0001ZH-NX
 for linux-mtd@lists.infradead.org; Thu, 09 Jul 2015 10:30:25 +0000
Message-ID: <559E4D26.5080203@nod.at>
Date: Thu, 09 Jul 2015 12:29:58 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: "Egli, Samuel" <samuel.egli@siemens.com>
CC: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
Subject: Re: autoresize causes insufficient reservation of PEBs for bad PEB
 handling
References: <27E9275BC1C8554E840881B19B62BE421A8FD9@DENBGAT9EI1MSX.ww902.siemens.net>
 <CAFLxGvz4=hjkawWa4SWD6P588J7RUOX4=X+pdU8Rd0WrynOOBQ@mail.gmail.com>
 <27E9275BC1C8554E840881B19B62BE421A927A@DENBGAT9EI1MSX.ww902.siemens.net>
 <559C401E.4000601@nod.at>
 <27E9275BC1C8554E840881B19B62BE421A9ADD@DENBGAT9EI1MSX.ww902.siemens.net>
In-Reply-To: <27E9275BC1C8554E840881B19B62BE421A9ADD@DENBGAT9EI1MSX.ww902.siemens.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 09.07.2015 um 12:23 schrieb Egli, Samuel:
> Hi Richard
> 
>>
>> There are more odds.
>>
>> I don't see a message like "[   90.757282] ubi0: volume 2
>> ("configuration") re-sized from 80 to 7948 LEBs"
>> in that log. So, re-size did not happen.
>>
>> Is this a pristine kernel or does it contain some vendor "tweaks"?
> 
> The issue didn't lie in linux kernel. We have in our ubi volume
> the uImage. So U-Boot needs to mount it and actually does
> the resize. In U-Boot version 2014.04 there is still a 
> older ubi driver that doesn't perform the resizing correctly.

Bah. ;-\

> With U-Boot v2015.04, however, the issue is resolved.

Thanks for letting me know.

> Thanks, for looking into this.

You're welcome!

Thanks,
//richard
