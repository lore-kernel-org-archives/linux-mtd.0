From: David Woodhouse <dwmw2@infradead.org>
To: simon@baydel.com
In-Reply-To: <698FD51A64D6@baydel.com>
References: <4034E8ED.5757.55A2D9@localhost> <6971771D4E8E@baydel.com>
	 <1077634573.7826.449.camel@hades.cambridge.redhat.com>
	 <698FD51A64D6@baydel.com>
Content-Type: text/plain
Message-Id: <1077636903.7826.487.camel@hades.cambridge.redhat.com>
Mime-Version: 1.0
Date: Tue, 24 Feb 2004 15:35:04 +0000
Content-Transfer-Encoding: 7bit
cc: linux-mtd@lists.infradead.org
Subject: Re: JFFS2 Corruption.
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2004-02-24 at 14:58 +0000, Simon Haynes wrote:
> I have just created the fs with a rw mtdblock kernel and rebooted with a ro 
> mtdblock. This attempts to remount rw but it cannot.

Hmm. OK, hack jffs2 to use the same major number as ramdisk, then try to
mount /dev/ram2 instead :)


-- 
dwmw2
