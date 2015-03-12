Received: from mx.dave-tech.it ([2.229.21.40])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YW0Om-0004mA-VF
 for linux-mtd@lists.infradead.org; Thu, 12 Mar 2015 10:31:30 +0000
Message-ID: <5501698B.5050704@dave.eu>
From: Andrea Marson - DAVE Embedded Systems <andrea.marson@dave.eu>
Reply-To: 0D23F1ECC880A74392D56535BCADD7354973D072@NTXBOIMBX03.micron.com
MIME-Version: 1.0
To: jlauruhn@micron.com
Subject: RE: RFC: detect and manage power cut on MLC NAND
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Andrea Scian - DAVE Embedded Systems <rnd4@dave-tech.it>,
 dedekind1@gmail.com, linux-mtd@lists.infradead.org, richard@nod.at
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Thu, 12 Mar 2015 10:31:30 -0000

Hi Jeff,

thank you for your availability. I'd really love to discuss in more 
detail these matters.

About Write Protect (WP) pin, IIUC it must respect several constraints. 
For example it must not be transitioned while NAND is busy. What if it 
is set low while NAND is ready - that is it can accept new commands - 
but an erase operation is in progress? Does the erase operation complete 
anyway?

Andrea Marson
*DAVE Embedded Systems*



> Power loss is actually very complex.  The Write Protect (WP) pin was added =
> to NAND help lock the NAND when a power loss event is detected.  I have ext=
> ensive information on NAND and would be happy to discuss.  =20
>
>
> Jeff Lauruhn
> NAND Application Engineer
> Embedded Business Unit
> Micron Technology, Inc
>
>
> -----Original Message-----
> From: linux-mtd [mailto:linux-mtd-bounces@lists.infradead.org] On Behalf Of=
>   Andrea Scian
> Sent: Wednesday, March 11, 2015 10:01 AM
> To: Richard Weinberger; dedekind1@gmail.com
> Cc: mtd_mailinglist
> Subject: Re: RFC: detect and manage power cut on MLC NAND
>
>
> Hi all,
>
> and thanks for you feedback.
> You can find my comments below.
>
> Il 11/03/2015 10:09, Richard Weinberger ha scritto:
>> Am 11.03.2015 um 10:05 schrieb Artem Bityutskiy:
>>> On Wed, 2015-03-11 at 09:57 +0100, Richard Weinberger wrote:
>>>> Hi!
>>>>
>>>> Am 11.03.2015 um 08:20 schrieb Artem Bityutskiy:
>>>>> On Tue, 2015-03-10 at 13:51 +0100, Richard Weinberger wrote:
>>>>>>> WDYT about this?
>>>>>>> If it sounds reasonable is there any suggestion where to place such =
> a code?
>>>>>> Customers often use DYI uninterruptible power supplies using capacito=
> rs.
>>>>>> But managing a power cut is the least problem you have with MLC NAND.
>>>>> Why is it the least problem, what is the hardest one? I thought=20
>>>>> this one is the hardest.
>>>> IMHO the hardest ones are the problems we don't know yet as NAND=20
>>>> vendors are not really chatty about the MLC constraints.
>>>> We don't know much about data retention for example. At least we=20
>>>> have not much hard facts. Most of our knowledge is hearsay.
>>> Well, but from the problems we know paired pages seems to be the=20
>>> biggest one. E.g., what do we do if VID header gets corrupted because=20
>>> of an interrupted write to the page paired with the VID header page?=20
>>> Sounds like a hard problem to me.
>> It is a hard problem. But at least we know about it.
>>
> IIUC can I summarize like the following
>
> 1) power cut is one of the big problem we know about MLC NAND flash with UB=
> I
> 2) we are unaware of other big issue with MLC NAND
>
> Unfortunately I don't really know the MTD/UBI/UBIFS internals but (correct =
> me if I'm wrong) to me solving the power cut issue only by software (by usi=
> ng proper data structure, redundancy, NAND flash operation jornal and so on=
> ) is pretty hard to implement inside the Linux MTD stack.
>
> On the other hand, stuff like scrubbing (e.g. having a task like GC that pe=
> riodically scrub the required NAND erase block), paired page (e.g.
> carefully selecting LEB to PEB mapping to avoid reading/writing data into p=
> aired page in a wrong way) are still to be implemented but have, somehow, l=
> ess impact on the whole MTD stack.
>
> For sure I'm missing some other MLC NAND issue, but the above are the one t=
> hat I'm aware of.
>
> WDYT?
>
> Best Regards,
>
> --=20
>
> Andrea SCIAN
>
> DAVE Embedded Systems
>
>
>
