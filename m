Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SWTPq-0007gi-6X
 for linux-mtd@lists.infradead.org; Mon, 21 May 2012 14:16:55 +0000
Message-ID: <4FBA4E52.8090807@nod.at>
Date: Mon, 21 May 2012 16:16:50 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH 1/7] [RFC] UBI: Export next_sqnum()
References: <1337101871-31181-1-git-send-email-richard@nod.at>
 <1337101871-31181-2-git-send-email-richard@nod.at>
 <1337173272.24809.52.camel@sauron.fi.intel.com> <4FBA4448.20509@nod.at>
 <1337608854.2483.71.camel@sauron.fi.intel.com>
In-Reply-To: <1337608854.2483.71.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Heinz.Egger@linutronix.de, tglx@linutronix.de,
 linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
 tim.bird@am.sony.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 21.05.2012 16:00, Artem Bityutskiy wrote:
> On Mon, 2012-05-21 at 15:34 +0200, Richard Weinberger wrote:
>>> +	/* TODO: Before checking version - check the CRC.
>>
>> The CRC covers only the fastmap data, not the super block.
>
> Everything should be protected with CRC.

Okay, done. :)

>>>    	for (i = 0; i<   nblocks; i++) {
>>> +		/* TODO: you basically perform the scanning here - you should
>>> +		 * share the same code as we use in scan.c: use process_peb().
>>> +		 */
>>
>> What exactly do you mean by that?
>> process_eb() will not help much because the fastmap data is written
>> "raw" to the flash. (Without any interaction from the WL sub-system)
>
> It still contains EC and VID headers. So you can use the existing code
> for scanning it.

I use already ubi_io_read_vid_hdr() and ubi_io_read_ec_hdr() what should 
I reuse?
Also checking the image sequence would make sense.

Thanks,
//richard
