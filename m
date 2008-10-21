Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1KsBOo-0000aL-GQ
	for linux-mtd@lists.infradead.org; Tue, 21 Oct 2008 07:11:26 +0000
Subject: Re: [NAND flash driver] What would mtd do if read returns -EBADMSG
	(ecc failed)
From: Artem Bityutskiy <dedekind@infradead.org>
To: Du Zhongdong <axdududu@gmail.com>
In-Reply-To: <7ccead5b0810202351n5db8e66ep1fbec555707950f6@mail.gmail.com>
References: <7ccead5b0810202311k45ff8b98hf1b3014ed27ff777@mail.gmail.com>
	<1224570119.4466.99.camel@sauron>
	<7ccead5b0810202351n5db8e66ep1fbec555707950f6@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Date: Tue, 21 Oct 2008 10:09:54 +0300
Message-Id: <1224572994.4466.108.camel@sauron>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2008-10-21 at 14:51 +0800, Du Zhongdong wrote:
> I got another question: if, in my nand flash driver, there's an ECC
> error cannot be corrected during a read procedure, I think now the
> block should be marked as a bad block

Read errors do not indicate that the block became bad. For example, if
you write twice (and different data) to the same NAND page, you'll
probably end up with ECC errors. But the block will not be bad.

For example, a silly user wrote something to /dev/mtd several times. And
you have many read errors. Is whole /dev/mtd bad? No, it does not.

> , then two options:
> 1, I mark that block BAD in my nand flash driver(specifically, I would
> insert some code in the nand_read() function in nand_base.c to handle
> this error);

Current model is so that MTD driver is not intelligent. It just reads,
writes, erases, etc when it is asked to. All bad block management is
done in upper layers. So this is not your driver's pain.

> 2, I return some error msg the upper layer(ie. MTD layer), which is
> what nand_read() do at present. Then I would expect the MTD layer
> would mark that block BAD.

Not the MTD layer, but stuff like UBI or JFFS2 - the _client_ of the MTD
layer.

> I read s3c2410.c and find that it chose option 2. But I can't find the
> place in the code where  the MTD layer mark that block BAD.

Right. MTD layer does not do this. It is stupid, and marks blocks as bad
only when someone calls mtd->block_markbad().

Think about MTD as the very low layer, which just provides the interface
to work with raw flash chip. Nothing else, no intelligence.

--=20
Best regards,
Artem Bityutskiy (=D0=91=D0=B8=D1=82=D1=8E=D1=86=D0=BA=D0=B8=D0=B9 =D0=90=
=D1=80=D1=82=D1=91=D0=BC)
