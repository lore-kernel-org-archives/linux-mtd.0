Received: from gw.voda.cz ([212.24.154.90] helo=smtp.voda.cz)
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1DElJV-0001Q1-3n
	for linux-mtd@lists.infradead.org; Fri, 25 Mar 2005 04:41:09 -0500
Received: from localhost (localhost [127.0.0.1])
	by smtp.voda.cz (Postfix) with ESMTP id DC739117D7
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Mar 2005 10:41:09 +0100 (CET)
Received: from smtp.voda.cz ([127.0.0.1])
	by localhost (gw [127.0.0.1]) (amavisd-new, port 10024) with ESMTP
	id 04198-08 for <linux-mtd@lists.infradead.org>;
	Fri, 25 Mar 2005 10:40:56 +0100 (CET)
Received: from [10.1.1.111] (unknown [10.1.1.111])
	by smtp.voda.cz (Postfix) with ESMTP id 3DC38117DC
	for <linux-mtd@lists.infradead.org>;
	Fri, 25 Mar 2005 10:40:55 +0100 (CET)
Message-ID: <4243DCA5.9010802@voda.cz>
Date: Fri, 25 Mar 2005 10:40:53 +0100
From: =?ISO-8859-2?Q?Tom=E1=B9_Vr=E1na?= <tom@voda.cz>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-2; format=flowed
Content-Transfer-Encoding: 7bit
Subject: MX29LV160BTC problem
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

I'm trying to use a MX29LV160BTC flash on a MIPS board under 2.6.11rc4 
kernel. I can detect it, I can read it, I can even write it - but the 
data is not there after write. I remember having this problem on 2.4.x 
kernel some time ago, but after a MTD update it just suddenly went 
away... Does thiss remind you of something similar ? Can you please 
direct where to look further ?.

    Thanks, Tom

-- 
 Tomas Vrana  <tom@voda.cz>
 --------------------------
 VODA IT consulting, Borkovany 48, 691 75
 http://www.voda.cz/
 phone: +420 519 419 416 mobile: +420 603 469 305 UIN: 105142752
