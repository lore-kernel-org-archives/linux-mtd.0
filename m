From: kschoo70c@netscape.net (kokseng choo)
Date: Mon, 17 Feb 2003 15:02:25 +0000
Subject: copy filesystem to nand flash without ecc
References: <4EF56021.2C81712E.0265FBE9@netscape.net> <200302131752.54716.tglx@linutronix.de> <3E50D76A.40300@netscape.net> <200302171637.42445.tglx@linutronix.de>
Message-ID: <3E50F981.3050903@netscape.net>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org


>On Monday 17 February 2003 13:36, kokseng choo wrote:
>  
>
>>I also notice that nand.h also define the ecc location for
>>oobsel=NAND_NONE_OOB, which in fact exactly the same as that of JFFS2.
>>Why don't we just add those definitions in  oobconfigs[0] instead of
>>zeroing it? Since a nand driver without ECC is really a bad idea which
>>makes nand_write thus pwrite becomes useless. Can we just have a default
>>"oobsel" during compile time?; which means explicitly
>>define oobconfigs[0] to either JFFS2 or YAFFS or zero through
>>configuration. By doing that, the mtd user does not have to use different
>>API or ioctl to write to the flash. The "cp" utils will just work.
>>    
>>
>Yep, but you still do not write fs-specific information in the OOB-area, 
>except the ecc.
>This still solves not the problem to write a fs-image to the chip. Therefor we
>need a function, which includes writing of OOB data and filesystem dependent 
>oob-layout selection.
>
Yes, but as far as JFFS2 is concerned, the oob_buf is alway null, when 
it calls write_ecc().
If we use MEMWRITE ioctl, I suppose I will pass in NULL also if I am not 
interested in debugging.

>
>  
>
>>As a mtd user at userspace, ideally I would like to use the same pwrite()
>>function for the flash, and I wish I do not have to know what is the
>>flash type I am talking to. All I need to know is I am talking to a
>>mtd device, and I do not have to know anything about ECC, just let
>>the driver handle is implicitly.
>>    
>>
>That's true if you use NAND without a filesystem.
>
I thought that is true also, for JFFS2, as I can see JFFS2 pass in null 
pointer when it calls write_ecc.

>
>  
>
>>I attach a patch which add the default entry for oobconfig[0], I think
>>it will help me a bit as a mtd and JFFS2 user at userspace.
>>Please comment if it does not make sense, thank you.
>>    
>>
>I'm not happy with that, as you force it to JFFS2 layout and therefor YAFFS 
>users _CANNOT_ use it. I will think about a more flexible solution.
>
>  
>
Yes, but I mentioned before, I prefer to use compile time configuration 
to assign the oobconfig[0].
The current patch make use of what you have defined in nand.h which will 
not break anything.
I try to be neutral, othere wise I will use JFFS2 offset in the 
oobconfig[0] instead of  NONE_OOB setting.
If the YAFFS is not going to use OOB, having the ecc in the OOB area 
will not affect them, the
same apply to JFFS2 user if the eccmode is off.

regards
choo

-- 
Your favorite stores, helpful shopping tools and great gift ideas. 
Experience the convenience of buying online with Shop at Netscape! 
http://shopnow.netscape.com/
