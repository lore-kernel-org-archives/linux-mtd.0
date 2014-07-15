Received: from smtprelay04.ispgateway.de ([80.67.31.42])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X76SV-00005b-8q
 for linux-mtd@lists.infradead.org; Tue, 15 Jul 2014 17:24:09 +0000
Received: from [178.26.58.240] (helo=remote.symeo.com)
 by smtprelay04.ispgateway.de with esmtpsa (TLSv1:AES128-SHA:128)
 (Exim 4.68) (envelope-from <christoph.mammitzsch@symeo.com>)
 id 1X76Rv-0004hQ-LE
 for linux-mtd@lists.infradead.org; Tue, 15 Jul 2014 19:23:31 +0200
Message-ID: <53C56392.2070306@symeo.com>
Date: Tue, 15 Jul 2014 19:23:30 +0200
From: Christoph Mammitzsch <Christoph.Mammitzsch@symeo.com>
MIME-Version: 1.0
To: <linux-mtd@lists.infradead.org>
Subject: Re: Disappearing directories (jffs2 on nand flash)
References: <53B6DDA2.7000508@symeo.com>
In-Reply-To: <53B6DDA2.7000508@symeo.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 04.07.2014 19:00, schrieb Christoph Mammitzsch:

> The embedded system in question was running on linux 2.6.38.2, but using
> the nandsim module, I was able to recreate the bug on workstations
> running linux 3.0.0 as well as linux 3.2.0.

Update: I compiled the newest linux kernel (commit
812c5fa82bae9f377f49000d7636c19a8b61735c) and ran the test script on
that kernel. The bug still showed 9 out of 10 times.


Regards,

Christoph Mammitzsch
