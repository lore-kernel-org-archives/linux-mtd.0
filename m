From: David Woodhouse <dwmw2@infradead.org>
To: "Fuller, Vernon" <Vernon.Fuller@avocent.com>
In-Reply-To: <1EF69AC43C5ABC49985E42B84575ADB702F485D6@hsv-email.corp.avocent.com>
References: <1EF69AC43C5ABC49985E42B84575ADB702F485D6@hsv-email.corp.avocent.com>
Content-Type: text/plain
Message-Id: <1101926222.7111.127.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Wed, 01 Dec 2004 18:37:02 +0000
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 as root - magic bitmask not found errors- bad superblock?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2004-12-01 at 11:52 -0600, Fuller, Vernon wrote:
> VFS: root name <1f:00>

That's mtdblock0. If you must use devfs, try root=/dev/mtdblock/2

-- 
dwmw2
