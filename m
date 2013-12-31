Received: from mail-qc0-f179.google.com ([209.85.216.179])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Vy3Ut-0004KP-Eq
 for linux-mtd@lists.infradead.org; Tue, 31 Dec 2013 17:52:59 +0000
Received: by mail-qc0-f179.google.com with SMTP id i8so12369972qcq.10
 for <linux-mtd@lists.infradead.org>; Tue, 31 Dec 2013 09:52:33 -0800 (PST)
Received: from [192.168.1.118] (24-183-36-139.dhcp.mdsn.wi.charter.com.
 [24.183.36.139])
 by mx.google.com with ESMTPSA id v1sm62630393qas.15.2013.12.31.09.52.32
 for <linux-mtd@lists.infradead.org>
 (version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
 Tue, 31 Dec 2013 09:52:32 -0800 (PST)
Message-ID: <52C30459.7040404@mds.com>
Date: Tue, 31 Dec 2013 11:52:25 -0600
From: Chuck Peplinski <chuck@mds.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Support for Micron N25Q512
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Reply-To: chuck@mds.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello-
We have a board that contains a TI ARM and the Micron N25Q512 and I've 
been working to support it using the mtd driver in a recent Linux 
distribution.  I'd like to bring my code more into alignment with your 
code.  I see a number of things that confuse me.  I understand that this 
is the place to discuss.

I'm working with TI Linux code based on Linux 2.6.
When I refer to "your codebase", I mean
     git://git.infradead.org/linux-mtd.git, SHA1 ID 15b540c.
I have diff'ed this code against what is provided to me in the older 2.6 
version and I understand the differences.  They don't seem to make the 
code work on my board.

Searching the archives, I see that there has recently been activity to 
support a device with this name.  I also see an interesting thread about 
a new framework for SPI-NOR.  And I see reference to a file
     drivers/mtd/devices/st_spi_fsm.c
But I don't see this file in the head of the code base.

- The JEDEC ID that I read is 0x20ba20, while the version in your 
codebase names it 0x20bb20.
- To make the device work, I've had to add code to read the "flag status 
register" and wait for transactions to complete.  This is as illustrated 
in the micron example code available from their web site.  As I hacked 
this into m25p80.c, it is quite specific to my device and not generic.
So that can't be the right way to do it.

I'm familiar with the differences between kernel versions.  I realize my 
code is not the latest, but I am ready to handle things like this.  How 
can I get connected to the latest work in the mtd driver and synchronize 
my work with it?

     Chuck

-- 
Chuck Peplinski
Momentum Data Systems
