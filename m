Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yqq3s-0004zl-M4
 for linux-mtd@lists.infradead.org; Fri, 08 May 2015 21:44:01 +0000
Message-ID: <554D2E05.8060806@nod.at>
Date: Fri, 08 May 2015 23:43:33 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>,
 Ben Shelton <ben.shelton@ni.com>
Subject: Re: [PATCH 1/3] mtd: nand: Add on-die ECC support
References: <1427292151-3835-1-git-send-email-richard@nod.at>
 <1427292151-3835-2-git-send-email-richard@nod.at>
 <20150427213558.GA22780@bshelton-desktop> <553EB5E4.3050309@nod.at>
 <20150427232353.GD32500@ld-irv-0074>
 <CAGnW=BYVn5quNKooiB44CiCYtuYckWArTkft4BQLxs188FwUpg@mail.gmail.com>
 <20150428032213.GI19571@brian-ubuntu>
 <20150508212632.GA7167@bshelton-desktop> <20150508213947.GF32500@ld-irv-0074>
In-Reply-To: <20150508213947.GF32500@ld-irv-0074>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: Boris Brezillon <boris.brezillon@free-electrons.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Punnaiah Choudary Kalluri <punnaiah.choudary.kalluri@xilinx.com>,
 punnaiah choudary kalluri <punnaia@xilinx.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 08.05.2015 um 23:39 schrieb Brian Norris:
> On Fri, May 08, 2015 at 04:26:32PM -0500, Ben Shelton wrote:
>> On 04/27, Brian Norris wrote:
>>> On Tue, Apr 28, 2015 at 08:18:12AM +0530, punnaiah choudary kalluri wrote:
>>>> On Tue, Apr 28, 2015 at 4:53 AM, Brian Norris
>>>> <computersforpeace@gmail.com> wrote:
>>>>> On Tue, Apr 28, 2015 at 12:19:16AM +0200, Richard Weinberger wrote:
>>>>>> Oh, I thought every driver has to implement that function. ;-\
>>>>>
>>>>> Nope.
>>>>>
>>>>>> But you're right there is a corner case.
>>>>>
>>>>> And it's not the only one! Right now, there's no guarantee even that
>>>>> read_buf() returns raw data, unmodified by the SoC's controller. Plenty
>>>>> of drivers actually have HW-enabled ECC turned on by default, and so
>>>>> they override the chip->ecc.read_page() (and sometimes
>>>>> chip->ecc.read_page_raw() functions, if we're lucky) with something
>>>>> that pokes the appropriate hardware instead. I expect anything
>>>>> comprehensive here is probably going to have to utilize
>>>>> chip->ecc.read_page_raw(), at least if it's provided by the hardware
>>>>> driver.
>>>>
>>>> Yes, overriding the chip->ecc.read_page_raw would solve this.
>>>
>>> I'm actually suggesting that (in this patch set, for on-die ECC
>>> support), maybe we *shouldn't* override chip->ecc.read_page_raw() and
>>> leave that to be defined by the driver, and then on-die ECC support
>>> should be added in a way that just calls chip->ecc.read_page_raw(). This
>>> should work for any driver that already properly supports the raw
>>> callbacks.
>>>
>>
>> Hi Richard et al,
>>
>> I'm guessing it's probably too late for the on-die ECC stuff to land in
>> 4.2 at this point.
> 
> Not technically. We've got several weeks (approx 5 to 6?) before 4.1 is
> released. 4.2 material should be getting finalized by a week or so
> before the merge window (i.e., 4 to 5 weeks from now).
> 
>> Is there anything I can do to help this along
>> (testing, etc.)?
> 
> This is going to need to get rewritten. I'm not sure if Richard is going
> to tackle this again, as he hasn't responded to the points I brought up.
> (Note that Richard is not the first to have tried to implement this,
> without initial success.)

I'm definitely willing to take the challenge.
But as I'm currently very busy with non-MTD stuff I had no time
to address your comments.

Thanks,
//richard
