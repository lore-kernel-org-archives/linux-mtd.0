Received: from mail.imc-berlin.de ([217.110.46.186])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1Cmz63-0003W7-4z
	for linux-mtd@lists.infradead.org; Fri, 07 Jan 2005 13:44:28 -0500
Received: from mailserver.berlin.imc-berlin.de
	(mailserver.berlin.imc-berlin.de [10.0.0.19])
	by mail.imc-berlin.de (Postfix) with ESMTP id 6B8322F016
	for <linux-mtd@lists.infradead.org>;
	Fri,  7 Jan 2005 19:44:25 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id 6033111651
	for <linux-mtd@lists.infradead.org>;
	Fri,  7 Jan 2005 19:44:25 +0100 (CET)
Received: from [10.0.2.10] (scholz.berlin.imc-berlin.de [10.0.2.10])
	by mailserver.berlin.imc-berlin.de (Postfix) with ESMTP id B39817A1E
	for <linux-mtd@lists.infradead.org>;
	Fri,  7 Jan 2005 19:44:24 +0100 (CET)
Message-ID: <41DED888.7040508@imc-berlin.de>
Date: Fri, 07 Jan 2005 19:44:24 +0100
From: Steven Scholz <steven.scholz@imc-berlin.de>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <41DED6C5.3080502@imc-berlin.de>
In-Reply-To: <41DED6C5.3080502@imc-berlin.de>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: JFFS2: mount time, SUMMARY and gc.c ?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi there,

> I noticed that "jffs2_gcd_mtd0" is heavily running after boot consuming 
> much time.
> 
> gc.c:jffs2_garbage_collect_pass() gets called very often - 596 times!

Well, actually it is only 293 times.
(My mtd0 has 110 x 64KiB sectors = 7040KiB)

But still why is it done everytime I boot my target?

Thanks.

-- 
Steven Scholz
