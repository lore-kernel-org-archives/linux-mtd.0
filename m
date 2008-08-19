Received: from ik-out-1112.google.com ([66.249.90.183])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KVKGS-0006pj-Sj
	for linux-mtd@lists.infradead.org; Tue, 19 Aug 2008 06:00:21 +0000
Received: by ik-out-1112.google.com with SMTP id c21so2692278ika.2
	for <linux-mtd@lists.infradead.org>;
	Mon, 18 Aug 2008 23:00:20 -0700 (PDT)
Message-ID: <ac9c93b10808182300g4f1eb006p5416cc2f49eb568@mail.gmail.com>
Date: Tue, 19 Aug 2008 08:00:20 +0200
From: "Frans Meulenbroeks" <fransmeulenbroeks@gmail.com>
To: "Troy Kisky" <troy.kisky@boundarydevices.com>
Subject: Re: [RESUBMIT] [PATCH] [MTD] NAND nand_ecc.c: rewrite for improved
	performance
In-Reply-To: <48A9F346.7020706@boundarydevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <alpine.DEB.0.99.0807311031390.6774@frans-desktop>
	<1218795140.3184.84.camel@pmac.infradead.org>
	<48A5D154.2000409@boundarydevices.com>
	<alpine.DEB.0.99.0808152300300.9220@frans-desktop>
	<48A8937D.1010007@boundarydevices.com>
	<ac9c93b10808172333l1f6771b2w1404f9ac771d3058@mail.gmail.com>
	<48A9AF73.2040105@boundarydevices.com>
	<ac9c93b10808181409uca8dc59ja62f43a217f4a969@mail.gmail.com>
	<48A9E99E.7070302@boundarydevices.com>
	<48A9F346.7020706@boundarydevices.com>
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

@David:

I have no need for access to a big-endian system as I have the NSLU2

@Troy:

I'll look into this tonight (I'm about to leave to work now).
I already saw that the 11 bits count would go wrong if either of the
two lower bits were to flip by accident, so as a minimum these should
be masked off before counting.
But I will dig further into this & will follow up on this.

Best regards, Frans.



2008/8/19 Troy Kisky <troy.kisky@boundarydevices.com>:
> Troy Kisky wrote:
>> Frans Meulenbroeks wrote:
>> (ignoring inversions)
>> Example: You have a block of all zeros.
>>
>> The ecc stored in the spare bytes of this is also 0.
>> Now, upon reading this block of zeroes, a two bit ecc occurs. The bits that happen to be
>> read incorrectly are bit # 0 & bit # 0x3f of the block
>> The hardware calculated ecc will be
>> 0:0 ^ 0:fff = 0:fff after bit 0
>> 0:fff ^ 3f:fc00 = 3f:3f after bit 3f
>>
>> Now, when your algorithm counts bits you get 12, and decide
>> it is a single bit ecc error.
>>
>> The old way however will xor the high and low 12 bits 3f ^ 3f = 0, 0 != fff and
>> decide it is multi bit ecc error and give an error.
>>
>> Note, that both approaches would have decide it was a single bit error, if the second
>> error wouldn't have happened.
>>
>>
>> So, try a block of zeroes and flip bits 0 and 0x3f.
>>
>> Troy
>>
>
> Whoops, that's a 512 bytes ecc example (as that's what I'm used to).
>
> The 256 byte ecc may be harder. How about
> bit 0, 0x3f, and the 1st bit of the ecc
>
>  0:0 ^ 0:7ff = 0:7ff after bit 0
>  0:7ff ^ 3f:7c00 = 3f:3f after bit 3f
>  3f:3f ^ 0:1 = 3f:3e
>
>
>
> This is 11 bits but 3f^3e = 1, 1 !=7ff and the old algorithm will refuse to correct.
> So the new behavior is different.
>
> Any extra detection is worth it to me.
>
> Troy
>
>
