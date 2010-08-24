Received: from mail-bw0-f49.google.com ([209.85.214.49])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OnzTw-0001iQ-T8
	for linux-mtd@lists.infradead.org; Tue, 24 Aug 2010 19:48:32 +0000
Received: by bwz13 with SMTP id 13so35115bwz.36
	for <linux-mtd@lists.infradead.org>;
	Tue, 24 Aug 2010 12:48:24 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <AANLkTinL1dqv9LmQ1zTCEJ46pb=jfc3=25cehHFi9wfT@mail.gmail.com>
References: <AANLkTikPQfNJ9eZeF6scpnx5beVt=dR6pfNgqcExteMu@mail.gmail.com>
	<4C607150.6040806@jkmicro.com>
	<AANLkTinL1dqv9LmQ1zTCEJ46pb=jfc3=25cehHFi9wfT@mail.gmail.com>
From: Shane Volpe <shanevolpe@gmail.com>
Date: Tue, 24 Aug 2010 15:48:04 -0400
Message-ID: <AANLkTinV-YT9ypqY8aXxmP2ZVKVsofzU0Y7PLXH6ac5g@mail.gmail.com>
Subject: Re: buffer write error (status 0x90)
To: Jon Ringle <jon@ringle.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org, Adam Yergovich <ayergo@jkmicro.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Jon,
I'm also replacing the obsolete P30 part and ran into an interesting
issue.  It turns out the new replacement part has a larger buffer size
so if you mix and match the obsolete part with the newer part you will
have issues because if the new part is in the lower nibble 0:15 the
CFI will read out its buffer size and since that buffer size is larger
than the obsolete P30 sitting in the higher nibble 16:31 then the its
buffer will get over run and not work.  So what I'm saying is that
even though the replacement part is almost the same as the old part do
not mix and match as the buffer sizes will cause issues.  Although you
can patch the kernel and hard code the buffer size to that of the
legacy P30 or even better patch it to read the buffer sizes out of
both ICs and use the smaller size.

Regards,
Shane

On Mon, Aug 9, 2010 at 11:46 PM, Jon Ringle <jon@ringle.org> wrote:
> On Mon, Aug 9, 2010 at 5:21 PM, Adam Yergovich <ayergo@jkmicro.com> wrote=
:
>> Jon Ringle wrote:
>>>
>>> We are replacing the discontinued Intel StrataFlash P30 flash
>>> JS28F256P30T95 with the Numonyx P30-65nm flash JS28F256P30TF on our
>>> boards and have a few boards with sample chips. During some testing
>>> one of the boards with the Numonyx flash chip is now reporting the
>>> following buffer write error (status 0x90) on every boot:
>>
>> I have tested swapping the lower density part and haven't had any proble=
ms
>> with MTD or otherwise. =A0I suspect you've just got a bad part or someth=
ing
>> else happened.
>
> Maybe, but we have seen other incompatibilities that occurred on all
> of our samples. We use Redboot as the bootloader and we found that a
> Redboot image in ROM mode will hang when trying to unlock and erase a
> sector. I resolved that problem by building a ROMRAM Redboot image.
>
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
>
