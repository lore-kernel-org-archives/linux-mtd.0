From: David Woodhouse <dwmw2@infradead.org>
To: Shen Aaron-r62966 <Aaron.Shen@motorola.com>
In-Reply-To: <01139FC052A0D411900B00508B9535FC102796E8@ZCH07EXM04.corp.mot.com>
References: 
	 <01139FC052A0D411900B00508B9535FC102796E8@ZCH07EXM04.corp.mot.com>
Content-Type: text/plain
Message-Id: <1079689847.16952.260.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Fri, 19 Mar 2004 09:50:48 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: RE: JFFS2 Errors
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 2004-03-19 at 17:13 +0800, Shen Aaron-r62966 wrote:
>  I have been aware of it after some research. The block size of my Flash 
> seems to be 256KiB, which need the erasesize to be set to 0x40000.
> But after I re-build the JFFS2 rootdisk, the following messege are still shown
> althought it will not influence mounting operation.

Is this on a completely clean file system image created by mkfs.jffs2?
Or are the CRC errors on nodes which were written by the kernel itself?

-- 
dwmw2
