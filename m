From: purushn@future.futsoft.com (Purushothaman N)
Date: Tue, 18 Feb 2003 19:59:45 +0530
Subject: CFI device detection fails
Message-ID: <002701c2d75a$2fb4c600$1504060a@future.futsoft.com>
To: linux-mtd@lists.infradead.org
List-Id: linux-mtd.lists.infradead.org

Dear All,

I am very new to linux kernel.
I am having AM29LV260DB flash chips (2MB * 4 chips) in my target
board.

I wanted to use CRAMFS for my target board and hence i enabled MTD and
CFI in my linux kernel.

But cfi_probe is failing and it displays
"Physically mapped device : Found no cfi device at location 0".

I tried printing the values read in the flash. It is always 0xffff even
after
writing the query message into it. I doubt even whether the query message
is written properly into it.

Target board details:

IDT mips processor 32332.
Flash at address - 0x4000000 (logical address - 0xa4000000)

I would appreciate if somebody helps me to solve this issue.

Thanks and Regards,
Purush

***************************************************************************
This message is proprietary to Future Software Limited (FSL) 
and is intended solely for the use of the individual to whom it
is addressed. It may contain  privileged or confidential information 
and should not be circulated or used for any purpose other than for 
what it is intended. 

If you have received this message in error, please notify the
originator immediately. If you are not the intended recipient,
you are notified that you are strictly prohibited from using,
copying, altering, or disclosing the contents of this message. 
FSL accepts no responsibility for loss or damage arising from 
the use of the information transmitted by this email including
damage from virus.
***************************************************************************
