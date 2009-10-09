Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1Mw6vU-0004QW-Hr
	for linux-mtd@lists.infradead.org; Fri, 09 Oct 2009 04:18:01 +0000
Message-ID: <4ACEB95C.5080501@nokia.com>
Date: Fri, 09 Oct 2009 07:17:32 +0300
From: Artem Bityutskiy <Artem.Bityutskiy@nokia.com>
MIME-Version: 1.0
To: "ext Narnakaje, Snehaprabha" <nsnehaprabha@ti.com>
Subject: Re: [PATCH] mtd: nand: davinci: fix to use mask_ale from pdata
References: <1254407106-19390-1-git-send-email-hemantp@ti.com>
	<87tyy9dih1.fsf@deeprootsystems.com>
	<7A436F7769CA33409C6B44B358BFFF0C012A6FC76F@dlee02.ent.ti.com>
In-Reply-To: <7A436F7769CA33409C6B44B358BFFF0C012A6FC76F@dlee02.ent.ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: "davinci-linux-open-source@linux.davincidsp.com"
	<davinci-linux-open-source@linux.davincidsp.com>,
	"dbrownell@users.sourceforge.net" <dbrownell@users.sourceforge.net>,
	"Pedanekar, Hemant" <hemantp@ti.com>,
	Kevin Hilman <khilman@deeprootsystems.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"akpm@linux-foundation.org" <akpm@linux-foundation.org>,
	"dwmw2@infradead.org" <dwmw2@infradead.org>
Reply-To: Artem.Bityutskiy@nokia.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/08/2009 06:37 PM, ext Narnakaje, Snehaprabha wrote:
> Andrew,
>
> Could you please apply this patch to the -mm tree and thus queue it up for 2.6.32-rc series?

FYI, this patch is already in the mtd-2.6.git tree. So you should bug
dwmw2 to push it to rc3

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
