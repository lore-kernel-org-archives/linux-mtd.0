Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1OBNEC-0005FN-Lr
	for linux-mtd@lists.infradead.org; Mon, 10 May 2010 07:16:37 +0000
Subject: Re: UBIL design doc
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Brijesh Singh <brijesh.s.singh@gmail.com>
In-Reply-To: <m2l6b5362aa1005081239ne9eea253jc66c61822c4c1502@mail.gmail.com>
References: <m2l6b5362aa1005081239ne9eea253jc66c61822c4c1502@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 10 May 2010 10:15:36 +0300
Message-ID: <1273475736.2209.88.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: rohitvdongre@gmail.com, linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, 2010-05-09 at 01:09 +0530, Brijesh Singh wrote:
> Hi,
>   I am forwarding you the design document for ubi with log. Please
> find the ubil document at
> http://git.infradead.org/users/brijesh/ubil_results/blob_plain/HEAD:/UBIL
> design document.pdf

Hi guys,

I've read the document. Looks very promising. Here some feed-back.

1. SB PEB wear-out. What if the reaseblock lifetime is, say, 10000
erease cycles? Won't the SB PEB wear out very quickly? Why you did not
go for the chaining approach which I described in the old JFFS3 design
doc?

If we do not implement chaining, we should at least design it and make
sure UBIL can be extended later so that SB chaining could be added.

2. SB PEB at the end. I think this is a very bad idea. Imagine you have
to do UBIL images for production on the factory. With your design you
have the following bad drawbacks:

  a. NAND flash has initial bad blocks, and you do not know how many,
     and where they sit. These may be the last 8 eraseblocks. So, when
     you prepare an image (say, with the ubinize user-space tool), where
     will you put the second SB PEB?

  b. Currently, UBI/UBIFS images are small. E.g., if you make an
     UBI/UBIFS image for 1GiB flash, and you have just few KiB of files,
     your image will be few megs - it will contain the files, and all
     the needed UBI/UBIFS meta-data.

     So now what will be image size for UBIL - 1GiB, and this is bad.
     You then will transfer 1GiB of data to the devices during flashing
     or you will have to invent ways to work around this. Do you need
     these complexities?

I think the second SB PEB should not be at the end.

3. Backward-compatibility. In UBIL you removed EC anc VID headers in
   PEBs. That's fine for optimization purposes. But it has draw-backs:

   a. If any of the UBIL meta-data blocks like SB, CMT or log are
      corrupted - that's it - we are screwed. You cannot anymore
      re-consturct the data by scanning. The robustness goes down.

   c. Backward compatibility - UBI will not be able to attach UBIL
      images. This is not very nice.

So, I think you should keep EC and VID headers in PEBs. And you should
make the SB/CMT/log blocks to be a new type of UBI volume with
UBI_COMPAT_DELETE or UBI_COMPAT_PRESERVE or UBI_COMPAT_RO type. In this
case UBI will attach UBIL volumes just fine.

Then, you can add an _option_ to have no EC/VID headers in PEBs. This
then can be used for performance, if one wants to sacrifice robustness.
But this should be the second step. In this case, you will just need to
put a VID header with UBI_COMPAT_REJECT flag to the first PEB.

I have some more notes, but these 3 are enough for now.

What do you think?

In any case, whatever you will try to change in UBIL, remember to make
it stable as it is now first, then do all changes so that you do not
break it.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
