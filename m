Return-path: <owner-mtd@infradead.org>
Received: from majordomo by infradead.org with local (Exim 3.16 #2)
	id 141Dle-0002AB-00
	for mtd-list@infradead.org; Wed, 29 Nov 2000 20:23:50 +0000
Received: from amdext2.amd.com ([163.181.251.1])
	by infradead.org with esmtp (Exim 3.16 #2)
	id 141DlO-00029v-00
	for mtd@infradead.org; Wed, 29 Nov 2000 20:23:48 +0000
Received: from iliad.amd.com (iliad.amd.com [163.181.250.7])
	by amdext2.amd.com (8.9.3/8.9.3/AMD) with SMTP id OAA19899
	for <mtd@infradead.org>; Wed, 29 Nov 2000 14:23:02 -0600 (CST)
From: mark.langsdorf@amd.com
Received: from txexmta8.amd.com (txexmta8.amd.com [163.181.3.118])
	by amdint2.amd.com (8.9.3/8.9.3/AMD) with ESMTP id OAA04986
	for <mtd@infradead.org>; Wed, 29 Nov 2000 14:23:01 -0600 (CST)
Message-ID: <0FA1031B65A9D111960900805F9FA8E103B9F1F5@txexmta8.amd.com>
To: mtd@infradead.org
Subject: inter-module-2.2.17 patch
Date: Wed, 29 Nov 2000 14:23:00 -0600
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Sender: owner-mtd@infradead.org
List-ID: <linux-mtd.lists.infradead.org>

I installed the latest CVS code on my computer today.
After the kernel recompile, I keep getting undefined
references to inter_module_put.

I tried applying the inter-module-2.2.17 patch to
my 2.2.17 kernel, using
'patch -p1 < inter-module-2.2.17.patch'
but I get an immediate error, 
"malformed patch at line 6: #include <linux/smp_lock.h>"

What should I be doing to get the latest MTD code to 
compile against 2.2.17?

Mark Langsdorf
Advanced Micro Devices, Inc             Tel: 512.602.3756
5204 E. Ben White Blvd. M/S 590         Fax: 512.602.5051
Austin, TX 78741                        mark.langsdorf@amd.com



To unsubscribe, send "unsubscribe mtd" to majordomo@infradead.org
