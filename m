Received: from mga03.intel.com ([143.182.124.21] helo=azsmga101-1.ch.intel.com)
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1FQhrf-0004Wa-6i
	for linux-mtd@lists.infradead.org; Tue, 04 Apr 2006 05:30:48 -0400
Message-ID: <44323C9A.2050406@intel.com>
Date: Tue, 04 Apr 2006 13:30:02 +0400
From: "Alexey, Korolev" <alexey.korolev@intel.com>
MIME-Version: 1.0
To: Jason Chen <jason_chen@usish.com>
References: <001e01c64a28$a55fe3f0$6601a8c0@IT0010600>
In-Reply-To: <001e01c64a28$a55fe3f0$6601a8c0@IT0010600>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: CFI 1.4 intel cmdset in linux-2.4.21
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Chen,

It looks that you have updated MTD of Linux 2.4.21. Default MTD of Linux 
2.4.21 doesn't attempt to parse h/w partitions.

To avoid issues I would recommend you to use Linux 2.4.21 without 
additional MTD patches.
This case just substitution of '3' for '4' in cfi_cmdset_0001.c will 
help you.

Thanks,
Alexey
