Received: from mail-pw0-f49.google.com ([209.85.160.49])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1OBQGr-0004Xa-Ge
	for linux-mtd@lists.infradead.org; Mon, 10 May 2010 10:31:34 +0000
Received: by pwj3 with SMTP id 3so1479828pwj.36
	for <linux-mtd@lists.infradead.org>;
	Mon, 10 May 2010 03:31:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1273475736.2209.88.camel@localhost>
References: <m2l6b5362aa1005081239ne9eea253jc66c61822c4c1502@mail.gmail.com>
	<1273475736.2209.88.camel@localhost>
Date: Mon, 10 May 2010 16:01:31 +0530
Message-ID: <AANLkTima7WFjQ8Lg3rSfJbKdOuvNDPw-WdoNMtNFE_Ii@mail.gmail.com>
Subject: Re: UBIL design doc
From: Brijesh Singh <brijesh.s.singh@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable
Cc: rohitvdongre@gmail.com, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, May 10, 2010 at 12:45 PM, Artem Bityutskiy <dedekind1@gmail.com> wr=
ote:
> On Sun, 2010-05-09 at 01:09 +0530, Brijesh Singh wrote:
>> Hi,
>> =A0 I am forwarding you the design document for ubi with log. Please
>> find the ubil document at
>> http://git.infradead.org/users/brijesh/ubil_results/blob_plain/HEAD:/UBI=
L
>> design document.pdf
>
> Hi guys,
>
> I've read the document. Looks very promising. Here some feed-back.
>
> 1. SB PEB wear-out. What if the reaseblock lifetime is, say, 10000
> erease cycles? Won't the SB PEB wear out very quickly? Why you did not
> go for the chaining approach which I described in the old JFFS3 design
> doc?

Right.

> If we do not implement chaining, we should at least design it and make
> sure UBIL can be extended later so that SB chaining could be added.

This looks better for now. I will add it it to design.

> 2. SB PEB at the end. I think this is a very bad idea. Imagine you have
> to do UBIL images for production on the factory. With your design you
> have the following bad drawbacks:
>
> =A0a. NAND flash has initial bad blocks, and you do not know how many,
> =A0 =A0 and where they sit. These may be the last 8 eraseblocks. So, when
> =A0 =A0 you prepare an image (say, with the ubinize user-space tool), whe=
re
> =A0 =A0 will you put the second SB PEB?
>
> =A0b. Currently, UBI/UBIFS images are small. E.g., if you make an
> =A0 =A0 UBI/UBIFS image for 1GiB flash, and you have just few KiB of file=
s,
> =A0 =A0 your image will be few megs - it will contain the files, and all
> =A0 =A0 the needed UBI/UBIFS meta-data.
>
> =A0 =A0 So now what will be image size for UBIL - 1GiB, and this is bad.
> =A0 =A0 You then will transfer 1GiB of data to the devices during flashin=
g
> =A0 =A0 or you will have to invent ways to work around this. Do you need
> =A0 =A0 these complexities?
>
> I think the second SB PEB should not be at the end.
Good point. I will add it to first and second good block right now.

> 3. Backward-compatibility. In UBIL you removed EC anc VID headers in
> =A0 PEBs. That's fine for optimization purposes. But it has draw-backs:
>
> =A0 a. If any of the UBIL meta-data blocks like SB, CMT or log are
> =A0 =A0 =A0corrupted - that's it - we are screwed. You cannot anymore
> =A0 =A0 =A0re-consturct the data by scanning. The robustness goes down.
>
> =A0 c. Backward compatibility - UBI will not be able to attach UBIL
> =A0 =A0 =A0images. This is not very nice.
>
> So, I think you should keep EC and VID headers in PEBs. And you should
> make the SB/CMT/log blocks to be a new type of UBI volume with
> UBI_COMPAT_DELETE or UBI_COMPAT_PRESERVE or UBI_COMPAT_RO type. In this
> case UBI will attach UBIL volumes just fine.
>
> Then, you can add an _option_ to have no EC/VID headers in PEBs. This
> then can be used for performance, if one wants to sacrifice robustness.
> But this should be the second step. In this case, you will just need to
> put a VID header with UBI_COMPAT_REJECT flag to the first PEB.
>
> I have some more notes, but these 3 are enough for now.
>
> What do you think?
This is nice. But I need to think a bit. I will get back on this.
