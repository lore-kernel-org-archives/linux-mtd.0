Received: from smtp1-g21.free.fr ([212.27.42.1])
	by canuck.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
	id 1RKutf-0005i5-FN
	for linux-mtd@lists.infradead.org; Mon, 31 Oct 2011 16:39:40 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Mike Dunn <mikedunn@newsguy.com>
Subject: Re: [PATCH 12/13] mtd/docg3: add ECC correction code
References: <1319824292-11085-1-git-send-email-robert.jarzmik@free.fr>
	<1319824292-11085-13-git-send-email-robert.jarzmik@free.fr>
	<4EAE9FB6.6090200@newsguy.com>
Date: Mon, 31 Oct 2011 17:39:19 +0100
In-Reply-To: <4EAE9FB6.6090200@newsguy.com> (Mike Dunn's message of "Mon, 31
	Oct 2011 06:16:38 -0700")
Message-ID: <87vcr586a0.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Mike Dunn <mikedunn@newsguy.com> writes:

> Hi Robert,
>
> A few comments (limited to the bch decode for now)...
> To avoid confusion with the terminology in Ivan's BCH algorithm, I wouldn't call
> it calc_ecc.  It's actually recv_ecc ^ calc_ecc, where recv_ecc is what the hw
> read from the ecc field of the oob data, and calc_ecc is what the hw calculated
> from the page data.  Maybe just hwecc or similiar.
Yep, point taken for V2, hwecc sounds good.

...zip...
>> +	numerrs = decode_bch(docg3_bch, NULL, DOC_ECC_BCH_COVERED_BYTES,
>> +			     NULL, ecc, NULL, errorpos);
> This looks right, with the redefined DOC_ECC_BCH_COVERED_BYTES (now 520).   
>
> Some commentary would be helpful (though maybe I'm too verbose)...
>
>     /*
>      * The hardware ecc unit produces oob_ecc ^ calc_ecc.  The kernel's bch
>      * algorithm is used to decode this.  However the hw operates on page
>      * data in a bit order that is the reverse of that of the bch alg,
>      * requiring that the bits be reversed on the result.  Thanks to Ivan
>      * Djelic for his analysis.
>      */
Right again. I will copy paste that explanation in the code.

> I recommend you test this.  One way would be to compile the bch algorithm in
> userspace and use it to generate the ecc for a 520  byte test vector.  Reverse
> the bits of this ecc, then flip a few bits in the test vector and write it to a
> page in flash, with your driver modified to write the calculated ecc instead of
> that served up by the hardware.  Then when you read the page, the above code
> should identify and correct the bits you flipped (assuming a genuine flash error
> did not occur while reading back the page).  I have the bch alg modified for
> userspace, if that would help.
I did test it in userspace.
And after Ivan's proposition, I tested it also with nandwrite/nanddump by
introducing some random errors. The error correction code works, a few
amendments (for V2) will be added for "bitflipped" data writes/reads.

But the conclusion is that Ivan and your work is indeed directly applicable in
the G3 case, and tested :)

>> +	if (numerrs < 0)
>> +		return numerrs;
>
> I recommend you check for the -EINVAL return value and issue a big fat error. 
> Maybe BUG_ON(numerrs == -EINVAL), at least for now.
Okay.

>
> Another explanatory comment here...
>     /* undo last step in BCH alg (modulo mirroring not needed) */
Is that the same as the function comment about bit reversing (the modulo
mirroring part) ? If so, the function comment might not be clear enough. If not,
could you explain a bit further please ?

Thanks for the review.

Cheers.

--
Robert
