Received: from [203.197.252.75] (helo=lexus.moschip.com)
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1IW2bi-0002kd-7I
	for linux-mtd@lists.infradead.org; Fri, 14 Sep 2007 00:16:44 -0400
Message-ID: <000801c7f685$1be627a0$8502a8c0@cayenne>
From: "jameesh" <jameeshk@moschip.com>
To: <linux-mtd@lists.infradead.org>
Subject: device_type and interleave.
Date: Fri, 14 Sep 2007 09:39:55 +0530
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-8859-1";
	reply-type=original
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

    I am confused with the parameters "device_type & interleave" in 
"flash_info" structure.
    I have a board with Flash CFI 0002 commandset complaint flash. Flash is 
in byte mode.
    I am getting device_type variable as 2, and interleave as 1. Thus in

    "cfi_send_gen_cmd" I am getting  wrong command address "0x554" from 
"cfi_build_cmd_addr".
    presently I am doing a fix with a simple change in the MACRO.

    Please help me by giving significance of "device_type & interleave" 
variable.
    Why I am getting such an issue, is it because of a board level issue?

Thanks & Regards
Jameesh 
