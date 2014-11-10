Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xnky9-0004cJ-Gl
 for linux-mtd@lists.infradead.org; Mon, 10 Nov 2014 09:09:06 +0000
Message-ID: <54608097.5040101@nod.at>
Date: Mon, 10 Nov 2014 10:08:39 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Ricard Wanderlof <ricard.wanderlof@axis.com>
Subject: Re: suspect UBIFS async operations causing issues during reboot
References: <5459E090.1010300@broadcom.com>
 <CAFLxGvwTLd_uWBrj9RsD6FPFCSGsC_VcOmi_j0VLgVCJ=YVQ9w@mail.gmail.com>
 <545A64CF.20101@broadcom.com> <545A6AA0.8050901@nod.at>
 <545AAA2B.8090007@broadcom.com> <545BEEA5.7020609@broadcom.com>
 <545C8697.3080403@nod.at> <545D01F4.9050005@broadcom.com>
 <545F3FD8.6010001@nod.at>
 <alpine.DEB.2.02.1411100932310.23184@lnxricardw1.se.axis.com>
In-Reply-To: <alpine.DEB.2.02.1411100932310.23184@lnxricardw1.se.axis.com>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 Scott Branden <sbranden@broadcom.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 10.11.2014 um 09:44 schrieb Ricard Wanderlof:
> 
> On Sun, 9 Nov 2014, Richard Weinberger wrote:
> 
>> Am 07.11.2014 um 18:31 schrieb Scott Branden:
>>> On 14-11-07 12:45 AM, Richard Weinberger wrote:
>>>> Am 06.11.2014 um 22:56 schrieb Scott Branden:
>>>>> It looks like the erase happening in the middle of reboot was uncovered in 2009 and never addressed properly?
>>>>>
>>>>> https://lkml.org/lkml/2009/6/9/16
>>>>> https://lkml.org/lkml/2010/2/12/144
>>>>>
>>>>> Was there a proper resolution to this issue?
>>>>
>>>> Did you read the threads you've posted?
>>>>
>>>> There two answers:
>>>> https://lkml.org/lkml/2010/2/12/143
>>> Yes, there is no hardware solution to a reset happening in the middle of an erase operation to NAND.
>>
>> Well, I agree with David that anything we do in software will only hide the real problem
>> or trim down the window.
> 
> There's something I don't understand here. It could be (and probably will 
> prove to be) my lack of knowledge on the detailed workings of UBI.
> 
> Back in jffs2 days, erased blocks were so indicated by writing a 
> 'cleanmarker' pattern to the OOB area. Thus, when scanning the flash, if a 
> block was encountered which appeared erased but lacked the cleanmarker, it 
> was re-erased just in case the previous erase was interrupted and 
> therefore did not leave the bits in a properly erased state.
> 
> With ubifs, cleanmarkers are not used (partly because MLC flashes wouldn't 
> support two writes to the OOB area: one for the cleanmarker and one for 
> the ECC), but there _is_ a header at the start of each PEB. Thus the same 
> situation really holds, if a (seemingly) erased PEB is encountered with no 
> EC header, it could be considered the leftover of an unfinished erase 
> operation. I don't know for a fact if (or how) UBI does this though.
> 
> Of course, and interrupted erase operation could leave a block in a 
> seemingly un-erased state, i.e. the data appears intact (but may not be). 
> But in that case the block would already be superseded by another block 
> (i.e. any potential data would have already been copied to another block 
> with the header infoinvalidating the old one). So in this case the block 
> would go on an erase list at some point because it is no longer valid.
> 
> Since interrupted erase seems to be of so much a concern I've obviously 
> missed something above. But I can't figure out what.
> 
> The only thing that seems relevant among the links above is
> 
> https://lkml.org/lkml/2010/2/12/144
> 
> which indicates that half-erased blocks might cause problems with certain 
> boot loaders, but again, that's a problem with the bootloader, not UBI.

Correct. UBI can deal with that, if some component in your "NAND-Chain" does not, it
needs fixing.
Changing UBI/MTD in a way to hide such issues in not a good solution IMHO.
In the old thread the idea was rejected by both the UBI and the MTD maintainer.

Thanks,
//richard
