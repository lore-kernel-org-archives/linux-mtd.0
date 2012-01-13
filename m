Received: from lnx500.hrz.tu-darmstadt.de ([130.83.156.225])
 by casper.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Rld5u-0002tn-UU
 for linux-mtd@lists.infradead.org; Fri, 13 Jan 2012 09:06:44 +0000
Received: from iss1.vlsi.informatik.tu-darmstadt.de
 (iss1.vlsi.informatik.tu-darmstadt.de [130.83.164.1])
 by lnx500.hrz.tu-darmstadt.de (8.14.4/8.14.4/HRZ/PMX) with ESMTP id
 q0D96YvJ024509
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2012 10:06:34 +0100
 (envelope-from tim01@iss.tu-darmstadt.de)
Received: from localhost (localhost [127.0.0.1])
 by iss1.vlsi.informatik.tu-darmstadt.de (Postfix) with ESMTP id 9A02FF4F6
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2012 10:06:34 +0100 (CET)
Received: from iss1.vlsi.informatik.tu-darmstadt.de ([127.0.0.1])
 by localhost (iss1.vlsi.informatik.tu-darmstadt.de [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id ViG7B-r8PyJF for <linux-mtd@lists.infradead.org>;
 Fri, 13 Jan 2012 10:06:34 +0100 (CET)
Received: from lvxen-nx.vlsi (iss5.vlsi.informatik.tu-darmstadt.de
 [130.83.164.5])
 by iss1.vlsi.informatik.tu-darmstadt.de (Postfix) with ESMTP id 86C6D3417
 for <linux-mtd@lists.infradead.org>; Fri, 13 Jan 2012 10:06:34 +0100 (CET)
From: Tim Sander <tim01@iss.tu-darmstadt.de>
To: linux-mtd@lists.infradead.org
Subject: ubiformat & linux 3.0.14-rt
Date: Fri, 13 Jan 2012 10:06:33 +0100
MIME-Version: 1.0
Content-Type: text/plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Message-Id: <201201131006.33998.tim01@iss.tu-darmstadt.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

We are currently using the UBIFS with a preemt rt patched kernel + some local 
platform adaptions. After a firmware update of the root filesystem with 
ubiformat we see the following message on the next reboot:
sched: RT throttling activated

This message is only seen after firmware update so i suspect that the reason 
for this message lies within the ubifs/ubi layer. With the RT enabled kernel 
all interrupt run as realtime tasks. This means that if an interrupt takes too 
much cpu for some time this is noticed by the scheduler and it throttles the 
realtime tasks to 95% of available cpu time. 

This happens with or without of ubifs master for 3.0 applied from
git://git.infradead.org/~dedekind/ubifs-v3.0.git

So is there some condition which causes UBI(FS) to take more time in an 
interrupt routine if the filesystem has been updated? If yes wouldn't it be 
possible to move this work into:
ubifs_bgt0_0

Best regards
Tim
