Subject: Re: Root mounting time
From: David Woodhouse <dwmw2@infradead.org>
To: Davide CASCONE <davide.cascone@st.com>
In-Reply-To: <001c01c68a2c$2a67d600$253682a4@nap.st.com>
References: <001c01c68a2c$2a67d600$253682a4@nap.st.com>
Content-Type: text/plain
Date: Wed, 07 Jun 2006 13:28:12 +0100
Message-Id: <1149683292.13596.74.camel@pmac.infradead.org>
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

On Wed, 2006-06-07 at 14:16 +0200, Davide CASCONE wrote:
> I'm working in XIP mode on a OMAP platform using Sibley device in
> burst mode (burst frequency = 48MHz). I see that it's necessary about
> 1 sec to mount JFFS2 on a 1MB root image. Do you feel this is a
> reasonable time? How long does it usually take to mount the JFFS2 on a
> typical root image? 

Are you using the current git tree and summary support?

I can mount a 512MiB NAND flash in 5.9s on hardware where I get only
2.7MiB/s transfer speed from the flash. Mounting 1MiB from NOR flash
really shouldn't be that slow.

Profile the current code and show where it takes all the time.

I have plans to halve the size of the summary nodes, which should go
into the git tree this week too. 

-- 
dwmw2
