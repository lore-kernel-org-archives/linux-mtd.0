From: daniel@arbor.com.tw (Daniel Toussaint)
Date: Tue, 11 Mar 2003 10:07:36 +0800
Subject: Suggestions for using a DoC with Linux and a 2.4.20 kernel
References: <000001c2e751$1606b220$19c3580c@who5> <1047340255.2207.10.camel@gobbles>
Message-ID: <3E6D44E8.4040606@arbor.com.tw>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org


Russ Dill wrote:

>On Mon, 2003-03-10 at 15:04, Gregg C Levine wrote:
>  
>
>>Hello from Gregg C Levine
>>I have a statement to make, then the question
>>Okay here's the statement:
>>I have a system running that was freshly installed, and I have a
>>kernel being built from fresh source code. This is an unpatched 2.4.20
>>kernel.
>>
>>Now the question:
>>How do I go about setting things up, so that the kernel can see the
>>DoC on startup, and then work with it? I have turned on the MTD
>>settings in the kernel, and for the DoC driver as well.
>>I can supply further information, including name of distribution, and
>>even supplier of DoC, as well, if needed. 
>>    
>>
>
>are you using the modules? or is it build into the kernel?
>
>modules:
>
>modprobe doc2000
>modprobe doc_probe (at this point it should identify the doc)
>
>then load whatever you need to talk to the doc, like mtdchar, mtdblock,
>nftl, etc
>
>If its built into the kernel, it should detect on boot.
>
>if you are using nftl, you should have access to it at /dev/nftla, and
>the partitions at /dev/nftla1, /dev/nftla2, etc. nftl is a transition
>layer that makes NAND flash look like a normal block device. It does
>wear leveling, bad sector handling, partial writes, etc so that things
>like ext2 and vfat can exist on the NAND flash.
>
>Most of the mtd utils will talk to it via the char device, /dev/mtd0,
>such as doc_loadbios (usually for installing grub), erase, nftl_format,
>etc
>
>If you are using jffs2 on NAND (I'm not sure about this one, because
>I've never tried it) you probably want /dev/mtdblock0.
>
About this using jffs2 on DiskOnChip, etc.
I've tried this a few times, but it doesn't seem to work, and I am 
assuming it can't (not without modifcations)(???)
Is there anyone who can make an authoritive statement on this?

Greetings,

>
>Additional info would probably be helpful, like what steps you are
>taking, and what messages you are getting.
>
>
>______________________________________________________
>Linux MTD discussion mailing list
>http://lists.infradead.org/mailman/listinfo/linux-mtd/
>  
>
