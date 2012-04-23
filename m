Received: from mail-lb0-f177.google.com ([209.85.217.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SMFhA-0005fK-EI
 for linux-mtd@lists.infradead.org; Mon, 23 Apr 2012 09:36:33 +0000
Received: by lbol5 with SMTP id l5so4088156lbo.36
 for <linux-mtd@lists.infradead.org>; Mon, 23 Apr 2012 02:36:29 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CABYn4sx4SehvwHgP3m5i5Bg7_5FWTHHGMLL+n_R1YujwaU_MzA@mail.gmail.com>
References: <1334913230-23615-1-git-send-email-hechtb@gmail.com>
 <1334913230-23615-9-git-send-email-hechtb@gmail.com>
 <7855571.0NdFmdbNxx@avalon>
 <CABYn4sx4SehvwHgP3m5i5Bg7_5FWTHHGMLL+n_R1YujwaU_MzA@mail.gmail.com>
Date: Mon, 23 Apr 2012 11:36:29 +0200
Message-ID: <CABYn4sxbXiOkdPps59gkOj2MiYZXkeqgKTXt7i7HTz17VqWk0Q@mail.gmail.com>
Subject: Re: [PATCH 8/9] mtd: sh_flctl: Use user oob data in hardware ECC mode
From: Bastian Hecht <hechtb@googlemail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: Magnus Damm <magnus.damm@gmail.com>, linux-mtd@lists.infradead.org,
 linux-sh@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2012/4/23 Bastian Hecht <hechtb@googlemail.com>:
> Hello Laurent,
>
> 2012/4/21 Laurent Pinchart <laurent.pinchart@ideasonboard.com>:
>> Hi Bastian,
>>
>> Thanks for the patch.
>>
>> On Friday 20 April 2012 11:13:49 Bastian Hecht wrote:
>>> In hardware ecc mode, the flctl now writes and reads the oob data
>>> provided by the user. Additionally the ECC is now returned in normal
>>> page reads, not only when using the explicit NAND_CMD_READOOB command.
>>
>> For my information again, what's the purpose of returning OOB data if th=
e
>> caller hasn't requested it ? What are those data then used for ?
>
> There is an active discussion going on whether to pass a boolean to
> nand_{read,write} that indicates if we need oob data or not. I assume
> this to make it into the mainline then I can adapt this to the flctl
> driver. The data can be used by file systems or bad block marking or
> any other organizational needs like wear leveling and so on.

I'm unsure if I missed your point here - we just don't know if we need
it or not. The discussion I mentioned primarily takes place here at
the mtd mailing list:

[PATCH 1/2] mtd: nand: add OOB argument to NAND {read,write}_page interface=
s
http://lists.infradead.org/pipermail/linux-mtd/2012-April/040714.html

Now I'm confused as well whether I should skip the read oob part of the pat=
ch.
I'll skip the read part of the patch until a decision is made, I think.

Best regards,

 Bastian Hecht


> Best regards,
>
> =A0Bastian Hecht
>
>
>>> Signed-off-by: Bastian Hecht <hechtb@gmail.com>
>>
>> --
>> Regards,
>>
>> Laurent Pinchart
>>
