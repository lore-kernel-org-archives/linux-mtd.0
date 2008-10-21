Received: from fk-out-0910.google.com ([209.85.128.184])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1KsBq2-0000gW-3h
	for linux-mtd@lists.infradead.org; Tue, 21 Oct 2008 07:39:35 +0000
Received: by fk-out-0910.google.com with SMTP id 18so2907824fks.2
	for <linux-mtd@lists.infradead.org>;
	Tue, 21 Oct 2008 00:39:32 -0700 (PDT)
Message-ID: <7ccead5b0810210039s65a37741ge330f8c89187be9c@mail.gmail.com>
Date: Tue, 21 Oct 2008 15:39:32 +0800
From: "Du Zhongdong" <axdududu@gmail.com>
To: "Ricard Wanderlof" <ricard.wanderlof@axis.com>
Subject: Re: [NAND flash driver] What would mtd do if read returns -EBADMSG
	(ecc failed)
In-Reply-To: <Pine.LNX.4.64.0810210915260.6120@lnxricardw.se.axis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
References: <7ccead5b0810202311k45ff8b98hf1b3014ed27ff777@mail.gmail.com>
	<Pine.LNX.4.64.0810210848000.6120@lnxricardw.se.axis.com>
	<7ccead5b0810202358l60368b79q2aae53bd1afc218@mail.gmail.com>
	<Pine.LNX.4.64.0810210915260.6120@lnxricardw.se.axis.com>
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Oct 21, 2008 at 3:16 PM, Ricard Wanderlof
<ricard.wanderlof@axis.com> wrote:
>
> On Tue, 21 Oct 2008, Du Zhongdong wrote:
>
>>> Normally, uncorrectable errors occur after there have been correctable
>>> errors for a while. When correctable errors start occurring, this is a
>>> sign
>>> that the block should be erased and rewritten. As someone pointed out,
>>> UBI
>>> does this, plain JFFS2 does not.
>>>
>> Thanks, Rechard :)
>>
>> So, If I detect correctable errors start occurring, I can erase that blo=
ck
>> and rewritten to it, all these can happen in my nand flash driver, am I
>> right?
>
> Normally this would happen at a higher level, such as UBI. I'm not sure
> exactly what you mean by 'nand flash driver', but the actual driver for a
> specific flash should not have to contain code that is common to a whole
> range of devices.
>
> /Ricard
> --
> Ricard Wolf Wanderl=F6f                           ricardw(at)axis.com
> Axis Communications AB, Lund, Sweden            www.axis.com
> Phone +46 46 272 2016                           Fax +46 46 13 61 30
>  --- PLEASE NOTE - I have moved - from F407 to F117 - PLEASE NOTE ---
>


Thank you, Richard, I think I got it :)

Best regards,
Du Zhongdong
