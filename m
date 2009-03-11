Received: from fgwmail7.fujitsu.co.jp ([192.51.44.37])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1LhKWR-0000XP-7e
	for linux-mtd@lists.infradead.org; Wed, 11 Mar 2009 09:14:46 +0000
Received: from m5.gw.fujitsu.co.jp ([10.0.50.75])
	by fgwmail7.fujitsu.co.jp (Fujitsu Gateway) with ESMTP id
	n2B9EM1a006280 for <linux-mtd@lists.infradead.org> (envelope-from
	iram.shahzad@jp.fujitsu.com); Wed, 11 Mar 2009 18:14:22 +0900
Received: from smail (m5 [127.0.0.1])
	by outgoing.m5.gw.fujitsu.co.jp (Postfix) with ESMTP id E0D7A45DE55
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Mar 2009 18:14:21 +0900 (JST)
Received: from s5.gw.fujitsu.co.jp (s5.gw.fujitsu.co.jp [10.0.50.95])
	by m5.gw.fujitsu.co.jp (Postfix) with ESMTP id C2BAF45DE53
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Mar 2009 18:14:21 +0900 (JST)
Received: from s5.gw.fujitsu.co.jp (localhost.localdomain [127.0.0.1])
	by s5.gw.fujitsu.co.jp (Postfix) with ESMTP id A0D19E08006
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Mar 2009 18:14:21 +0900 (JST)
Received: from m107.s.css.fujitsu.com (m107.s.css.fujitsu.com [10.249.87.107])
	by s5.gw.fujitsu.co.jp (Postfix) with ESMTP id 5823A1DB8014
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Mar 2009 18:14:21 +0900 (JST)
Received: from m107.css.fujitsu.com (m107 [127.0.0.1])
	by m107.s.css.fujitsu.com (Postfix) with ESMTP id 294902C00D7
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Mar 2009 18:14:21 +0900 (JST)
Received: from sky (x154150.ao.fst.fujitsu.com [10.90.154.150])
	by m107.s.css.fujitsu.com (Postfix) with SMTP id BD5742C00CC
	for <linux-mtd@lists.infradead.org>;
	Wed, 11 Mar 2009 18:14:20 +0900 (JST)
Message-ID: <F8252D21B3AD45E1A003F69611EA04E0@sky>
From: "Iram Shahzad" <iram.shahzad@jp.fujitsu.com>
To: <linux-mtd@lists.infradead.org>
Subject: UBIFS recovery truncates file to zero size
Date: Wed, 11 Mar 2009 18:16:04 +0900
MIME-Version: 1.0
Content-Type: text/plain; format=flowed; charset="iso-2022-jp";
	reply-type=original
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi

I am having the following problem with UBIFS (Linux 2.6.25 + ubifs-v2.6.25).
Please could you tell me if this is a known issue.

Problem
    If the power is switched off abruptly while a file is being written,
    in the next boot the contents of the file is lost. That is, the file
    becomes zero sized. The problem is reproducable.

Thanks in advance.
Iram
