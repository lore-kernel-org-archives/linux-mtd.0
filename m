Received: from mail-wy0-f177.google.com ([74.125.82.177])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1Oifnb-00013F-Qh
	for linux-mtd@lists.infradead.org; Tue, 10 Aug 2010 03:46:48 +0000
Received: by wyf19 with SMTP id 19so8249005wyf.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 09 Aug 2010 20:46:46 -0700 (PDT)
MIME-Version: 1.0
Sender: jonringle@gmail.com
In-Reply-To: <4C607150.6040806@jkmicro.com>
References: <AANLkTikPQfNJ9eZeF6scpnx5beVt=dR6pfNgqcExteMu@mail.gmail.com>
	<4C607150.6040806@jkmicro.com>
Date: Mon, 9 Aug 2010 23:46:46 -0400
Message-ID: <AANLkTinL1dqv9LmQ1zTCEJ46pb=jfc3=25cehHFi9wfT@mail.gmail.com>
Subject: Re: buffer write error (status 0x90)
From: Jon Ringle <jon@ringle.org>
To: Adam Yergovich <ayergo@jkmicro.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Aug 9, 2010 at 5:21 PM, Adam Yergovich <ayergo@jkmicro.com> wrote:
> Jon Ringle wrote:
>>
>> We are replacing the discontinued Intel StrataFlash P30 flash
>> JS28F256P30T95 with the Numonyx P30-65nm flash JS28F256P30TF on our
>> boards and have a few boards with sample chips. During some testing
>> one of the boards with the Numonyx flash chip is now reporting the
>> following buffer write error (status 0x90) on every boot:
>
> I have tested swapping the lower density part and haven't had any problem=
s
> with MTD or otherwise. =A0I suspect you've just got a bad part or somethi=
ng
> else happened.

Maybe, but we have seen other incompatibilities that occurred on all
of our samples. We use Redboot as the bootloader and we found that a
Redboot image in ROM mode will hang when trying to unlock and erase a
sector. I resolved that problem by building a ROMRAM Redboot image.
