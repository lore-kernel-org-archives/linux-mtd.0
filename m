Subject: Re: [PATCH] MTD: sm_common: split smartmedia and xD table
From: Artem Bityutskiy <dedekind1@gmail.com>
To: Maxim Levitsky <maximlevitsky@gmail.com>
In-Reply-To: <1271690441-25088-1-git-send-email-maximlevitsky@gmail.com>
References: <1271690441-25088-1-git-send-email-maximlevitsky@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Wed, 28 Apr 2010 16:35:18 +0300
Message-ID: <1272461718.7750.32.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 2010-04-19 at 18:20 +0300, Maxim Levitsky wrote:
> 2GB xD card, and 4MB SmartMedia ROM card share same ID, so to make both work
> split xD and smartmedia ID tables.
> 
> Hardware driver must be able to know which type it handles (and probably just one).
> 
> Signed-off-by: Maxim Levitsky <maximlevitsky@gmail.com>

Taken to l2-mtd-2.6.git / dunno

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
