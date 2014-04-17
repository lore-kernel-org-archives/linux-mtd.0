Received: from mail-pb0-f46.google.com ([209.85.160.46])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wamzt-0007lD-Vm
 for linux-mtd@lists.infradead.org; Thu, 17 Apr 2014 14:09:03 +0000
Received: by mail-pb0-f46.google.com with SMTP id rq2so416990pbb.33
 for <linux-mtd@lists.infradead.org>; Thu, 17 Apr 2014 07:08:39 -0700 (PDT)
Received: from [172.16.1.87] ([182.73.114.58])
 by mx.google.com with ESMTPSA id y4sm53786336pbk.76.2014.04.17.07.08.37
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
 Thu, 17 Apr 2014 07:08:38 -0700 (PDT)
Message-ID: <534FE062.4080202@mobiveil.com>
Date: Thu, 17 Apr 2014 19:38:34 +0530
From: Brajesh Sharma <s.brajesh@mobiveil.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Need Help in Testing FTL code using NAND simulator
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi All,

I’ve started recently working on FTL thing and now I need some kind of 
help from all of you as I’ve seen similar kind of thread just now.
I'm having a Huge FTL code (block + character) driver which is a linux 
kernel module and is having a specific PCIe based hardware. But i don 
have that H/W so I'll be porting this code for generic Flash device but 
i'm not sure how to test the code in absence pf H/W. I'm removing the 
character driver complications and wanna use just block driver which 
offers management module implementations (bad block , GC, Address 
mapping etc).
I've come across NANDsim which i find can be really useful in my case to 
emulate the virtual flash device in host memory (RAM) . But NANDsim is a 
part of MTD subsystem and My code doesn't have anything to do with MTD. 
SO i'm not sure can i use it with my code. I've seen usage of NANDsim on 
web with mtdblock device & on top of it an NFTL or something else though 
i'm having my own block device driver with FTL implementation in it.

e.g. NFTL/UBIFS --> mtdblock/mtdchar --> Virtual Flash (RAM) using 
NANDsim ....

But for me it'll be like (FTL+block driver) --> Character driver --> 
Virtual Flash (NANDsim)... or do i have any other alternative ????

Any help would be appreciated.



-- Thanks & Regards
Brajesh Sharma
