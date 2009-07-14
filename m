Received: from smtp.nokia.com ([192.100.122.233] helo=mgw-mx06.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MQetQ-0008Se-2B
	for linux-mtd@lists.infradead.org; Tue, 14 Jul 2009 10:05:54 +0000
Subject: Re: UBI resizing
From: Artem Bityutskiy <dedekind@infradead.org>
To: Jelle Martijn Kok <jmkok@youcom.nl>
In-Reply-To: <4A5B4EC7.9010605@youcom.nl>
References: <4A5B4EC7.9010605@youcom.nl>
Content-Type: multipart/alternative; boundary="=-WHAxrZtp6yT9nun7RA0j"
Date: Tue, 14 Jul 2009 13:05:35 +0300
Message-Id: <1247565935.3828.136.camel@localhost.localdomain>
Mime-Version: 1.0
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


--=-WHAxrZtp6yT9nun7RA0j
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Hi,

On Mon, 2009-07-13 at 17:12 +0200, Jelle Martijn Kok wrote:

> I have made an "ubirsvol" application (actually it are just some very 
> simple changes to your ubimkvol/ubirmvol). If you would like to have it, 
> I could sent it.


Sure, why not to have it in ubi-utils?


> Question 1: Why do UBI volumes have fixed sizes ?


Hmm, we just designed it this way. We wanted to guarantee that the total
about of LEBs on UBI device is not larger that the amount of available
PEB, so that you could write data to all LEBs.


> As far as I can see, all unused PEBs only have their EC headers are 
> written in the MTD. The volume headers are left unwritten.


Right.


> Only PEBs which are attached to a specific volume have their volume 
> header set.


Yes. Some LEBs are mapped and contain data, so the corresponding PEBs
have the VID header. The unmapped LEBs are not associated with any
PEBs. So there are PEBs which do not have VID header.

But UBI guarantees that all LEBs may be written to at the same time -
there are enough PEBs reserved.


> Is it correct that all unused PEBS are in a pool for the whole ubi 
> device, and not in a pool per ubi volume ?


Correct. Every PEB may be used for any LEB in any volume. When you write
to an un-mapped LEB, the wear-levelling subsystem will pick an
appropriate PEB.


> I do understand that this might make it much harder for UBIFS to 
> determine its available space as it could actually mean that two UBIFS 
> filesystems which are mounted on the same ubi (eg. ubi0_0 and ubi0_1) 
> might see the same amount of available LEBs, and thus UBIFS shows twice 
> as much space. However this might be very similar as mounting the same 
> harddrive on your system twice.


UBIFS really needs to know size of the volume it sits on. UBIFS has
per-LEB data (lprops, or LEB properties) stored in LPT (lprops tree).
The size of the tree depends on volume size. And we reserve certain
amount of LEBs for LPT at the beginning of the volume.

But what exactly would you like to have? Would you like to have UBI
volumes with no size at all - unbounded / unlimited? Or you would like
to have UBI volumes with size, but larger than the amount of available
PEBs?


> Question 2: Can UBIFS handle UBI resizes easier ?


Somewhat, but we did not pay much attention to this feature, because
we did not need it.

In UBIFS we have LPT which is a B-tree. We try to keep it as small as
possible, because it is changed a lot. The tree nodes are packed very
nicely, so that we use bit-fields as pointers there. UBIFS has to
reserve some space for this tree. And the amount of space it reserves
limits the LPT limits its maximum size. Here is text which tells
about this a bit.

http://www.linux-mtd.infradead.org/faq/ubifs.html#L_max_leb_cnt

Note, small LPT area also means faster LPT handling, because in this
case the keys in the LPT nodes are shorter.


> I have not looked at all at the inner working of UBIFS, so I do not dare 
> to say anything sensible.


Well, in short:

  * it is easy to enlarge UBIFS. Just select proper -c option.
  * to shrink UBIFS, you need a special user-space utility, or you
    need to implement a special UBIFS "shrink" ioctl. When shrinking,
    you need to ask UBIFS to move data from last LEBs closer to the
    beginning of the volume (or do this with a user-space utility,
    but this is more difficult to implement).


> However making the UBI volume smaller, makes UBIFS complain that the 
> amount of LEBs is incorrect.


Yes, because UBIFS stores the volume size in the super-block. And
actually in master node. For sure this redundancy is insane, and
I wanted to fix this, but then I realized it is too late to change
the on-flash format.

Anyway, a small ioctl which asks UBIFS to shrink needs to be done.
But I think it must not be too difficult to implement. It is about:

1. Garbage-collecting as much as possible to get rid of dirty space.
2. When garbage collect, do this a little differently than usually,
   and you should move data to the beginning. Even LEBs with no dirt
   but which sit at the end should be moved to the beginning with GC.

I mean, most of the code to do this is there already.


> I encountered (in ubidesign.pdf) "Note, that by default UBI will not 
> reduce the size of dynamic volumes unless the number range of logical 
> erase blocks which will be removed from the volume contains only unused 
> blocks. A specical parameter allows to override this default.".
> What is this "special parameter" ?


I'm not sure. Probably Adrian knows?


> If UBI (and UBIFS) sizes would become non-fixed, it would prevent the 
> need for resizing at all. 


Not sure what exactly you mean. UBI volumes are re-sizable. UBIFS may
be shrinked with some tricks.


> It might ease the usage of ubi, for example:
> - When creating ubi images (for production) the ubi size does not 
> matter. (UBI_VTBL_AUTORESIZE_FLG could ultimately be removed)
> - ubimkvol, can be called without specifying any size.
> - no more wasted space in static volumes.
> - bad blocks may be handled easier, as it can simply access the complete 
> pool. No block have to be reserved on front (UBI might however best not 
> hand out those last 10 PEBs)


Still not sure how would this all work. What df would show? If we do not
guarantee we have enough PEBs for each LEB, so UBI would basically does
overcommitments, how do we handle situations when users want to write
more but we do not have PEBs left?


> We currently have the following (working) setup (similar like 
> ubidesign.pdf - chapter 8):
> - We are using a 1024 blocks 128MB nand flash.
> - MTD in 2 partitions
>     - MTD0 contains the bootloader (1 block)
>     - MTD1 contains 1023 blocks in ubi0 (actually 1022 blocks as we are 
> blessed with a bad erase block)


Well, on other silicons you may be blessed with more :-)


> - ubi0 contains 2 volumes.
>     - ubi0_0 which is the root file system (UBIFS on a dynamic volume)
>     - ubi0_1 is the kernel (static volume)
> - The bootloader loads the kernel from the mtd (ubi0). Note: it 
> explicitly uses the volume name ("kernel") and not the volume_id to find 
> the static volume containg


So your boot-loader understands UBI?


> However the limitations currently are:
> - I cannot place the kernel in the rootfs as I do under no circumstance 
> want to implement UBIFS in the bootloader.


Well, u-boot has R/O UBIFS support. But they basically copied UBIFS
from the kernel. Implementing this from scratch is not easy.


> - I do not simply want to run ubiupdatevol on the kernel volume (ubi0_1) 
> as this might leave the kernel unusable
> - For this to be safely possible I want to write the new kernel into 
> ubi0_2 (named: "new").
> - I could then do an (atomic) "ubirename /dev/ubi0 new kernel kernel 
> old" and the new kernel is active
> - I do not wish to have that volume always present (and waste space)
> - I do at this moment not yet know the size of future kernels.



So you want atomic volume upgrade. You could implement a new ioctl for
this and do something like: create a special temporary throw-away
volume, write stuff there, then re-name it to an existing one. I think
this is doable. But of course, you would need to carefully think about
accounting: if the volume becomes larger after upgrade, you need to make
sure you have spare PEBs.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)

--=-WHAxrZtp6yT9nun7RA0j
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/3.24.5">
</HEAD>
<BODY>
Hi,<BR>
<BR>
On Mon, 2009-07-13 at 17:12 +0200, Jelle Martijn Kok wrote:
<BLOCKQUOTE TYPE=CITE>
<PRE>
I have made an &quot;ubirsvol&quot; application (actually it are just some very 
simple changes to your ubimkvol/ubirmvol). If you would like to have it, 
I could sent it.
</PRE>
</BLOCKQUOTE>
<BR>
Sure, why not to have it in ubi-utils?<BR>
<BR>
<BLOCKQUOTE TYPE=CITE>
<PRE>
Question 1: Why do UBI volumes have fixed sizes ?
</PRE>
</BLOCKQUOTE>
<BR>
Hmm, we just designed it this way. We wanted to guarantee that the total<BR>
about of LEBs on UBI device is not larger that the amount of available<BR>
PEB, so that you could write data to all LEBs.<BR>
<BR>
<BLOCKQUOTE TYPE=CITE>
<PRE>
As far as I can see, all unused PEBs only have their EC headers are 
written in the MTD. The volume headers are left unwritten.
</PRE>
</BLOCKQUOTE>
<BR>
Right.<BR>
<BR>
<BLOCKQUOTE TYPE=CITE>
<PRE>
Only PEBs which are attached to a specific volume have their volume 
header set.
</PRE>
</BLOCKQUOTE>
<BR>
Yes. Some LEBs are mapped and contain data, so the corresponding PEBs<BR>
have the VID header. The unmapped LEBs are not associated with any<BR>
PEBs. So there are PEBs which do not have VID header.<BR>
<BR>
But UBI guarantees that all LEBs may be written to at the same time -<BR>
there are enough PEBs reserved.<BR>
<BR>
<BLOCKQUOTE TYPE=CITE>
<PRE>
Is it correct that all unused PEBS are in a pool for the whole ubi 
device, and not in a pool per ubi volume ?
</PRE>
</BLOCKQUOTE>
<BR>
Correct. Every PEB may be used for any LEB in any volume. When you write<BR>
to an un-mapped LEB, the wear-levelling subsystem will pick an<BR>
appropriate PEB.<BR>
<BR>
<BLOCKQUOTE TYPE=CITE>
<PRE>
I do understand that this might make it much harder for UBIFS to 
determine its available space as it could actually mean that two UBIFS 
filesystems which are mounted on the same ubi (eg. ubi0_0 and ubi0_1) 
might see the same amount of available LEBs, and thus UBIFS shows twice 
as much space. However this might be very similar as mounting the same 
harddrive on your system twice.
</PRE>
</BLOCKQUOTE>
<BR>
UBIFS really needs to know size of the volume it sits on. UBIFS has<BR>
per-LEB data (lprops, or LEB properties) stored in LPT (lprops tree).<BR>
The size of the tree depends on volume size. And we reserve certain<BR>
amount of LEBs for LPT at the beginning of the volume.<BR>
<BR>
But what exactly would you like to have? Would you like to have UBI<BR>
volumes with no size at all - unbounded / unlimited? Or you would like<BR>
to have UBI volumes with size, but larger than the amount of available<BR>
PEBs?<BR>
<BR>
<BLOCKQUOTE TYPE=CITE>
<PRE>
Question 2: Can UBIFS handle UBI resizes easier ?
</PRE>
</BLOCKQUOTE>
<BR>
Somewhat, but we did not pay much attention to this feature, because<BR>
we did not need it.<BR>
<BR>
In UBIFS we have LPT which is a B-tree. We try to keep it as small as<BR>
possible, because it is changed a lot. The tree nodes are packed very<BR>
nicely, so that we use bit-fields as pointers there. UBIFS has to<BR>
reserve some space for this tree. And the amount of space it reserves<BR>
limits the LPT limits its maximum size. Here is text which tells<BR>
about this a bit.<BR>
<BR>
<A HREF="http://www.linux-mtd.infradead.org/faq/ubifs.html#L_max_leb_cnt">http://www.linux-mtd.infradead.org/faq/ubifs.html#L_max_leb_cnt</A><BR>
<BR>
Note, small LPT area also means faster LPT handling, because in this<BR>
case the keys in the LPT nodes are shorter.<BR>
<BR>
<BLOCKQUOTE TYPE=CITE>
<PRE>
I have not looked at all at the inner working of UBIFS, so I do not dare 
to say anything sensible.
</PRE>
</BLOCKQUOTE>
<BR>
Well, in short:<BR>
<BR>
&nbsp; * it is easy to enlarge UBIFS. Just select proper -c option.<BR>
&nbsp; * to shrink UBIFS, you need a special user-space utility, or you<BR>
&nbsp;&nbsp;&nbsp; need to implement a special UBIFS &quot;shrink&quot; ioctl. When shrinking,<BR>
&nbsp;&nbsp;&nbsp; you need to ask UBIFS to move data from last LEBs closer to the<BR>
&nbsp;&nbsp;&nbsp; beginning of the volume (or do this with a user-space utility,<BR>
&nbsp;&nbsp;&nbsp; but this is more difficult to implement).<BR>
<BR>
<BLOCKQUOTE TYPE=CITE>
<PRE>
However making the UBI volume smaller, makes UBIFS complain that the 
amount of LEBs is incorrect.
</PRE>
</BLOCKQUOTE>
<BR>
Yes, because UBIFS stores the volume size in the super-block. And actually in master node. For sure this redundancy is insane, and<BR>
I wanted to fix this, but then I realized it is too late to change<BR>
the on-flash format.<BR>
<BR>
Anyway, a small ioctl which asks UBIFS to shrink needs to be done.<BR>
But I think it must not be too difficult to implement. It is about:<BR>
<BR>
1. Garbage-collecting as much as possible to get rid of dirty space.<BR>
2. When garbage collect, do this a little differently than usually,<BR>
&nbsp;&nbsp; and you should move data to the beginning. Even LEBs with no dirt<BR>
&nbsp;&nbsp; but which sit at the end should be moved to the beginning with GC.<BR>
<BR>
I mean, most of the code to do this is there already.<BR>
<BR>
<BLOCKQUOTE TYPE=CITE>
<PRE>
I encountered (in ubidesign.pdf) &quot;Note, that by default UBI will not 
reduce the size of dynamic volumes unless the number range of logical 
erase blocks which will be removed from the volume contains only unused 
blocks. A specical parameter allows to override this default.&quot;.
What is this &quot;special parameter&quot; ?
</PRE>
</BLOCKQUOTE>
<BR>
I'm not sure. Probably Adrian knows?<BR>
<BR>
<BLOCKQUOTE TYPE=CITE>
<PRE>
If UBI (and UBIFS) sizes would become non-fixed, it would prevent the 
need for resizing at all. 
</PRE>
</BLOCKQUOTE>
<BR>
Not sure what exactly you mean. UBI volumes are re-sizable. UBIFS may<BR>
be shrinked with some tricks.<BR>
<BR>
<BLOCKQUOTE TYPE=CITE>
<PRE>
It might ease the usage of ubi, for example:
- When creating ubi images (for production) the ubi size does not 
matter. (UBI_VTBL_AUTORESIZE_FLG could ultimately be removed)
- ubimkvol, can be called without specifying any size.
- no more wasted space in static volumes.
- bad blocks may be handled easier, as it can simply access the complete 
pool. No block have to be reserved on front (UBI might however best not 
hand out those last 10 PEBs)
</PRE>
</BLOCKQUOTE>
<BR>
Still not sure how would this all work. What df would show? If we do not<BR>
guarantee we have enough PEBs for each LEB, so UBI would basically does<BR>
overcommitments, how do we handle situations when users want to write<BR>
more but we do not have PEBs left?<BR>
<BR>
<BLOCKQUOTE TYPE=CITE>
<PRE>
We currently have the following (working) setup (similar like 
ubidesign.pdf - chapter 8):
- We are using a 1024 blocks 128MB nand flash.
- MTD in 2 partitions
    - MTD0 contains the bootloader (1 block)
    - MTD1 contains 1023 blocks in ubi0 (actually 1022 blocks as we are 
blessed with a bad erase block)
</PRE>
</BLOCKQUOTE>
<BR>
Well, on other silicons you may be blessed with more :-)<BR>
<BR>
<BLOCKQUOTE TYPE=CITE>
<PRE>
- ubi0 contains 2 volumes.
    - ubi0_0 which is the root file system (UBIFS on a dynamic volume)
    - ubi0_1 is the kernel (static volume)
- The bootloader loads the kernel from the mtd (ubi0). Note: it 
explicitly uses the volume name (&quot;kernel&quot;) and not the volume_id to find 
the static volume containg
</PRE>
</BLOCKQUOTE>
<BR>
So your boot-loader understands UBI?<BR>
<BR>
<BLOCKQUOTE TYPE=CITE>
<PRE>
However the limitations currently are:
- I cannot place the kernel in the rootfs as I do under no circumstance 
want to implement UBIFS in the bootloader.
</PRE>
</BLOCKQUOTE>
<BR>
Well, u-boot has R/O UBIFS support. But they basically copied UBIFS<BR>
from the kernel. Implementing this from scratch is not easy.<BR>
<BR>
<BLOCKQUOTE TYPE=CITE>
<PRE>
- I do not simply want to run ubiupdatevol on the kernel volume (ubi0_1) 
as this might leave the kernel unusable
- For this to be safely possible I want to write the new kernel into 
ubi0_2 (named: &quot;new&quot;).
- I could then do an (atomic) &quot;ubirename /dev/ubi0 new kernel kernel 
old&quot; and the new kernel is active
- I do not wish to have that volume always present (and waste space)
- I do at this moment not yet know the size of future kernels.
</PRE>
</BLOCKQUOTE>
<PRE>

</PRE>
So you want atomic volume upgrade. You could implement a new ioctl for<BR>
this and do something like: create a special temporary throw-away volume, write stuff there, then re-name it to an existing one. I think<BR>
this is doable. But of course, you would need to carefully think about<BR>
accounting: if the volume becomes larger after upgrade, you need to make<BR>
sure you have spare PEBs.<BR>
<BR>
<TABLE CELLSPACING="0" CELLPADDING="0" WIDTH="100%">
<TR>
<TD>
<PRE>
-- 
Best regards,
Artem Bityutskiy (&#1041;&#1080;&#1090;&#1102;&#1094;&#1082;&#1080;&#1081; &#1040;&#1088;&#1090;&#1105;&#1084;)
</PRE>
</TD>
</TR>
</TABLE>
</BODY>
</HTML>

--=-WHAxrZtp6yT9nun7RA0j--
