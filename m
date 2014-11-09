Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XnPbp-0003e1-9j
 for linux-mtd@lists.infradead.org; Sun, 09 Nov 2014 10:20:38 +0000
Message-ID: <545F3FD8.6010001@nod.at>
Date: Sun, 09 Nov 2014 11:20:08 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Scott Branden <sbranden@broadcom.com>
Subject: Re: suspect UBIFS async operations causing issues during reboot
References: <5459E090.1010300@broadcom.com>
 <CAFLxGvwTLd_uWBrj9RsD6FPFCSGsC_VcOmi_j0VLgVCJ=YVQ9w@mail.gmail.com>
 <545A64CF.20101@broadcom.com> <545A6AA0.8050901@nod.at>
 <545AAA2B.8090007@broadcom.com> <545BEEA5.7020609@broadcom.com>
 <545C8697.3080403@nod.at> <545D01F4.9050005@broadcom.com>
In-Reply-To: <545D01F4.9050005@broadcom.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 07.11.2014 um 18:31 schrieb Scott Branden:
> On 14-11-07 12:45 AM, Richard Weinberger wrote:
>> Am 06.11.2014 um 22:56 schrieb Scott Branden:
>>> It looks like the erase happening in the middle of reboot was uncovered in 2009 and never addressed properly?
>>>
>>> https://lkml.org/lkml/2009/6/9/16
>>> https://lkml.org/lkml/2010/2/12/144
>>>
>>> Was there a proper resolution to this issue?
>>
>> Did you read the threads you've posted?
>>
>> There two answers:
>> https://lkml.org/lkml/2010/2/12/143
> Yes, there is no hardware solution to a reset happening in the middle of an erase operation to NAND.

Well, I agree with David that anything we do in software will only hide the real problem
or trim down the window.

Thanks,
//richard
