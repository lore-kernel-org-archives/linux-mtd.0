Received: from mail-ew0-f213.google.com ([209.85.219.213])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OLfqQ-0002En-4Z
	for linux-mtd@lists.infradead.org; Mon, 07 Jun 2010 17:10:39 +0000
Received: by ewy5 with SMTP id 5so806900ewy.20
	for <linux-mtd@lists.infradead.org>;
	Mon, 07 Jun 2010 10:10:36 -0700 (PDT)
Message-ID: <4C0D2898.5060404@mvista.com>
Date: Mon, 07 Jun 2010 21:12:56 +0400
From: Valentine Barshak <vbarshak@mvista.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: AMD/Fujitsu (cfi_cmdset_0002) lock/unlock implementation question.
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Is anybody working on adding lock/unlock functionality to the 
cfi_cmdset_0002.c?
This stuff seems highly h/w-dependent. I'm interested in particular in 
sector lock/unlock functionality for S29GL-N Spansion chips.
Any info regarding this feature for cmdset_0002 is greatly appreciated.

Thanks,
Val.
