Subject: Re: JFFS2 mounting
From: David Woodhouse <dwmw2@infradead.org>
To: Davide CASCONE <davide.cascone@st.com>
In-Reply-To: <000d01c6939d$9f056fc0$253682a4@nap.st.com>
References: <000d01c6939d$9f056fc0$253682a4@nap.st.com>
Content-Type: text/plain
Date: Mon, 19 Jun 2006 13:56:33 +0100
Message-Id: <1150721793.3176.421.camel@pmac.infradead.org>
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

On Mon, 2006-06-19 at 14:41 +0200, Davide CASCONE wrote:
> I have an OMAP5912 OSK platform and I'm using Linux in XIP mode from a
> Sibley flash. I have the Linux OS image on the first flash bank and
> the JFFS2 root image on the second flash bank. I have configured the
> flash and the memory controller in burst mode and I have enabled the
> data cache on the flash. During the JFFS2 mounting phase I thought
> every read would have been performed in burst mode x8 (because the
> data cache is enabled), while it seems some reads are performed in
> asynchronous mode. Why are some reads performed in asynchronous mode?
> Does JFFS2 always use the low level driver read function
> (cfi_intelext_read) to read the flash? 

During mount, the current code should _never_ use the read function, if
it has a direct pointer to the flash chip which it can use instead.

-- 
dwmw2
