Received: from smtprelay04.ispgateway.de ([80.67.29.8])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1U45uO-0006iT-8Y
 for linux-mtd@lists.infradead.org; Sat, 09 Feb 2013 08:35:42 +0000
Received: from [188.22.30.11] (helo=[10.0.0.4])
 by smtprelay04.ispgateway.de with esmtpsa (TLSv1:AES256-SHA:256)
 (Exim 4.68) (envelope-from <christian.riesch@omicron.at>)
 id 1U45ty-00021s-Ij
 for linux-mtd@lists.infradead.org; Sat, 09 Feb 2013 09:35:14 +0100
Message-ID: <51160A3D.2080500@omicron.at>
Date: Sat, 09 Feb 2013 09:35:09 +0100
From: Christian Riesch <christian.riesch@omicron.at>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: cfi_cmdset_0002: reading and writing one time programmable memory
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello,

I would like to extend the AMD command set for reading/writing/locking 
of one time programmable (OTP) memory areas (called secure silicon in 
Spansion device, called extended memory region in Micron devices...). In 
particular I would like to support the 256 byte extended memory region 
of Micron M29EW devices. Currently the code in 
drivers/mtd/chips/cfi_cmdset_0002.c only supports reading of the first 8 
bytes of this memory area.

I have already implemented this support partially, but before posting a 
first patchset, I have a few questions regarding the current code in 
do_read_secsi_onechip() in drivers/mtd/chips/cfi_cmdset_0002.c.

This function first waits for the chip to get into FL_READY state? Could 
the get_chip() function be used instead here?

After sending the 0xaa/0x55/0x88 command to the device, the 
OTP/SecSi/... memory is mapped to addresses 0x00 - 0xff of the device. 
Does this require putting xip_disable/xip_enable around this code? 
Should the cache get invalidated before reading? Should the function get 
marked __xipram?

Thanks for your help!
Christian
