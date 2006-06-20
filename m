Subject: Re: JFFS2 mounting performance improvement
From: David Woodhouse <dwmw2@infradead.org>
To: Davide CASCONE <davide.cascone@st.com>
In-Reply-To: <000601c69443$1c7de450$253682a4@nap.st.com>
References: <000601c69443$1c7de450$253682a4@nap.st.com>
Content-Type: text/plain
Date: Tue, 20 Jun 2006 09:47:54 +0100
Message-Id: <1150793274.3176.469.camel@pmac.infradead.org>
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

On Tue, 2006-06-20 at 10:25 +0200, Davide CASCONE wrote:
> 
> It seems that during the JFFS2 mounting, the file system uses the
> function cfi_intelext_point (in jffs2_scan_medium function) to point
> to the flash memory. This function refers to the flash memory using
> the virtual address (map->virt). But if the flash is cached and the
> burst mode is enabled, it should be better to refer to the flash with
> the address map->cached (in the same way of cfi_intelext_read
> function, that calls the map_copy_from function, in which there is a
> check to verify if the flash is cached). This improves in a
> considerable way the performance during the mounting phase, reducing
> the mounting time. 
> What do you think about? Do you agree with me? 

Yes. As long as you handle the cache invalidation where appropriate, you
should definitely use the cached address for the 'point' function.

> Do you know if there are other points in JFFS2 code that uses the
> virtual address map->virt instead of map->cached. 

JFFS2 wouldn't touch that directly. It's down to the chip driver. JFFS2
just uses the read() and point() methods (during scan), so I think the
answer would be 'no'.

-- 
dwmw2
