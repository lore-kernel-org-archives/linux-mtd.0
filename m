From: timwu@interepoch.com.tw (Tim Wu)
Date: Mon, 24 Mar 2003 10:31:01 +0800
Subject: not enough blocks for JFFS?
Message-ID: <3E7E6DE5.5000003@interepoch.com.tw>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Hi! Everybody:

The system I'm working on use a 4MB NOR flash.
The block size of the 4MB flash is 64KB.
It also has eight smaller(8KB) blocks at bottom.
Since, on this system, I don't have much data to write(less than 10KB),
a CRAMFS(readonly)+JFFS(writable) combination should be pretty good for me.

Here comes the problem.  The bootloader has occupied the first three 8KB 
blocks.  I have only five 8K blocks available for JFFS.  It always fails 
when I overwrite an existed file on the JFFS partition.

I've checked the mailing list archive.  It seems JFFS/JFFS2 needs at 
least five blocks to work and the number '5' is adjustable.  Could 
somebody tell me where I can modify in JFFS source to have it run on 
fewer blocks?

Thanks.
