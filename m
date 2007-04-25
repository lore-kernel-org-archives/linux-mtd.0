Received: from [67.18.166.194] (helo=warp.phpwebhosting.com)
	by canuck.infradead.org with smtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HgjXk-0002eO-J0
	for linux-mtd@lists.infradead.org; Wed, 25 Apr 2007 11:36:34 -0400
Message-ID: <462F757A.7010103@indefia.com>
Date: Wed, 25 Apr 2007 18:36:26 +0300
From: Semih Hazar <semih.hazar@indefia.com>
MIME-Version: 1.0
To: akorolev <alexey.korolev@intel.com>
Subject: Re: Slow NAND + JFFS2
References: <462F45B1.8020007@indefia.com> <462F6938.90903@intel.com>
In-Reply-To: <462F6938.90903@intel.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

akorolev wrote:
> You may try to clarify if compression is off.
Setting compression mode to "no compression" speeds it a lot.
This time copying a 40 meg file takes 21 seconds. (from NAND to NAND as 
in the first case)

Thanks
