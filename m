Received: from mail.gmx.net ([213.165.64.20])
	by bombadil.infradead.org with smtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KYSwF-00037N-Np
	for linux-mtd@lists.infradead.org; Wed, 27 Aug 2008 21:52:28 +0000
Message-ID: <48B5CC98.9000904@gmx.net>
Date: Wed, 27 Aug 2008 23:52:24 +0200
From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
MIME-Version: 1.0
To: Jamie Lokier <jamie@shareable.org>
Subject: Re: [PATCH 2/2] Add support for > 2GiB MTD devices
References: <1219815617.18027.132.camel@sauron>	<OF5BDBDD21.E5375C78-ON882574B2.0061B127-882574B2.00648B63@selinc.com>
	<20080827185142.GE27491@shareable.org>
In-Reply-To: <20080827185142.GE27491@shareable.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: linux-mtd-bounces@lists.infradead.org, linux-mtd@lists.infradead.org,
	linux-kernel@vger.kernel.org, Bruce_Leonard@selinc.com,
	Bruce Leonard <brucle@earthlink.net>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 27.08.2008 20:51, Jamie Lokier wrote:
> Bruce_Leonard@selinc.com wrote:
>   
>> I'm still reluctant to change size to a 64-bit value.  There's a vague 
>> recolection of early conversations on the list that there would be little 
>> acceptance for that.  And that probably has to do with the ongoing 
>> conversation about ABI changes.  What I could do to eliminate the 
>> multiplication is introduce the same concept that the NAND layer uses, 
>> shift values.  After all, erasesize should always be a power of 2, making 
>> that a power of 2 multiplication which can be done via shifts.  By 
>> changing erasesize to erasesize_shift, I'd get something like this:
>>
>> return a->num_eraseblocks == 0 ? a->size : a->num_eraseblocks << 
>> a->erasesize_shift
>>
>> How would that suit you?
>>     
>
> Are you sure it's always going to be a power of 2?
>
> What if someone targets a board with 3 chips wired to shared address
> and parallel data buses?
>
> Or if someone makes a weird chip?  Or if you can format it in
> different ways according to desired ECC level (like you can with CDs)?
>   

IIRC I saw a datasheet for such a chip (selectable erasesize with
non-power-of-2 default) some weeks ago and it had entered production a
few months ago. The erasesize was alwas a multiple of 16, though. Sorry
for not remembering more details.

Regards,
Carl-Daniel

-- 
http://www.hailfinger.org/
