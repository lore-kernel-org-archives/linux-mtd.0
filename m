Received: from ussvlmgty02.spansion.com ([12.151.36.113])
	by bombadil.infradead.org with esmtp (Exim 4.72 #1 (Red Hat Linux))
	id 1OaobU-0001gT-Qz
	for linux-mtd@lists.infradead.org; Mon, 19 Jul 2010 11:33:49 +0000
Message-ID: <4C443818.5050400@spansion.com>
Date: Mon, 19 Jul 2010 13:33:44 +0200
From: Gernot Hoyler <Gernot.Hoyler@spansion.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
Subject: Re: Re: [PATCH] mtd: cfi_cmdset_0002: fix the check for valid primary
	extension versions
References: <20100702123910.24930.73018.stgit@dev.siriade.com>
In-Reply-To: <20100702123910.24930.73018.stgit@dev.siriade.com>
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

 > Valid primary extension versions are: 1.0, 1.1, 1.2, 1.3 [1][2].
 > Fix the check in cfi_cmdset_0002 accordingly.
 > ...

I would prefer not to remove CFI 1.4 support from the AMD/Spansion 
driver. For example, the Spansion S29WS-P device family uses CFI version 
1.4, see page 90 of the datasheet 
http://www.spansion.com/Support/Datasheets/s29ws-p_00_a12_e.pdf.

--Gernot
