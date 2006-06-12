Subject: Re: FW: JFFS2 Mounting time
From: David Woodhouse <dwmw2@infradead.org>
To: Davide CASCONE <davide.cascone@st.com>
In-Reply-To: <001a01c68df6$750dfcc0$253682a4@nap.st.com>
References: <001a01c68df6$750dfcc0$253682a4@nap.st.com>
Content-Type: text/plain
Date: Mon, 12 Jun 2006 09:14:04 +0100
Message-Id: <1150100044.11159.51.camel@shinybook.infradead.org>
Mime-Version: 1.0
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

On Mon, 2006-06-12 at 10:01 +0200, Davide CASCONE wrote:
> I'm using Linux 2.6.16 with mtd-snapshot-20060504. I mount JFFS2 on
> Sibley device (configured in burst mode with burst frequency of
> 48MHz). If I reserve a 16MByte MTD partition to JFFS2 with 80% file
> system usage, I'm able to mount the root file system in 2.6 sec. Is
> this a reasonable time? Any suggestion to improve the mounting
> performances? Any information about the JFFS2 mounting time with NOR
> devices?

Use the current code from the git tree. Profile it and see where it's
spending the time.

-- 
dwmw2
